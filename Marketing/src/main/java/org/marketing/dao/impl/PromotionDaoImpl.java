package org.marketing.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.marketing.dao.PromotionDao;
import org.marketing.model.Promotions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Transactional
public class PromotionDaoImpl implements PromotionDao{

	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@SuppressWarnings("unchecked")
	public List<Promotions> getPromoDetails(String email) {
		
		return getSession().createQuery("from Promotions as a where a.user.email = :id").setString("id", email).list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Promotions> ListAllPromoCode() {
		
		return getSession().createQuery("from Promotions").list();
	}

	@SuppressWarnings("unchecked")
	public List<Promotions> blurrySearch(String searchTerm) {
		
	    return getSession().createQuery("from Promotions as a where a.retailer.street1 like :search or a.retailer.route1 like :search or a.retailer.city1 like :search or a.retailer.state1 like :search or a.retailer.state1 like :search or a.retailer.country1 like :search").setString("search", "%"+searchTerm+"%").list();
	}
	
	public void addPromocode(Promotions promotions) {

		getSession().saveOrUpdate(promotions);
	}

	public Promotions findPromoById(String code) {

		Promotions promotions = (Promotions)getSession().get(Promotions.class, code);
		return promotions;
	}

	public void deletePromoCode(Promotions promotions) {
		
	
		getSession().delete(promotions);
		
	}

	public void update(Promotions promotions) {

		getSession().update(promotions);
	}

	
}
