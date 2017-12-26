package net.ezer.shoppingbackend.dao;

import java.util.List;

import net.ezer.shoppingbackend.dto.Cart;
import net.ezer.shoppingbackend.dto.CartLine;

public interface CartLineDAO {

	public CartLine get(int id);
	public boolean add(CartLine cartLine);
	public boolean update(CartLine cartLine);
	public boolean delete(CartLine cartLine);
	public List<CartLine> list(int cartId);
	
	public List<CartLine> listAvailable(int cartId);
	public CartLine getByCartAndProduct(int cartId, int productId);
	
	boolean updateCart(Cart cart);
}
