package org.marketing.dao;

import java.util.List;

import org.marketing.model.Category;

public interface CategoryDao {

	public List<Category> listAllCategories();
	
	public Category findCategoryById(String maincategory);
	
}

