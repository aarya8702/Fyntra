package org.marketing.dao;

import java.util.List;

import org.marketing.model.SubCategory1;

public interface SubCat1Dao {

	public List<SubCategory1> listAllSubCat1();

	public SubCategory1 findSubCat1ById(String subcategory1);

	public List<SubCategory1> findSubCategory1ByMain(String maincategory);
}
