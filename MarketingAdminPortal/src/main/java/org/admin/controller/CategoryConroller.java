package org.admin.controller;

import java.util.List;


import org.admin.dao.CategoryDao;
import org.admin.dao.SubCat1Dao;
import org.admin.model.Category;
import org.admin.model.SubCategory1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/admin")
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
	
	@RequestMapping(value = "/category/add",method = RequestMethod.GET)
	public ModelAndView addCategory() {
		
		ModelAndView model = new ModelAndView("category/categoryForm");
		model.addObject("categoryForm",new Category());
		return model;
	}
	
	@RequestMapping(value = "/category/save",method = RequestMethod.POST)
	public ModelAndView saveCategory(@ModelAttribute("categoryForm") Category category) {
		
		categoryDao.saveOrUpdate(category);
		return new ModelAndView("redirect:/admin/category/list");
	}
	@RequestMapping(value = "/category/update/{maincategory}",method = RequestMethod.GET)
	public ModelAndView updateCategory(@PathVariable("maincategory") String maincategory) {
		ModelAndView model = new ModelAndView("category/categoryForm");
		model.addObject("categoryForm",categoryDao.findCategoryById(maincategory));
		return model;
	}
	
	@RequestMapping(value = "/category/delete/{maincategory}",method = RequestMethod.GET)
	public ModelAndView deleteCategory(@PathVariable("maincategory") String maincategory) {
		Category category = categoryDao.findCategoryById(maincategory);
		categoryDao.delete(category);
		return new ModelAndView("redirect:/admin/category/list");
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
	
	@RequestMapping(value = "/subcat1/add",method = RequestMethod.GET)
	public ModelAndView addSubCategory1() {
		
		ModelAndView model = new ModelAndView("category/categoryForm1");
		model.addObject("categoryForm1",new SubCategory1());
		model.addObject("categories",categoryDao.listAllCategories());
		return model;
	}
	
	@RequestMapping(value = "/subcat1/save",method = RequestMethod.POST)
	public ModelAndView saveSubCategory1(@ModelAttribute("categoryForm1") SubCategory1 subCat1) {
		subCatDao1.saveOrUpdate(subCat1);
		return new ModelAndView("redirect:/admin/subcat1/list");
	}
	@RequestMapping(value = "/subcat1/update/{subcategory1}",method = RequestMethod.GET)
	public ModelAndView updateSubCategory1(@PathVariable("subcategory1") String subcategory1) {
		ModelAndView model = new ModelAndView("category/categoryForm1");
		model.addObject("categoryForm1",subCatDao1.findSubCat1ById(subcategory1));
		model.addObject("categories",categoryDao.listAllCategories());
		return model;
	}
	
	@RequestMapping(value = "/subcat1/delete/{subcategory1}",method = RequestMethod.GET)
	public ModelAndView deleteSubCategory1(@PathVariable("subcategory1") String subcategory1) {
		SubCategory1 category = subCatDao1.findSubCat1ById(subcategory1);
		subCatDao1.delete(category);
		return new ModelAndView("redirect:/admin/subcat1/list");
	}

}
