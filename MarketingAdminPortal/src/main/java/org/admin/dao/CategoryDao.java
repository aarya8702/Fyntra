package org.admin.dao;

import java.util.List;

import org.admin.model.Category;

public interface CategoryDao {

	public List<Category> listAllCategories();
	
	public void saveOrUpdate(Category category);
	
	public void delete(Category category);
	
	public Category findCategoryById(String maincategory);
	
}

