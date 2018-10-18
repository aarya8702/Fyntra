package org.marketing.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.marketing.dao.CartItemDao;
import org.marketing.model.CartItem;
import org.marketing.model.CustomerOrder;
import org.marketing.model.Promotions;
import org.marketing.model.ShippingAddress;
import org.marketing.model.ShoppingCart;
import org.marketing.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Transactional
public class CartItemDaoImpl implements CartItemDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession() {
		
		return sessionFactory.getCurrentSession();
	}
	@SuppressWarnings("unchecked")
	public List<CartItem> getCartItems(String email) {

		return getSession().createQuery("from CartItem as a where a.user.email = :id").setString("id", email).list();
	}

	public void saveOrUpdate(CartItem cartItem) {


		getSession().saveOrUpdate(cartItem);
		
	}

	public void delete(Long cartId) {

		CartItem cartItem = (CartItem) getSession().get(CartItem.class, cartId);
		getSession().delete(cartItem);
	}
	
	
	public User getUser(String email) {

		User user = (User) getSession().get(User.class, email);
		return user;
	}
	
	public CartItem findCartItemById(Long cartId) {

		CartItem item = (CartItem) getSession().get(CartItem.class, cartId);
		return item;
	}
	
	public Promotions findPromoCodeByName(String promoCode) {

		return (Promotions) getSession().createQuery("from Promotions as a where a.promotioncode = :promotioncode").setString("promotioncode",promoCode).list().get(0);
	}

	@SuppressWarnings("unchecked")
	public List<ShippingAddress> listAllShipping() {

		return getSession().createQuery("from ShippingAddress").list();
	}

	@SuppressWarnings("unchecked")
	public List<CartItem> findCartItemsByShoppingCart(ShoppingCart shoppingCart) {
		
		return getSession().createQuery("from CartItem as a where a.shoppingCart = :cart").setParameter("cart", shoppingCart).list();
	}
	
	@SuppressWarnings("unchecked")
	public List<CartItem> listCartItemsByOrder(CustomerOrder customerOrder) {

		return getSession().createQuery("from CartItem as a where a.customerOrder = :order").setParameter("order", customerOrder).list();
	}

	
}
