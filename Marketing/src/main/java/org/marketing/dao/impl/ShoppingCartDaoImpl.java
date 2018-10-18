package org.marketing.dao.impl;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.marketing.dao.ShoppingCartDao;
import org.marketing.model.ShoppingCart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Transactional
public class ShoppingCartDaoImpl implements ShoppingCartDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	
	public void save(ShoppingCart shoppingCart) {
	
		getSession().save(shoppingCart);
		
	}


	public ShoppingCart findShoppingCartByEmail(String email) {
	
		return (ShoppingCart) getSession().createQuery("from ShoppingCart as a where a.customer.user.email = :email").setString("email", email).list().get(0);
	}


	public void updateShoppingCart(ShoppingCart shoppingCart) {

		getSession().update(shoppingCart);
		
		
	}

	
	
}
