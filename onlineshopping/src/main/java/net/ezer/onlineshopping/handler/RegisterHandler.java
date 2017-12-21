package net.ezer.onlineshopping.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.stereotype.Component;

import net.ezer.onlineshopping.model.RegisterModel;
import net.ezer.shoppingbackend.dao.UserDAO;
import net.ezer.shoppingbackend.dto.Address;
import net.ezer.shoppingbackend.dto.Cart;
import net.ezer.shoppingbackend.dto.User;

@Component
public class RegisterHandler {
	
	@Autowired
	private UserDAO userDAO;

	public RegisterModel init() {
		
		return new RegisterModel();
	}
	
	public void addUser(RegisterModel registerModel, User user) {
		
		registerModel.setUser(user);
	}
	
	public void addAddress(RegisterModel registerModel, Address address) {
		
		registerModel.setBilling(address);
	}
	
	public String validateUser(User user, MessageContext error) {
		String transitionValue="success";
		
		// check if password matches the confirmPassword
		if(!user.getPassword().equals(user.getConfirmPassword())) {
			
			error.addMessage(new MessageBuilder()
					.error()
					.source("confirmPassword")
					.defaultText("Password does not match the confirm password!")
					.build());
			
			transitionValue = "failure";
		}
		
		//check if the email already exists
		if(!userDAO.getByEmail(user.getEmail()).equals(null)) {
			
			error.addMessage(new MessageBuilder()
					.error()
					.source("email")
					.defaultText("E-mail address is already used!")
					.build());
			
			transitionValue = "failure";
		}
		
		return transitionValue;
	}
	
	public String saveAll(RegisterModel model) {
		String transitionValue = "success";
		
		User user = model.getUser();
		
		if(user.getRole().equals("USER")) {
			
			Cart cart = new Cart();
			cart.setUser(user);
			user.setCart(cart);
		}
		
		userDAO.addUser(user);
		
		Address billing = model.getBilling();
		
		billing.setUser(user);
		billing.setBilling(true);
		
		userDAO.addAddress(billing);
		
		return transitionValue;
	}
}
