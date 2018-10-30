package org.admin.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.admin.model.Authorities;
import org.admin.model.Customer;
import org.admin.model.ShippingAddress;
import org.admin.model.ShoppingCart;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Transactional
public class CustomerDaoImpl implements CustomerDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession() {
		
		return sessionFactory.getCurrentSession();
	}

    @SuppressWarnings("unchecked")
	public List<Customer> listAllCustomer() {

		return getSession().createQuery("from Customer").list();
	}

    
	public void save(Customer customer) {

		customer.getUser().setEnabled(true);
		customer.getUser().setIsEmailVerified("Verified");
		Authorities authorities = new Authorities();
		authorities.setRole("ROLE_USER");
		authorities.setUser(customer.getUser());
	    customer.getUser().setAuthorities(authorities);
	    ShoppingCart shoppingCart = new ShoppingCart();
	    shoppingCart.setCustomer(customer);
	    customer.setShoppingCart(shoppingCart);
		getSession().save(customer);
	}

	public void update(Customer customer) {

		getSession().update(customer);
	}

	public void delete(Customer customer) {

		getSession().delete(customer);
	}

	public Customer findCustomerById(int customerId) {

		Customer customer = (Customer) getSession().get(Customer.class, customerId);
		return customer;
	}

	
	
}
