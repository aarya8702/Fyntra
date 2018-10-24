package org.marketing.controller;

import java.security.Principal;
import java.util.List;

import org.marketing.dao.ProductDao;
import org.marketing.dao.RetailerDao;
import org.marketing.model.Product;
import org.marketing.model.Promotions;
import org.marketing.model.Retailer;
import org.marketing.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/retailer")
public class RetailerController {

	@Autowired
	private RetailerDao retailerDao;

	@Autowired
	private ProductDao productDao;

	@RequestMapping(value = "/updateRetailer", method = RequestMethod.GET)
	public ModelAndView updateRetailerForm(
			@AuthenticationPrincipal Principal principal/* @PathVariable("retId") int retId */) {

		ModelAndView model = new ModelAndView("retailer/retailerupdate");
		String email = principal.getName();
		Retailer retailer = retailerDao.findRetailerByEmail(email);
		model.addObject("retailer", retailer);
		return model;
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updateRetailer(@ModelAttribute("retailer") Retailer retailer) {

		retailer.getUser().setEnabled(true);
		retailer.getUser().setIsEmailVerified("Verified");
		retailerDao.update(retailer);
		return "retailer/retaileraccount";

	}

	@RequestMapping(value = "/changePassword", method = RequestMethod.GET)
	public String passwordPage() {
		return "retailer/retailerpasswordchange";
	}

	@RequestMapping(value = "/change", method = RequestMethod.POST)
	public String changePassword(@ModelAttribute("currentPass") String currentPassword,
			@ModelAttribute("newPass") String newPass, @AuthenticationPrincipal Principal principal, Model model) {

		String email = principal.getName();
		Retailer retailer = retailerDao.findRetailerByEmail(email);

	
		if (newPass != null && !newPass.isEmpty() && !newPass.equals("")) {
			String dbPassword = retailer.getUser().getPassword();
			if (dbPassword.equals(currentPassword) ) {
				retailer.getUser().setPassword(newPass);
				retailerDao.update(retailer);
				model.addAttribute("success",true);
				System.out.println("hello");
			}else {
				model.addAttribute("Incorrect",true);
				return "retailer/retailerpasswordchange";
			}
		}
		
		return "retailer/retailerpasswordchange";
	}



	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public ModelAndView listRetailerById(@AuthenticationPrincipal Principal principal) {

		ModelAndView model = new ModelAndView("retailer/retailerInfo");
		String email = principal.getName();
		List<Retailer> retailer = retailerDao.ListRetailerById(email);
		model.addObject("list", retailer);
		return model;
	}

	@RequestMapping(value = "/myAccount", method = RequestMethod.GET)
	public ModelAndView myAccount(@AuthenticationPrincipal Principal principal) {
		ModelAndView model = new ModelAndView("retailer/retaileraccount");
		String email = principal.getName();
		Retailer retailer = retailerDao.findRetailerByEmail(email);
		model.addObject("retailer",retailer);
		return model;
	}

	@RequestMapping(value = "/promoAdd", method = RequestMethod.GET)
	public ModelAndView addPromotions() {
		ModelAndView model = new ModelAndView("retailer/promotionAdd");
		model.addObject("promotionForm", new Promotions());
		return model;
	}

	@RequestMapping(value = "/promoSave", method = RequestMethod.POST)
	public ModelAndView savePromotions(@AuthenticationPrincipal Principal principal,
			@ModelAttribute("promotionForm") Promotions promotions) {

		String email = principal.getName();
		User user = retailerDao.getUser(email);
		Retailer retailer = retailerDao.findRetailerByEmail(email);
		promotions.setRetailer(retailer);
		promotions.setUser(user);
		retailerDao.addPromocode(promotions);
		return new ModelAndView("redirect:/retailer/promotionlist");
	}

	@RequestMapping(value = "/promotionlist", method = RequestMethod.GET)
	public ModelAndView listPromotions(@AuthenticationPrincipal Principal principal) {

		ModelAndView model = new ModelAndView("retailer/promotionlist");
		String email = principal.getName();
		List<Promotions> promotions = retailerDao.getPromoDetails(email);
		model.addObject("list", promotions);
		return model;

	}

	@RequestMapping(value = "/apply/{pid}", method = RequestMethod.GET)
	public ModelAndView applyPromoCode(@PathVariable("pid") int pid, @AuthenticationPrincipal Principal principal) {

		String email = principal.getName();
		Promotions promotions = retailerDao.findPromoById(pid);

		List<Product> product = retailerDao.getProductDetails(email);

		for (Product products : product) {

			products.setTemprice(products.getPrice());
			products.setPrice(products.getPrice() - (products.getPrice() * promotions.getDiscount() / 100));
			productDao.update(products);
		}

		return new ModelAndView("redirect:/retailer/product/list");

	}

	@RequestMapping(value = "/cancelPromoCode/{pid}", method = RequestMethod.GET)
	public ModelAndView cancelPromoCode(@PathVariable("pid") int pid, @AuthenticationPrincipal Principal principal) {

		String email = principal.getName();

		List<Product> product = retailerDao.getProductDetails(email);

		for (Product products : product) {

			products.setPrice(products.getTemprice());
			productDao.update(products);
		}

		return new ModelAndView("redirect:/retailer/product/list");

	}

	@RequestMapping(value = "/deleteCode/{pid}", method = RequestMethod.GET)
	public ModelAndView deletePromoCode(@PathVariable("pid") int pid) {

		Promotions promotions = retailerDao.findPromoById(pid);
		retailerDao.deletePromoCode(promotions);
		return new ModelAndView("redirect:/retailer/promotionlist");
	}

}
