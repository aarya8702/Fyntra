package org.marketing.dao;

import java.util.List;

import org.marketing.model.CartItem;
import org.marketing.model.CustomerOrder;
import org.marketing.model.Promotions;
import org.marketing.model.ShippingAddress;
import org.marketing.model.ShoppingCart;
import org.marketing.model.User;

public interface CartItemDao {

	public List<CartItem> findCartItemsByShoppingCart(ShoppingCart shoppingCart);
	
	public List<ShippingAddress> listAllShipping();
	
	public void saveOrUpdate(CartItem cartItem);
	
	public void delete(Long cartId);
	
	public CartItem findCartItemById(Long cartId);
	
	public User getUser(String email);
	
	public Promotions findPromoCodeByName(String promoCode);
	
	public List<CartItem> listCartItemsByOrder(CustomerOrder customerOrder);
	
	
	
	

}
