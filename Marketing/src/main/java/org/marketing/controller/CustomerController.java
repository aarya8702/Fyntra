package org.marketing.controller;

import java.security.Principal;
import java.util.List;

import org.marketing.dao.CartItemDao;
import org.marketing.dao.CustomerDao;
import org.marketing.dao.CustomerOrderDao;
import org.marketing.dao.RetailerDao;
import org.marketing.model.BillingAddress;
import org.marketing.model.CartItem;
import org.marketing.model.Customer;
import org.marketing.model.CustomerOrder;
import org.marketing.model.ShippingAddress;
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
@RequestMapping(value = "/customer")
public class CustomerController {

	@Autowired
	private CustomerDao customerDao;
	
	@Autowired
	private RetailerDao retailerDao;
	
	@Autowired
	private CustomerOrderDao customerOrderDao;
	
	@Autowired
	private CartItemDao cartItemDao;
	
	@RequestMapping(value = "/updateCustomer", method = RequestMethod.GET)
	public ModelAndView updateCustomerForm(
			@AuthenticationPrincipal Principal principal/* @PathVariable("retId") int retId */) {

		ModelAndView model = new ModelAndView("customer/customerupdate");
		String email = principal.getName();
		Customer customer = customerDao.findCustomerByEmail(email);
		model.addObject("customer", customer);
		return model;
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updateRetailer(@ModelAttribute("customer") Customer customer) {

//		ShippingAddress shipping = new ShippingAddress();
//		shipping.setCustomer(customer);
//		BillingAddress billing = new BillingAddress();
//		billing.setCustomer(customer);
		customer.getUser().setEnabled(true);
		customer.getUser().setIsEmailVerified("Verified");
		customerDao.updateCustomer(customer);
		return "customer/customeraccount";

	}
	
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public ModelAndView listRetailerById(@AuthenticationPrincipal Principal principal) {

		ModelAndView model = new ModelAndView("customer/customerInfo");
		String email = principal.getName();
		List<Customer> customer = customerDao.listCustomerByEmail(email);
		model.addObject("list", customer);
		return model;
	}

	@RequestMapping(value = "/myAccount", method = RequestMethod.GET)
	public ModelAndView myAccount() {
		ModelAndView model = new ModelAndView("customer/customeraccount");
		return model;
	}
	
	@RequestMapping(value = "/changePassword", method = RequestMethod.GET)
	public String passwordPage() {
		return "customer/customerpasswordchange";
	}

	@RequestMapping(value = "/change", method = RequestMethod.POST)
	public String changePassword(@ModelAttribute("currentPass") String currentPassword,
			@ModelAttribute("newPass") String newPass, @AuthenticationPrincipal Principal principal, Model model) {

		String email = principal.getName();
		Customer customer = customerDao.findCustomerByEmail(email);

	
		if (newPass != null && !newPass.isEmpty() && !newPass.equals("")) {
			String dbPassword = customer.getUser().getPassword();
			if (dbPassword.equals(currentPassword) ) {
				customer.getUser().setPassword(newPass);
				customerDao.updateCustomer(customer);
				model.addAttribute("success",true);
				System.out.println("hello");
			}else {
				model.addAttribute("Incorrect",true);
				return "customer/customerpasswordchange";
			}
		}
		
		return "customer/customerpasswordchange";
	}
	@RequestMapping(value="/shippingForm")
	public String shippingForm(@AuthenticationPrincipal Principal principal,Model model) {
		String email = principal.getName();
		User user = retailerDao.getUser(email);
		Customer customer = user.getCustomer();
		ShippingAddress shippingaddress = customer.getShippingAddress();
		model.addAttribute("shippingaddress",shippingaddress);
		return "customer/updateShipping";
	}
	
	@RequestMapping(value="/updateShipping")
	public String updateShipping(@AuthenticationPrincipal Principal principal,@ModelAttribute("shippingaddress") ShippingAddress shippingAddress,Model model) {
		
		String email = principal.getName();
		User user = retailerDao.getUser(email);
		Customer customer = user.getCustomer();
		customer.setShippingAddress(shippingAddress);
		customerDao.updateCustomer(customer);
		return "redirect:/customer/info";
	}
	
	@RequestMapping(value="/billingForm")
	public String billingForm(@AuthenticationPrincipal Principal principal,Model model) {
		String email = principal.getName();
		User user = retailerDao.getUser(email);
		Customer customer = user.getCustomer();
		BillingAddress billingaddress = customer.getBillingAddress();
		model.addAttribute("billingaddress",billingaddress);
		return "customer/updateBilling";
	}
	
	
	@RequestMapping(value="/updateBilling")
	public String updateBilling(@AuthenticationPrincipal Principal principal,@ModelAttribute("billingaddress") BillingAddress billingAddress,Model model) {
		
		String email = principal.getName();
		User user = retailerDao.getUser(email);
		Customer customer = user.getCustomer();
		customer.setBillingAddress(billingAddress);
		customerDao.updateCustomer(customer);
		return "redirect:/customer/info";
	}
	
	@RequestMapping(value= "/orders")
	public String listAllOrders(@AuthenticationPrincipal Principal principal,Model model) {
		
		String email = principal.getName();
		List<CustomerOrder> orders = customerOrderDao.listAllOrdersByEmail(email);
		model.addAttribute("orders",orders);
		return "customer/orders";
	}
	@RequestMapping(value="/orderDetails/{id}",method=RequestMethod.GET)
	public String OrderDetails(@PathVariable("id") int id,Model model) {
		
		CustomerOrder orders = customerOrderDao.findOrderById(id);
		List<CartItem> cartItem = cartItemDao.listCartItemsByOrder(orders);
		model.addAttribute("order",orders);
		model.addAttribute("cartItem", cartItem);
		return "customer/singleOrder";
	}
}
