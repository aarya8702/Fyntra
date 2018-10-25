package org.marketing.controller;

import java.util.List;

import org.marketing.dao.ProductDao;
import org.marketing.dao.RetailerDao;
import org.marketing.model.Product;
import org.marketing.model.Promotions;
import org.marketing.model.Retailer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SearchController {

	@Autowired
	private ProductDao productDao;

	@Autowired
	private RetailerDao retailerDao;

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(@RequestParam(value = "search", required = false) String q, Model model) {

		model.addAttribute("list", productDao.blurrySearch(q));
		model.addAttribute("product",productDao.listAllProducts());
		model.addAttribute("retailer",retailerDao.blurrySearchRetailer(q));
		model.addAttribute("promo", retailerDao.blurrySearch(q));
		return "webpages/gallery";

	}

//	@RequestMapping(value = "/searchProduct", method = RequestMethod.GET)
//	public String searchProducts(@RequestParam(value = "search", required = false) String q, Model model) {
//
//		List<Product> productList = productDao.blurrySearch(q);
//
//		model.addAttribute("list", productList);
//		return "webpages/gallery";
//
//	}
//
//	@RequestMapping(value = "/searchPromotions", method = RequestMethod.GET)
//	public String searchPromotions(@RequestParam(value = "search", required = false) String q, Model model) {
//
//		List<Promotions> promotionList = retailerDao.searchByLocation(q);
//		List<Retailer> retailer = retailerDao.listAllRetailer();
//		List<Product> product = productDao.listAllProducts();
//		model.addAttribute("promo", promotionList);
//		model.addAttribute("retailer", retailer);
//		model.addAttribute("product", product);
//
//		return "webpages/home";
//	}
}
