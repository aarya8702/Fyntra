package org.marketing.dao.impl;

import java.util.Date;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.marketing.dao.PasswordResetTokenDao;
import org.marketing.model.PasswordResetToken;
import org.marketing.model.Retailer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Repository;

@Repository
@Transactional
public class PasswordResetTokenDaoImpl implements PasswordResetTokenDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public PasswordResetToken findByToken(String token) {
		
	
		return (PasswordResetToken)getSession().createQuery("from PasswordResetToken as a where a.token = :id").setString("id", token).list().get(0);
	}
	
//	@Scheduled
	public void deleteAllExpiredSince(Date now) {
		
		getSession().createQuery("delete from PasswordResetToken as t where t.expiryDate <= :now").setParameter("now", now).executeUpdate();
		
	}

	public void createPasswordResetTokenForRetailer(final Retailer retailer, final String token) {
	
		final PasswordResetToken passwordResetToken = new PasswordResetToken(token,retailer);
		getSession().save(passwordResetToken);
		
	}

	

	
}
