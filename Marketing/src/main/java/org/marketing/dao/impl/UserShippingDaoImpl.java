package org.marketing.dao.impl;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.marketing.dao.UserShippingDao;
import org.marketing.model.UserShipping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Transactional
public class UserShippingDaoImpl implements UserShippingDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession() {
		
		return sessionFactory.getCurrentSession();
	}
	
	public void save(UserShipping userShipping) {

	
		getSession().saveOrUpdate(userShipping);
	}

	
	
}
