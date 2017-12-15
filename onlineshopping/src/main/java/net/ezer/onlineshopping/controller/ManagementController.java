package net.ezer.onlineshopping.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.ezer.onlineshopping.util.FileUploadUtility;
import net.ezer.onlineshopping.validator.ProductValidator;
import net.ezer.shoppingbackend.dao.CategoryDAO;
import net.ezer.shoppingbackend.dao.ProductDAO;
import net.ezer.shoppingbackend.dto.Category;
import net.ezer.shoppingbackend.dto.Product;

@Controller
@RequestMapping("/manage")
public class ManagementController {
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private ProductDAO productDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(ManagementController.class);
	
	@RequestMapping(value="/products", method =RequestMethod.GET)
	public ModelAndView showManageProducts( @RequestParam(name="operation",required=false) String operation ) {
		ModelAndView mv = new ModelAndView("page");
		
		mv.addObject("userClickManageProducts",true);
		mv.addObject("title","Manage Products");
		
		Product newProduct = new Product();
		
		newProduct.setSupplierId(1);
		newProduct.setActive(true);
		
		mv.addObject("product", newProduct);
		
		if(operation!=null) {
			if(operation.equals("product")) {
				mv.addObject("message","Product Submitted Successfull");
			}
		}
		
		return mv;
	}
	
	@RequestMapping(value="/{id}/product", method =RequestMethod.GET)
	public ModelAndView showEditProduct( @PathVariable int id ) {
		ModelAndView mv = new ModelAndView("page");
		
		mv.addObject("userClickManageProducts",true);
		mv.addObject("title","Manage Products");
		
		Product editProduct = productDAO.get(id);
		
		mv.addObject("product", editProduct);
		
		return mv;
	}
	
	
	@RequestMapping(value="/products", method =RequestMethod.POST)
	public String handleProductSubmission(@Valid @ModelAttribute("product") Product postProduct, BindingResult results, Model model,
			HttpServletRequest request) {
		
		
		//handle image validation for new products
		if(postProduct.getId() == 0) { 
			new ProductValidator().validate(postProduct, results);
		} else {
			if(!postProduct.getFile().getOriginalFilename().equals("")) {
				new ProductValidator().validate(postProduct, results);
			}
		}
		
		// check if there are any errors
		if(results.hasErrors()) {
			
			model.addAttribute("userClickManageProducts",true);
			model.addAttribute("title","Manage Products");
			model.addAttribute("message","Validation failed for Product Submission!");
		
			return "page";
		}
		
		logger.info(postProduct.toString());
		
		if(postProduct.getId() == 0) {
			productDAO.add(postProduct);
		}else {
		
			productDAO.update(postProduct);
		}
		
		if(!postProduct.getFile().getOriginalFilename().equals("")) {
			FileUploadUtility.uploadFile(request,postProduct.getFile(), postProduct.getCode());
		}
		
		return "redirect:/manage/products?operation=product";
	}
	
	@RequestMapping( value="/product/{id}/activation", method=RequestMethod.POST)
	@ResponseBody
	public String handleProductActivation(@PathVariable int id) {
		
		Product product = productDAO.get(id);
		
		boolean isActive = product.isActive();
		
		product.setActive(!isActive);
		
		productDAO.update(product);
		
		return (isActive) ? " You have Successfully deactivated the product " + product.getName()
						  : " You have Successfully activated the product " + product.getName();
	}
	
	
	@ModelAttribute("categories")
	public List<Category> getCategories(){
		
		return categoryDAO.list();
	}

}
