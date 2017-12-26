package net.ezer.onlineshopping.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.ezer.onlineshopping.service.CartService;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private CartService cartService;
	
	@RequestMapping("/show")
	public ModelAndView showCart(@RequestParam(name = "result", required = false) String result) {
		ModelAndView mv = new ModelAndView("page");
		
		if (result != null) {
			switch (result) {
				case "unavailable":
					mv.addObject("message",
					             "Não foi possivel actualizar");
					break;
				case "added":
					mv.addObject("message",
					             "Produto Successfully Added");
					break;
				case "deleted":
					mv.addObject("message",
					             "Product Removed Successfully");
					break;
			}
		}
		mv.addObject("title",
		             "Cart");
		mv.addObject("userClickShowCart",
		             true);
		mv.addObject("cartLines",
		             cartService.getCartLines());
		return mv;
	}
	
	@RequestMapping("/{cartLineId}/delete")
	public String deleteCart(@PathVariable int cartLineId) {
		String response = cartService.deleteCartLine(cartLineId);
		return "redirect:/cart/show?" + response;
	}
	
	@RequestMapping("/{productId}/add")
	public String addProduct(@PathVariable int productId) {
		String response = cartService.addCartLine(productId);
		return "redirect:/cart/show?" + response;
	}
	
}
