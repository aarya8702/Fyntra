package org.marketing.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.marketing.dao.RetailerDao;
import org.marketing.model.Product;
import org.marketing.model.Promotions;
import org.marketing.model.Retailer;
import org.marketing.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Transactional
public class RetailerDaoImpl implements RetailerDao {

	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@SuppressWarnings("unchecked")
	public List<Retailer> listAllRetailer() {

		return getSession().createQuery("from Retailer").list();
	}

	@SuppressWarnings("unchecked")
	public List<Retailer> ListRetailerById(String email) {
		
		return getSession().createQuery("from Retailer as a where a.user.email = :id").setString("id", email).list();
	}
	
	
	public void registerRetailer(Retailer retailer) {

//		retailer.getUser().setEnabled(true);
//
//		Authorities authorities = new Authorities();
//		authorities.setRole("ROLE_RETAILER");
//		authorities.setUser(retailer.getUser());
//		retailer.getUser().setAuthorities(authorities);
		getSession().save(retailer);
	}

	public void delete(Retailer retailer) {

		getSession().delete(retailer);

	}

	public Retailer findRetailerById(int retId) {
		Retailer retailer = (Retailer) getSession().get(Retailer.class, retId);
		return retailer;
	}

	public boolean isEmailUnique(String email) {

		User user = (User) getSession().get(User.class,email);
		if (user == null) {
			
			return true;
		} else {
			return false;

		}

	}

	@SuppressWarnings("unchecked")
	public List<Product> getProductDetails(String email) {
		return getSession().createQuery("from Product as a where a.user.email = :id").setString("id", email).list();
	}
	

	public void update(Retailer retailer) {

		getSession().update(retailer);
		
	}

	public void addPromocode(Promotions promotions) {

		getSession().saveOrUpdate(promotions);
	}

	public User getUser(String email) {
		User user = (User) getSession().get(User.class, email);
		return user;
	}

	@SuppressWarnings("unchecked")
	public List<Promotions> getPromoDetails(String email) {
		
		return getSession().createQuery("from Promotions as a where a.user.email = :id").setString("id", email).list();
	}
	

	public Retailer findRetailerByEmail(String email) {
		
		Retailer retailer = (Retailer) getSession().createQuery("from Retailer as a where a.user.email = :email").setString("email", email).list().get(0);
		
		return retailer;
	}

	public Promotions findPromoById(int pid) {

		Promotions promotions = (Promotions)getSession().get(Promotions.class, pid);
		return promotions;
	}

	public void deletePromoCode(Promotions promotions) {
		
	
		getSession().delete(promotions);
		
	}

	@SuppressWarnings("unchecked")
	public List<Promotions> ListAllPromoCode() {
		
		return getSession().createQuery("from Promotions").list();
	}

	@SuppressWarnings("unchecked")
	public List<Product> listAllProductByRetailer(int retId) {
		
		return getSession().createQuery("from Product as a where a.retailer.retId = :id").setInteger("id", retId).list();
	}

	

}
