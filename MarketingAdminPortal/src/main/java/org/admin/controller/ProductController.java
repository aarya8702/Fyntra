package org.admin.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.admin.dao.AncillaryDao;
import org.admin.dao.AncillaryDaoImpl;
import org.admin.dao.CategoryDao;
import org.admin.dao.ProductDao;
import org.admin.dao.SubCat1Dao;
import org.admin.model.Product;
import org.admin.model.SubCategory1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/admin")
public class ProductController {

	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private CategoryDao categoryDao;
	
	@Autowired
	private SubCat1Dao subCat1Dao;
	
	@RequestMapping(value = "/product/list",method = RequestMethod.GET)
	public ModelAndView listProduct(HttpSession session) {
		ModelAndView model = new ModelAndView("product/productList");
		List<Product> product = productDao.listAllProducts();
		model.addObject("lists",product);
		model.addObject("categories",categoryDao.listAllCategories());
		model.addObject("subcat1",subCat1Dao.listAllSubCat1());
		return model;
	}
	

	

}
