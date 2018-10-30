package org.admin.controller;

import java.util.List;


import org.admin.dao.RetailerDao;
import org.admin.model.Retailer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping(value = "/admin")
public class RetailerController {

	@Autowired
	private RetailerDao retailerDao;
	
	@RequestMapping(value = "/retailer/list",method = RequestMethod.GET)
	public ModelAndView listRetailer() {
		ModelAndView model = new ModelAndView("retailer/retailerList");
		List<Retailer> retailer = retailerDao.listAllRetailer();
		model.addObject("list",retailer);
		return model;
	}
	@RequestMapping(value = "/retailer/add",method = RequestMethod.GET)
	public ModelAndView addRetailer() {
		ModelAndView model = new ModelAndView("retailer/retailerForm");
		model.addObject("retailerForm",new Retailer());
		return model;
	}
	
	@RequestMapping(value = "/retailer/save",method = RequestMethod.POST)
	public ModelAndView saveRetailer(@ModelAttribute("retailerForm") Retailer retailer) {
		
		if(!retailerDao.isEmailUnique(retailer.getUser().getEmail())) {
			ModelAndView model = new ModelAndView("retailer/retailerForm");
			model.addObject("error","Email Already Exists");
			return model;
		}
		
		retailerDao.registerRetailer(retailer);
		return new ModelAndView("redirect:/admin/retailer/list");
	}
	
	@RequestMapping(value = "/retailer/update/{retId}",method = RequestMethod.GET)
	public ModelAndView updateRetailer(@PathVariable("retId") int retId) {

		ModelAndView model = new ModelAndView("retailer/retailerupdate");
		Retailer retailer = retailerDao.findRetailerById(retId);
		model.addObject("retailer",retailer);
		return model;
	}

	@RequestMapping(value = "/retailer/update",method = RequestMethod.POST)
	public ModelAndView updateRetailer(@ModelAttribute("retailer") Retailer retailer) {
		
		retailer.getUser().setEnabled(true);
		retailer.getUser().setIsEmailVerified("Verified");
		retailerDao.update(retailer);
		return new ModelAndView("redirect:/admin/retailer/list");
	}
	@RequestMapping(value = "/retailer/delete/{retId}",method = RequestMethod.GET)
	public ModelAndView deleteRetailer(@PathVariable("retId") int retId) {
		
		Retailer retailer = retailerDao.findRetailerById(retId);
		retailerDao.delete(retailer);
		return new ModelAndView("redirect:/admin/retailer/list");
		
	}
	@RequestMapping(value="/retailer/info/{retId}",method=RequestMethod.GET)
	public ModelAndView retailerInfo(@PathVariable("retId") int retId) {
		
		ModelAndView model = new ModelAndView("retailer/retailerInfo");
		Retailer retailer = retailerDao.findRetailerById(retId);
		model.addObject("list",retailer);
		return model;
	}
	
}

