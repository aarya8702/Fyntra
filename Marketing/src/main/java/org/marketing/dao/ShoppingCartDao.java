package org.marketing.dao;

import org.marketing.model.ShoppingCart;

public interface ShoppingCartDao {

	public void save(ShoppingCart shoppingCart);
	
	public ShoppingCart findShoppingCartByEmail(String email);
	
	public void updateShoppingCart(ShoppingCart shoppingCart);
}
