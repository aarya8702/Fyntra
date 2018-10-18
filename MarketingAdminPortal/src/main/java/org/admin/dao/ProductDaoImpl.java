package org.admin.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.admin.model.Product;
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

//	public void saveOrUpdate(Product product) {
//
//		getSession().saveOrUpdate(product);
//		
//	}
//
//	public void delete(Product product) {
//		
//		getSession().delete(product);
//		
//	}
//
//	public Product findProductById(int productId) {
//		Product product = (Product)getSession().get(Product.class, productId);
//		return product;
//	}
//
//



}
