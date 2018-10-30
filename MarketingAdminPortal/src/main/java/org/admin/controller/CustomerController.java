package org.admin.controller;

import java.util.List;

import org.admin.dao.CustomerDao;
import org.admin.dao.RetailerDao;
import org.admin.model.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/admin")
public class CustomerController {

	@Autowired
	CustomerDao customerDao;
	
	@Autowired
	RetailerDao retailerDao;

	@RequestMapping(value = "/customer/list",method = RequestMethod.GET)
	public ModelAndView listCustomer() {
		ModelAndView model = new ModelAndView("customer/customerList");
		List<Customer> customer = customerDao.listAllCustomer();
		model.addObject("list",customer);
		return model;
	}
	
	@RequestMapping(value = "/customer/add",method = RequestMethod.GET)
	public ModelAndView addcustomer() {
		ModelAndView model = new ModelAndView("customer/customerForm");
		model.addObject("customerForm",new Customer());
		return model;
	}
	
	@RequestMapping(value = "/customer/save",method = RequestMethod.POST)
	public ModelAndView savecustomer(@ModelAttribute("customerForm") Customer customer) {
		
		if(!retailerDao.isEmailUnique(customer.getUser().getEmail())) {
			ModelAndView model = new ModelAndView("customer/customerForm");
			model.addObject("error","Email Already Exists");
			return model;
		}
		
		customerDao.save(customer);
		return new ModelAndView("redirect:/admin/customer/list");
	}
	
	@RequestMapping(value = "/customer/update/{custId}",method = RequestMethod.GET)
	public ModelAndView updatecustomer(@PathVariable("custId") int custId) {

		ModelAndView model = new ModelAndView("customer/customerupdate");
		Customer customer = customerDao.findCustomerById(custId);
		model.addObject("customer",customer);
		return model;
	}

	@RequestMapping(value = "/customer/update",method = RequestMethod.POST)
	public ModelAndView updatecustomer(@ModelAttribute("customer") Customer customer) {
		
		customer.getUser().setEnabled(true);
		customer.getUser().setIsEmailVerified("Verified");
		customerDao.update(customer);
		return new ModelAndView("redirect:/admin/customer/list");
	}
	@RequestMapping(value = "/customer/delete/{custId}",method = RequestMethod.GET)
	public ModelAndView deletecustomer(@PathVariable("custId") int custId) {
		
		Customer customer = customerDao.findCustomerById(custId);
		customerDao.delete(customer);
		return new ModelAndView("redirect:/admin/customer/list");
		
	}
	@RequestMapping(value="/customer/info/{custId}",method=RequestMethod.GET)
	public ModelAndView customerInfo(@PathVariable("custId") int custId) {
		
		ModelAndView model = new ModelAndView("customer/customerInfo");
		Customer customer = customerDao.findCustomerById(custId);
		model.addObject("list",customer);
		return model;
	}
	
}
