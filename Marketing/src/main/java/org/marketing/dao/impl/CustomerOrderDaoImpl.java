package org.marketing.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.marketing.dao.CustomerOrderDao;
import org.marketing.model.CustomerOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Transactional
public class CustomerOrderDaoImpl implements CustomerOrderDao{


	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession() {
		
		return sessionFactory.getCurrentSession();
	}
	
	public CustomerOrder createCustomerOrder(CustomerOrder customerOrder) {

		getSession().save(customerOrder);
		return customerOrder;
	}
	
	@SuppressWarnings("unchecked")
	public List<CustomerOrder> listAllOrdersByEmail(String email) {
		
		return getSession().createQuery("from CustomerOrder as a where a.customer.user.email = :id").setString("id", email).list();
	}

	public CustomerOrder findOrderById(int id) {
	
		CustomerOrder customerOrder = (CustomerOrder) getSession().get(CustomerOrder.class, id);
		return customerOrder;
	}

}
