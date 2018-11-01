package org.marketing.dao.impl;

import java.util.Date;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.marketing.dao.PasswordResetTokenForCustomerDao;
import org.marketing.model.Customer;
import org.marketing.model.PasswordResetTokenCustomer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Transactional
public class PasswordResetTokenForCustomerDaoImpl implements PasswordResetTokenForCustomerDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public PasswordResetTokenCustomer findByToken(String token) {
		
		PasswordResetTokenCustomer passwordToken = (PasswordResetTokenCustomer) getSession().get(PasswordResetTokenCustomer.class, token);
		return passwordToken;
	}
	
	
	public void deleteAllExpiredSince(Date now) {
		
		getSession().createQuery("delete from PasswordResetTokenCustomer t where t.expiryDate <= :now").setParameter("now", now).executeUpdate();
		
	}

	public void createPasswordResetTokenForCustomer(final Customer customer, final String token) {
	
		final PasswordResetTokenCustomer passwordResetToken = new PasswordResetTokenCustomer(token,customer);
		getSession().save(passwordResetToken);
		
	}

	
}
