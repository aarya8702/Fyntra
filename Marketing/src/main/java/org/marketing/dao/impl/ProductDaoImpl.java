package org.marketing.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.marketing.dao.ProductDao;
import org.marketing.model.Product;
import org.marketing.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Transactional
public class ProductDaoImpl implements ProductDao{


	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	
	
	@SuppressWarnings("unchecked")
	public List<Product> listAllProducts() {
		
		return getSession().createQuery("from Product").list();
	}

	public void save(Product product) {

		getSession().save(product);
		
	}
	public void update(Product product) {

		getSession().update(product);
	}

	public void delete(Product product) {
		
		getSession().delete(product);
		
	}

	public Product findProductById(int productId) {
		Product product = (Product)getSession().get(Product.class, productId);
		return product;
	}

	@SuppressWarnings("unchecked")
	public List<Product> searchProductsByCategoryId(String maincategory) {
		
		return getSession().createQuery("from Product as a where a.category = :id").setString("id", maincategory).list();
	}

	@SuppressWarnings("unchecked")
	public List<Product> searchProductsBySearchTerm(String searchString) {
		
		return getSession().createQuery("from Product as a where a.productname = :productname").setString("productname", searchString).list();
	}

	@SuppressWarnings("unchecked")
	public List<Product> findProductsBySubCat1(String subcategory1) {
		
		return getSession().createQuery("from Product as a where a.subcategory1 = :id").setString("id", subcategory1).list();
	}

//	public Retailer getRetailer(String email) {
//
//		Retailer retailer = (Retailer) getSession().get(Retailer.class, email);
//		return retailer;
//	}
	
	public User getUser(String email) {
		User user = (User) getSession().get(User.class, email);
		return user;
	}

	@SuppressWarnings("unchecked")
	public List<Product> ListProductById(int productId) {

		return getSession().createQuery("from Product as a where a.productId = :id").setInteger("id", productId).list();
	}

	public Product findProductByEmail(String email) {
		
		return (Product) getSession().createQuery("from Product as a where user.email = :id").setString("id", email).list().get(0);
	}


	@SuppressWarnings("unchecked")
	public List<Product> blurrySearch(String searchTerm) {


		return getSession().createQuery("from Product as a where a.productname = :productname").setString("productname", searchTerm).list();

	}


		
	


	

}
