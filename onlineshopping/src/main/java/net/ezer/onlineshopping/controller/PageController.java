package net.ezer.onlineshopping.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@RequestMapping(value = {"/","/home"})
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title","Home");
		mv.addObject("userClickHome",true);
		
		mv.addObject("categories",categoryDAO.list());
		mv.addObject("products",productDAO.listActiveProducts());
		
		logger.info("Inside PageController index method - INFO");
		logger.debug("Inside PageController index method - DEBUG");
		
		return mv;
	}
	
	@RequestMapping(value = {"/about"})
	public ModelAndView about() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title","About Us");
		mv.addObject("userClickAbout",true);
		return mv;
	}
	
	@RequestMapping(value = {"/contacts"})
	public ModelAndView contacts() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title","Contact Us");
		mv.addObject("userClickContacts",true);
		return mv;
	}
	
	/* Methods to load products and categories*/
	
	
	@RequestMapping(value = {"/show/category/{id}/products"})
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
	
	@RequestMapping(value = {"/show/product/{productId}"})
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
	
	@RequestMapping(value = {"/cart"})
	public ModelAndView showCart() {
		ModelAndView mv = new ModelAndView("page");
		
		mv.addObject("title","Cart");
		mv.addObject("userClickedCart",true);
		return mv;
	}

}
