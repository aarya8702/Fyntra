package org.admin.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.admin.model.SubCategory1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Transactional
public class SubCat1DaoImpl implements SubCat1Dao{

	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@SuppressWarnings("unchecked")
	public List<SubCategory1> listAllSubCat1() {
		return getSession().createQuery("from SubCategory1").list();
	}

	public void saveOrUpdate(SubCategory1 subCat1) {
		// TODO Auto-generated method stub
		getSession().saveOrUpdate(subCat1);
		
	}

	public void delete(SubCategory1 subCat1) {
	
		getSession().delete(subCat1);
		
	}

	public SubCategory1 findSubCat1ById(String subcategory1) {
		// TODO Auto-generated method stub
		SubCategory1 subCat1 = (SubCategory1)getSession().get(SubCategory1.class, subcategory1);
		return subCat1;
	}

	@SuppressWarnings("unchecked")
	public List<SubCategory1> findSubCategory1ByMain(String maincategory) {
		return getSession().createQuery("from SubCategory1 as a where a.category = :id").setString("id", maincategory).list();
	}

}
