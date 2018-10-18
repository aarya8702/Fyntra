package org.admin.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.admin.model.Category;
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

	public void saveOrUpdate(Category category) {

		getSession().saveOrUpdate(category);
	}

	public void delete(Category category) {

		getSession().delete(category);
		
	}

	public Category findCategoryById(String maincategory) {

		Category category = (Category) getSession().get(Category.class, maincategory);
		return category;
	}


	
}
