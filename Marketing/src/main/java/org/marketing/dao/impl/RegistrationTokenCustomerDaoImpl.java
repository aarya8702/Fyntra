package org.marketing.dao.impl;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.marketing.dao.RegistrationTokenCustomerDao;
import org.marketing.model.Customer;
import org.marketing.model.RegistrationTokenCustomer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Transactional
public class RegistrationTokenCustomerDaoImpl implements RegistrationTokenCustomerDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public RegistrationTokenCustomer findTokenById(String token) {

		return (RegistrationTokenCustomer) getSession().get(RegistrationTokenCustomer.class, token);
	}

	public void createTokenForCustomer(Customer customer, String token) {

		RegistrationTokenCustomer registrationToken = new RegistrationTokenCustomer(token,customer);
		getSession().save(registrationToken);
	}

}
