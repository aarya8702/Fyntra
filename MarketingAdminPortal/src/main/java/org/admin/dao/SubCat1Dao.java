package org.admin.dao;
import java.util.List;

import org.admin.model.*;
public interface SubCat1Dao {

	public List<SubCategory1> listAllSubCat1();
	
	public void saveOrUpdate(SubCategory1 subCat1);
	
	public void delete(SubCategory1 subCat1);
	
	public SubCategory1 findSubCat1ById(String subcategory1);
	
	public List<SubCategory1> findSubCategory1ByMain(String maincategory);
}
