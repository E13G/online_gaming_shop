package net.ezer.shoppingbackend.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.*;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import net.ezer.shoppingbackend.dao.*;
import net.ezer.shoppingbackend.dto.*;



public class CartLineTestCase {
	
	private static AnnotationConfigApplicationContext context;
	private static CartLineDAO cartLineDAO;
	private static ProductDAO productDAO;
	private static UserDAO userDAO;
	
	private Product product;
	private User user;
	private Cart cart;
	private CartLine cartLine;
	
	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("net.ezer.shoppingbackend");
		context.refresh();
		productDAO = (ProductDAO) context.getBean("productDAO");
		userDAO = (UserDAO) context.getBean("userDAO");
		cartLineDAO = (CartLineDAO) context.getBean("cartLineDAO");
	}
	
	@Test
	public void testAddNewCartLine() {
		//1. get the user
		user = userDAO.getByEmail("j.c.moreirapinto@gmail.com");
		//2.fetch the cart
		cart = user.getCart();
		//3.get the product
		product = productDAO.get(7);
		//4.create new cartline
		cartLine = new CartLine();
		cartLine.setBuyingPrice(product.getPrice());
		cartLine.setProductCount(cartLine.getProductCount()+1);
		cartLine.setTotal(cartLine.getProductCount()*product.getPrice());
		cartLine.setAvailable(true);
		cartLine.setCartId(cart.getId());
		
		cartLine.setProduct(product);
		
		assertTrue(cartLineDAO.add(cartLine));
		
		cart.setTotal(cart.getTotal()+cartLine.getTotal());
		cart.setCartLines(cart.getCartLines()+1);
		assertTrue(cartLineDAO.updateCart(cart));
	}

}
