package org.admin.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.admin.model.Authorities;
import org.admin.model.Retailer;
import org.admin.model.User;
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

	public void registerRetailer(Retailer retailer) {

		retailer.getUser().setEnabled(true);
		retailer.getUser().setIsEmailVerified("Verified");
		Authorities authorities = new Authorities();
		authorities.setRole("ROLE_RETAILER");
		authorities.setUser(retailer.getUser());
		retailer.getUser().setAuthorities(authorities);
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
	public List<Retailer> ListRetailerById(int retId) {

		return getSession().createQuery("from Retailer as a where a.retId = :id").setInteger("id", retId).list();
	}

	public void update(Retailer retailer) {
	
		getSession().update(retailer);
		
	}

}
