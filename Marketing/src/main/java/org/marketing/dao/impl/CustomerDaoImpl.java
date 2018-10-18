package org.marketing.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.marketing.dao.CustomerDao;
import org.marketing.model.Customer;
import org.marketing.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Transactional
public class CustomerDaoImpl implements CustomerDao {

	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {

		return sessionFactory.getCurrentSession();
	}

	public void registerCustomer(Customer customer) {

//		customer.getUser().setEnabled(true);
//		Authorities authorities = new Authorities();
//		authorities.setRole("ROLE_USER");
//		authorities.setUser(customer.getUser());
//		customer.getUser().setAuthorities(authorities);
		getSession().save(customer);

	}

	public Customer findCustomerByEmail(String email) {

		return (Customer) getSession().createQuery("from Customer as a where a.user.email = :id").setString("id", email)
				.list().get(0);
	}

	@SuppressWarnings("unchecked")
	public List<Customer> listCustomerByEmail(String email) {

		return getSession().createQuery("from Customer as a where a.user.email = :id").setString("id", email).list();
	}

	public void updateCustomer(Customer customer) {

		getSession().update(customer);
	}

	public boolean isEmailUnique(String email) {

		User user = (User) getSession().get(User.class,email);
		if (user == null) {
			return true;
		} else
			return false;
	}

	
	
	public User getUser(String email) {
		User user = (User) getSession().get(User.class, email);
		return user;
	}

}
