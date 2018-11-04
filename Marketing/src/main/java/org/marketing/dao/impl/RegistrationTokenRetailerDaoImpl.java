package org.marketing.dao.impl;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.marketing.dao.RegistrationTokenRetailerDao;
import org.marketing.model.RegistrationTokenRetailer;
import org.marketing.model.Retailer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Transactional
public class RegistrationTokenRetailerDaoImpl implements RegistrationTokenRetailerDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public RegistrationTokenRetailer findTokenById(String token) {
		
		return (RegistrationTokenRetailer) getSession().get(RegistrationTokenRetailer.class, token);
	}

	public void createTokenForRetailer(Retailer retailer, String token) {
		
		RegistrationTokenRetailer registrationToken = new RegistrationTokenRetailer(token,retailer);
		getSession().save(registrationToken);
	}
}
