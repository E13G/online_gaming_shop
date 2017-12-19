package net.ezer.shoppingbackend.dao;

import net.ezer.shoppingbackend.dto.Address;
import net.ezer.shoppingbackend.dto.Cart;
import net.ezer.shoppingbackend.dto.User;

public interface UserDAO {

	// add an user
	boolean addUser(User user);
	User getByEmail(String email);
	
	boolean addAddress(Address address);
	
	boolean updateCart(Cart cart);
}
