package net.ezer.onlineshopping.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.ezer.onlineshopping.exception.ProductNotFoundException;
import net.ezer.shoppingbackend.dao.CategoryDAO;
import net.ezer.shoppingbackend.dao.ProductDAO;
import net.ezer.shoppingbackend.dto.Category;
import net.ezer.shoppingbackend.dto.Product;

@Controller
public class PageController {
	
	private static final Logger logger = LoggerFactory.getLogger(PageController.class);
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private ProductDAO productDAO;
	
	@RequestMapping(value = {"/","/home"},produces = "text/plain;charset=UTF-8")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title","Home");
		mv.addObject("userClickHome",true);
		
		mv.addObject("categories",categoryDAO.list());
		mv.addObject("products",productDAO.listActiveProducts());
		
		return mv;
	}
	
	@RequestMapping(value = {"/about"},produces = "text/plain;charset=UTF-8")
	public ModelAndView about() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title","About Us");
		mv.addObject("userClickAbout",true);
		return mv;
	}
	
	@RequestMapping(value = {"/contacts"},produces = "text/plain;charset=UTF-8")
	public ModelAndView contacts() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title","Contact Us");
		mv.addObject("userClickContacts",true);
		return mv;
	}
	/* Methods to load products and categories*/
	
	
	@RequestMapping(value = {"/show/category/{id}/products"},produces = "text/plain;charset=UTF-8")
	public ModelAndView categoryProducts(@PathVariable("id") int id) {
		ModelAndView mv = new ModelAndView("page");
		
		Category category = null;
		category = categoryDAO.get(id);
	
		mv.addObject("title",category.getName());
		
		//passing the list of categories
		mv.addObject("categories",categoryDAO.list());
		
		//passing the single category object
		mv.addObject("category", category);
		
		mv.addObject("userClickCategoryProducts",true);
		return mv;
	}
	
	@RequestMapping(value = {"/show/product/{productId}"},produces = "text/plain;charset=UTF-8")
	public ModelAndView showSingleProduct(@PathVariable("productId") int productId) throws ProductNotFoundException {
		ModelAndView mv = new ModelAndView("page");
			
		Product product  = null;
		product = productDAO.get(productId);
		
		if(product == null) throw new ProductNotFoundException();
		
		Category category = null;
		category = categoryDAO.get(product.getCategoryId());
		
		//updating the view count
		product.setViews(product.getViews() + 1);
		productDAO.update(product);

		//passing the title, category and product
		mv.addObject("title",product.getName());
		mv.addObject("category", category);
		mv.addObject("product", product);
		
		mv.addObject("userClickSingleProduct",true);
		return mv;
	}
	
	@RequestMapping(value = {"/cart"},produces = "text/plain;charset=UTF-8")
	public ModelAndView showCart() {
		ModelAndView mv = new ModelAndView("page");
		
		mv.addObject("title","Cart");
		mv.addObject("userClickedCart",true);
		return mv;
	}
	
	/* register user*/
	@RequestMapping(value = {"/register"},produces = "text/plain;charset=UTF-8")
	public ModelAndView register() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title","Register");
		
		return mv;
	}
	
	@RequestMapping(value = {"/login"},produces = "text/plain;charset=UTF-8")
	public ModelAndView login(@RequestParam(name = "error", required = false) String error,
            				  @RequestParam(name ="logout", required = false) String logout) {
		ModelAndView mv = new ModelAndView("login");
		
		if(error!=null) {
			mv.addObject("message","Invalid Username or Password!");
		}
		
		if(logout!=null) {
			mv.addObject("logout","Logout was successfull!");
		}
		
		mv.addObject("title","Login");

		return mv;
	}
	
	
	/* access denied page*/
	@RequestMapping(value = {"/access-denied"} ,produces = "text/plain;charset=UTF-8")
	public ModelAndView accessDenied() {
		
		ModelAndView mv = new ModelAndView("error");
		mv.addObject("title","403 - Access Denied");
		mv.addObject("errorTitle","Contact the Admin to gain access to this page!");
		mv.addObject("errorDescription","403 - Access Denied");
		
		return mv;
	}
	
	/* logout*/
	@RequestMapping(value = "/perform-logout", produces = "text/plain;charset=UTF-8")
	public String logount(HttpServletRequest request, HttpServletResponse response) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request,
			                                          response,
			                                          auth);
		}
		return "redirect:/login?logout";
	}

}
