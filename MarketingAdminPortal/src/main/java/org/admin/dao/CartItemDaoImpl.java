package org.admin.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.admin.model.CartItem;
import org.admin.model.CustomerOrder;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
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
	public List<CartItem> listCartItemsByOrder(CustomerOrder customerOrder) {

		return getSession().createQuery("from CartItem as a where a.customerOrder = :order").setParameter("order", customerOrder).list();
	}
}
