package org.marketing.controller;

import java.util.List;

import org.marketing.dao.ProductDao;
import org.marketing.model.Product;
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

	@RequestMapping(value="/searchProduct",method = RequestMethod.GET)
	public String search(@RequestParam(value="search",required = false) String q,Model model) {
		
		List<Product> productList = null;
		try {
			productList = productDao.blurrySearch(q);
		}catch(Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("list",productList);
		return "webpages/gallery";
	}
}
