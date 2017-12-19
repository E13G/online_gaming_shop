package net.ezer.shoppingbackend.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import net.ezer.shoppingbackend.dao.UserDAO;
import net.ezer.shoppingbackend.dto.Address;
import net.ezer.shoppingbackend.dto.Cart;
import net.ezer.shoppingbackend.dto.User;

public class UserTestCase {

	
		private static AnnotationConfigApplicationContext context;
		private static UserDAO userDAO;
		private User user = null;
		private Cart cart = null;
		private Address address = null;
		
		@BeforeClass
		public static void init() {
			context = new AnnotationConfigApplicationContext();
			context.scan("net.ezer.shoppingbackend");
			context.refresh();
			
			userDAO = (UserDAO) context.getBean("userDAO");
		}
		
//		@Test
//		public void testAdd() {
//			//Create User
//			user = new User();
//			user.setFirstName("j");
//			user.setLastName("unit");
//			user.setEmail("junit@jun.it");
//			user.setContactNumber("123456789");
//			user.setRole("USER");
//			user.setPassword("1234");
//			//Add User
//			assertTrue(userDAO.addUser(user));
//			
//			//Create User Address
//			address = new Address();
//			address.setAddressLineOne("Avenida da Liberdade");
//			address.setAddressLineTwo("Avenida da Liberdade");
//			address.setBilling(true);
//			address.setShipping(true);
//			address.setCity("Lisboa");
//			address.setPostalCode("1900");
//			address.setCountry("Portugal");
//			address.setUserId(user.getId());
//			//Add Address
//			assertTrue(userDAO.addAddress(address));
//			
//			
//			if (user.getRole().equals("USER")) {
//				//Create Cart
//				cart = new Cart();
//				cart.setUser(user);
//				//Add Cart
//				assertTrue(userDAO.addCart(cart));
//			}
//		}
		
//		@Test
//		public void testAdd() {
//			//Create User
//			user = new User();
//			user.setFirstName("j");
//			user.setLastName("unit");
//			user.setEmail("junit@jun.it");
//			user.setContactNumber("123456789");
//			user.setRole("USER");
//			user.setPassword("1234");
//			
//			//Create User Address
//			address = new Address();
//			address.setAddressLineOne("Avenida da Liberdade");
//			address.setAddressLineTwo("Avenida da Liberdade");
//			address.setBilling(true);
//			address.setShipping(true);
//			address.setCity("Lisboa");
//			address.setPostalCode("1900");
//			address.setCountry("Portugal");
//			address.setUserId(user.getId());
//			//Add Address
//			assertTrue(userDAO.addAddress(address));
//						
//			if (user.getRole().equals("USER")) {
//				//Create Cart
//				cart = new Cart();
//				cart.setUser(user);
//				user.setCart(cart);
//			}
//			
//			//Add User
//			assertTrue(userDAO.addUser(user));
//		}
		
		@Test
		public void testUpdateCart() {
			
			user = userDAO.getByEmail("junit@jun.it");
			cart = user.getCart();
			System.out.println("===================================");
			System.out.println(cart.toString());
			System.out.println("===================================");
			cart.setTotal(20);
			cart.setCartLines(2);
			assertTrue(userDAO.updateCart(cart));
		}
}
