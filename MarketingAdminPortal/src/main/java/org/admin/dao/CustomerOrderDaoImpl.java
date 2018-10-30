package org.admin.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.admin.model.CustomerOrder;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
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
	
	@SuppressWarnings("unchecked")
	public List<CustomerOrder> listAllCustomerOrders() {

		return getSession().createQuery("from CustomerOrder").list();
	}

	public CustomerOrder findCustomerOrderById(int id) {
		
		CustomerOrder customerOrder = (CustomerOrder) getSession().get(CustomerOrder.class, id);
		return customerOrder;
	}

}
