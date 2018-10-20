package org.marketing.dao.impl;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.marketing.dao.UserBillingDao;
import org.marketing.model.UserBilling;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Transactional
public class UserBillingDaoImpl implements UserBillingDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession() {
		
		return sessionFactory.getCurrentSession();
	}
	public void save(UserBilling userBilling) {

		getSession().saveOrUpdate(userBilling);
		
	}

	
}
