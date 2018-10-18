package org.marketing.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.marketing.dao.CategoryDao;
import org.marketing.model.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Transactional
public  class CategoryDaoImpl implements CategoryDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@SuppressWarnings("unchecked")
	public List<Category> listAllCategories() {

		return getSession().createQuery("from Category").list();
	}
	
	
	public Category findCategoryById(String maincategory) {

		Category category = (Category) getSession().get(Category.class, maincategory);
		return category;
	}


	
}
