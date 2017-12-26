package net.ezer.onlineshopping.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.ezer.onlineshopping.model.UserModel;
import net.ezer.shoppingbackend.dao.CartLineDAO;
import net.ezer.shoppingbackend.dao.ProductDAO;
import net.ezer.shoppingbackend.dto.Cart;
import net.ezer.shoppingbackend.dto.CartLine;
import net.ezer.shoppingbackend.dto.Product;

@Service("cartService")
public class CartService {
	
	@Autowired
	private ProductDAO productDAO;

	@Autowired
	private CartLineDAO cartLineDAO;
	
	@Autowired
	private HttpSession session;
	
	//returns the cart of the user
	private Cart getCart() {
		return ((UserModel) session.getAttribute("userModel")).getCart();
	}
	
	public List<CartLine> getCartLines(){
		
		
		return cartLineDAO.list(this.getCart().getId());
	}


	public String deleteCartLine(int cartLineId) {
		CartLine cartLine = cartLineDAO.get(cartLineId);
		if(cartLine == null){
			return "result=error";
		}else{
			//Update cart
			Cart cart = this.getCart();
			cart.setTotal(cart.getTotal()-cartLine.getTotal());
			cart.setCartLines(cart.getCartLines()-1);
			cartLineDAO.updateCart(cart);
			//remove cartLine
			cartLineDAO.delete(cartLine);
			return "result=deleted";
		}
	}

	public String addCartLine(int productId) {
		
		Cart cart = this.getCart();		
		CartLine cartLine = cartLineDAO.getByCartAndProduct(cart.getId(), productId);
		
		if(cartLine == null){
			//add new cartLine
			cartLine = new CartLine();
			//fetch product
			Product product = productDAO.get(productId);
			cartLine.setCartId(cart.getId());
			cartLine.setProduct(product);
			cartLine.setBuyingPrice(product.getPrice());
			cartLine.setProductCount(1);
			cartLine.setTotal(product.getPrice());
			cartLine.setAvailable(true);
			
			cartLineDAO.add(cartLine);
			cart.setCartLines(cart.getCartLines()+1);
			cart.setTotal(cart.getTotal()+cartLine.getTotal());
			cartLineDAO.updateCart(cart);
			return "result=added";
		}else{
			return null;
		}
	}
}
 