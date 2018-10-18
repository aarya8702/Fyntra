package org.marketing.controller;

import java.util.List;


import org.marketing.dao.CategoryDao;
import org.marketing.dao.SubCat1Dao;
import org.marketing.model.Category;
import org.marketing.model.SubCategory1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CategoryConroller {

	@Autowired
	CategoryDao categoryDao;
	

	@RequestMapping(value = "/category/list",method = RequestMethod.GET)
	public ModelAndView listCategory() {
		ModelAndView model = new ModelAndView("category/categoryList");
		List<Category> category = categoryDao.listAllCategories();
		model.addObject("list",category);
		return model;
	}
	
	
	//////////////////////////////    SUB-CATEGORY1   ////////////////////////////////////////////////////////
	
	@Autowired
	private SubCat1Dao subCatDao1;
	
	@RequestMapping(value = "/subcat1/list",method = RequestMethod.GET)
	public ModelAndView listSubCat1() {
		ModelAndView model = new ModelAndView("category/categoryList1");
		List<SubCategory1> subcategory1 = subCatDao1.listAllSubCat1();
		model.addObject("list",subcategory1);
		return model;
	}

}
