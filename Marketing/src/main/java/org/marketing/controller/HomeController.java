package org.marketing.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.marketing.dao.CategoryDao;
import org.marketing.dao.ProductDao;
import org.marketing.dao.RetailerDao;
import org.marketing.dao.SubCat1Dao;
import org.marketing.model.Category;
import org.marketing.model.Product;
import org.marketing.model.Promotions;
import org.marketing.model.Retailer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	


	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private CategoryDao categoryDao;
	
	@Autowired
	private SubCat1Dao subCat1Dao;
	
	@Autowired
	private RetailerDao retailerDao;
	
	@RequestMapping(value="/404")
	public String notFoundPage(){
	
		return "webpages/404";
	}
	
	@RequestMapping(value = "/",method = RequestMethod.GET)
	public ModelAndView index(HttpSession session) {
		ModelAndView model = new ModelAndView("webpages/home");
		session.setAttribute("categories", categoryDao.listAllCategories());
		session.setAttribute("subcat1",subCat1Dao.listAllSubCat1());
		List<Promotions> promotions = retailerDao.ListAllPromoCode();
		List<Retailer> retailer = retailerDao.listAllRetailer();
		List<Product> product = productDao.listAllProducts();
		model.addObject("product",product);
		model.addObject("promo",promotions);
		model.addObject("retailer",retailer);
		model.addObject("productSize", product.size());
		return model;
	}
	
	@RequestMapping(value = "/gallery",method = RequestMethod.GET)
	public ModelAndView home(){
		ModelAndView model = new ModelAndView("webpages/gallery");
		List<Product> products = productDao.listAllProducts();
		model.addObject("list",products);
		return model;
	}
	
	
	@RequestMapping(value = "/products-by-category-{maincategory}",method = RequestMethod.GET)
	public ModelAndView searchProductByCategory(@PathVariable("maincategory") String maincategory) {
		ModelAndView model = new ModelAndView("webpages/gallery");
		List<Product> products = productDao.searchProductsByCategoryId(maincategory);
		model.addObject("list",products);
		return model;
	}
	
//	@RequestMapping(value = "/gallery",params = "srch-str")
//	public ModelAndView searchProductsBySearch(@RequestParam("srch-str") String searchString) {
//		ModelAndView model = new ModelAndView("webpages/gallery");
//		List<Product> products = productDao.searchProductsBySearchTerm(searchString);
//		model.addObject("list",products);
//		return model;
//	}
	
	@RequestMapping(value = "/products-by-subcategory-{subcategory1}",method = RequestMethod.GET)
	public ModelAndView searchProductBySubCategory(@PathVariable("subcategory1") String subcategory1) {
		ModelAndView model = new ModelAndView("webpages/gallery");
		List<Product> products = productDao.findProductsBySubCat1(subcategory1);
		if(products.isEmpty()) {
			model.addObject("There is no product under this category","error");
		}
		model.addObject("list",products);
		return model;
	}
	
	@RequestMapping(value = "/product-by-{retId}",method = RequestMethod.GET)
	public ModelAndView productsByRetailer(@PathVariable("retId") int retId) {
		
		ModelAndView model = new ModelAndView("webpages/gallery");
		List<Product> products = retailerDao.listAllProductByRetailer(retId);
		model.addObject("list",products);
		return model;
	}
	
	
	@RequestMapping(value = "/viewSingleProduct/{productId}")
	public ModelAndView viewSingleProduct(@PathVariable("productId") int productId) {
		
		ModelAndView model = new ModelAndView("webpages/viewSingleProduct");
		
		Product product = productDao.findProductById(productId);
		List<Integer> qtyList = Arrays.asList(1,2,3,4,5,6,7,8,9,10);
		model.addObject("qtyList",qtyList);
		
		model.addObject("product",product);
		return model;
		
	}
	
	
	
	

}
