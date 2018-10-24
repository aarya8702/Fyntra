package org.marketing.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.security.Principal;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.marketing.dao.CategoryDao;
import org.marketing.dao.ProductDao;
import org.marketing.dao.RetailerDao;
import org.marketing.dao.SubCat1Dao;
import org.marketing.model.Product;
import org.marketing.model.Retailer;
import org.marketing.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/retailer")
public class ProductController {

	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private CategoryDao categoryDao;
	
	@Autowired
	private SubCat1Dao subCat1Dao;
	
	@Autowired
	private RetailerDao retailerDao;
	
	@RequestMapping(value = "/product/list",method = RequestMethod.GET)
	public ModelAndView listProduct(@AuthenticationPrincipal Principal principal) {
		ModelAndView model = new ModelAndView("product/productList");
		String email = principal.getName();
		List<Product> product = retailerDao.getProductDetails(email);
		model.addObject("lists",product);
		model.addObject("categories",categoryDao.listAllCategories());
		model.addObject("subcat1",subCat1Dao.listAllSubCat1());
		return model;
	}
	
	@RequestMapping(value = "/product/add",method = RequestMethod.GET)
	public ModelAndView addProduct(@AuthenticationPrincipal Principal principal) {
		
		ModelAndView model = new ModelAndView("product/productForm");
		model.addObject("productForm",new Product());
		model.addObject("categories",categoryDao.listAllCategories());
		model.addObject("sc",subCat1Dao.listAllSubCat1());
		return model;
	}
	
	@RequestMapping(value = "/product/save",method = RequestMethod.POST)
	public ModelAndView saveProduct(@AuthenticationPrincipal Principal principal,@ModelAttribute("productForm") Product product,HttpSession session) {

		
		
		String email = principal.getName();
		User user = productDao.getUser(email);
		Retailer retailer = retailerDao.findRetailerByEmail(email);
		product.setRetailer(retailer);
		product.setUser(user);
		productDao.save(product);
		
		ServletContext context=session.getServletContext();
		String path = context.getRealPath("/");
		
		System.out.println("Path:" + path);
		
		File file = new File(path +"/WEB-INF/resources/images/"+product.getProductId()+".jpg");
		try {
			byte arr[]=  product.getFile1().getBytes();
			BufferedOutputStream bout = new BufferedOutputStream(new FileOutputStream(file));
			bout.write(arr);
			bout.close();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		//bout.close();
		product.setImageUrl1("images/"+product.getProductId()+".jpg");
		System.out.println("Path  = "+path);
		System.out.println("File = "+file);
		System.out.println("URL = "+product.getImageUrl1());
		
		productDao.update(product);
		return new ModelAndView("redirect:/retailer/product/list");
	}
	
	@RequestMapping(value = "/product/{productId}",method = RequestMethod.GET)
	public ModelAndView updateRetailer(@PathVariable("productId") int productId ) {

		ModelAndView model = new ModelAndView("product/productupdate");
		Product product = productDao.findProductById(productId);
		model.addObject("product",product);
		model.addObject("categories",categoryDao.listAllCategories());
		model.addObject("sc",subCat1Dao.listAllSubCat1());
		return model;
	}

	@RequestMapping(value = "/product/update",method = RequestMethod.POST)
	public ModelAndView updateRetailer(@AuthenticationPrincipal Principal principal,@ModelAttribute("product") Product product,HttpSession session) {
		
		String email = principal.getName();
        User user = productDao.getUser(email);
        Retailer retailer = retailerDao.findRetailerByEmail(email);
        product.setRetailer(retailer);
        product.setUser(user);
        productDao.update(product);
		
		
		ServletContext context=session.getServletContext();
		String path = context.getRealPath("/");
		
		System.out.println("Path:" + path);
		
		File file = new File(path +"/WEB-INF/resources/images/"+product.getProductId()+".jpg");
		try {
			byte arr[]=  product.getFile1().getBytes();
			BufferedOutputStream bout = new BufferedOutputStream(new FileOutputStream(file));
			bout.write(arr);
			bout.close();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		//bout.close();
		product.setImageUrl1("images/"+product.getProductId()+".jpg");
		System.out.println("Path  = "+path);
		System.out.println("File = "+file);
		System.out.println("URL = "+product.getImageUrl1());
		
		productDao.update(product);
		return new ModelAndView("redirect:/retailer/product/list");
	}
	
	@RequestMapping(value = "/product/delete/{productId}",method = RequestMethod.GET)
	public ModelAndView deleteProduct(@AuthenticationPrincipal Principal principal ,@PathVariable("productId") int productId) {
		
		
		Product product = productDao.findProductById(productId);
		productDao.delete(product);
		return new ModelAndView("redirect:/retailer/product/list");
		
	}
	@RequestMapping(value = "/product/info/{productId}",method = RequestMethod.GET)
	public ModelAndView productInfo(@PathVariable("productId") int productId) {
		
	    ModelAndView model = new ModelAndView("product/productinfo");
	    List<Product> product = productDao.ListProductById(productId);
	    model.addObject("list",product);
	    return model;
	}
	
	 

}
