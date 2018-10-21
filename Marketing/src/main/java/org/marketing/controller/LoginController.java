package org.marketing.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.marketing.dao.CustomerDao;
import org.marketing.dao.PasswordResetTokenDao;
import org.marketing.dao.PasswordResetTokenForCustomerDao;
import org.marketing.dao.RetailerDao;
import org.marketing.dao.ShoppingCartDao;
import org.marketing.model.Authorities;
import org.marketing.model.BillingAddress;
import org.marketing.model.Customer;
import org.marketing.model.PasswordResetToken;
import org.marketing.model.PasswordResetTokenCustomer;
import org.marketing.model.Retailer;
import org.marketing.model.ShippingAddress;
import org.marketing.model.ShoppingCart;
import org.marketing.model.User;
import org.marketing.utility.MailConstructor;
import org.marketing.utility.SecurityUtility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

	@Autowired
	private RetailerDao retailerDao;

	@Autowired
	private MailConstructor mailConstructor;

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private PasswordResetTokenDao passwordResetTokenDao;
	
	@Autowired
	private PasswordResetTokenForCustomerDao passwordResetTokenCustomerDao;
	
	@Autowired
	private CustomerDao customerDao;
	
	@Autowired
	private ShoppingCartDao shoppingCartDao;
	
	@RequestMapping(value = "/userLogin")
	public ModelAndView retailerLogin(@RequestParam(value = "error", required = false) String error/*,@ModelAttribute("j_username") String email*/) {

		ModelAndView model = new ModelAndView("webpages/login");
//		User user = retailerDao.getUser(email);
		if (error != null) {
			model.addObject("error", "incorrect email or password");
		}
//		else if(!user.getIsEmailVerified().equals("Verified")) {
//			
//			model.addObject("notVerified","Email Not Verified");
//		}
		
		

		return model;
	}
	
//	@RequestMapping(value = "/registrationPage", method = RequestMethod.GET)
//	public ModelAndView retailerRegistration() {
//		ModelAndView model = new ModelAndView("webpages/registrationPage");
//		Customer customer = new Customer();
//		model.addObject("customerForm",customer);
//		Retailer retailer = new Retailer();
//		model.addObject("retailerForm", retailer);
//		return model;
//	}
	

	///////////////////////////////// RETAILER////////////////////////////////////////
	

	@RequestMapping(value = "/newRetailerForm",method = RequestMethod.GET)
	public ModelAndView retailerRegistration() {
		ModelAndView model = new ModelAndView("retailer/retailerForm");
		model.addObject("retailerForm",new Retailer());
		return model;
	}
	
	@RequestMapping(value = "/newRetailer", method = RequestMethod.POST)
	public String newRetailerPost(HttpServletRequest request, @RequestParam("user.email") String email,
			@RequestParam("user.password") String password, @ModelAttribute("retailerForm") Retailer retailer,
			ModelMap model) {

//		model.addAttribute("classActiveNewAccountRetailer", true);
		
		if (!retailerDao.isEmailUnique(email)) {

			model.addAttribute("error", "Email Already Exists");
			return "retailer/retailerForm";
		}

		retailer.getUser().setEmail(email);
		retailer.getUser().setPassword(password);
		retailer.getUser().setEnabled(true);
		retailer.getUser().setIsEmailVerified("Not Verified");
		Authorities authorities = new Authorities();
		authorities.setRole("ROLE_RETAILER");
		authorities.setUser(retailer.getUser());
		retailer.getUser().setAuthorities(authorities);
		retailerDao.registerRetailer(retailer);

		String token = UUID.randomUUID().toString();
		passwordResetTokenDao.createPasswordResetTokenForRetailer(retailer, token);

		String appUrl = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();

		SimpleMailMessage eemail = mailConstructor.constructResetTokenEmail(appUrl, request.getLocale(), token,
				retailer, password);

		mailSender.send(eemail);

		model.addAttribute("EmailSent", true);
		
		return "retailer/retailerForm";

	}

	@RequestMapping(value = "/newRetailer")
	public String newRetailer(Locale locale, @RequestParam("token") String token, ModelMap model) {

		PasswordResetToken passToken = passwordResetTokenDao.findByToken(token);
		if (passToken == null) {
			String message = "Invalid Token.";
			model.addAttribute("message", message);
			return "redirect:/badRequest";
		}

		Retailer retailer = passToken.getRetailer();
		String email = retailer.getUser().getEmail();
		retailer.getUser().setIsEmailVerified("Verified");
		retailerDao.update(retailer);

		Authentication authentication = new UsernamePasswordAuthenticationToken(
				retailerDao.findRetailerByEmail(email).getUser().getEmail(), retailer.getUser().getPassword());

		SecurityContextHolder.getContext().setAuthentication(authentication);

		model.addAttribute("retailer", retailer);
		return "retailer/retailerupdate";

	}

	@RequestMapping(value = "/forgotPasswordRetailer", method = RequestMethod.GET)
	public String forgotPassword() {

		return "webpages/forgotPasswordRetailer";

	}

	@RequestMapping(value = "/forgotPasswordPost")
	public String forgotPassword(HttpServletRequest request, @ModelAttribute("email") String email, Model model) {

	    User user = retailerDao.getUser(email);

	
	    if (user == null || user.getRetailer() == null ) {
			
			model.addAttribute("NotExists", true);
			return "webpages/forgotPasswordRetailer";
		}
	

		Retailer retailer = retailerDao.findRetailerByEmail(user.getEmail());
		
		
		
		String password = SecurityUtility.randomPassword();
		retailer.getUser().setPassword(password);
		System.out.println("password is: " + password);
		retailerDao.update(retailer);

		String token = UUID.randomUUID().toString();
		passwordResetTokenDao.createPasswordResetTokenForRetailer(retailer, token);

		String appUrl = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();

		SimpleMailMessage newEmail = mailConstructor.forgotPasswordEmail(appUrl, request.getLocale(), token, retailer,
				password);

		mailSender.send(newEmail);

		model.addAttribute("forgetPasswordEmailSent", true);

		return "webpages/forgotPasswordRetailer";

	}

	@RequestMapping(value = "/passwordReset")
	public String passwordResetMail(Locale locale, @RequestParam("token") String token, Model model) {

		PasswordResetToken passToken = passwordResetTokenDao.findByToken(token);
		if (passToken == null) {
			String message = "Invalid Token.";
			model.addAttribute("message", message);
			return "redirect:/badRequest";
		}

		Retailer retailer = passToken.getRetailer();
		String email = retailer.getUser().getEmail();

		Authentication authentication = new UsernamePasswordAuthenticationToken(
				retailerDao.findRetailerByEmail(email).getUser().getEmail(), retailer.getUser().getPassword());

		SecurityContextHolder.getContext().setAuthentication(authentication);

		model.addAttribute("retailer", retailer);
		return "retailer/retailerpasswordchange";

	}
    /////////////////////////////////CUSTOMER////////////////////////////////////////


	@RequestMapping(value="/newCustomerForm",method = RequestMethod.GET)
	public String customerRegistration(Model model) {
		model.addAttribute("customerForm",new Customer());
		return "customer/customerform";
	}

	
	@RequestMapping(value = "/newCustomer", method = RequestMethod.POST)
	public String newCustomerRegistration(HttpServletRequest request, @RequestParam("user.email") String email,
			@RequestParam("user.password") String password,
			ModelMap model,@ModelAttribute("customerForm") Customer customer) {
//
//		model.addAttribute("classActiveNewAccountCustomer", true);
		
		if (!customerDao.isEmailUnique(email)) { 

			model.addAttribute("error", "Email Already Exists");
			return "customer/customerform";
		}

		customer.getUser().setEmail(email);
		customer.getUser().setPassword(password);
		customer.getUser().setEnabled(true);
		customer.getUser().setIsEmailVerified("Not Verified");
		Authorities authorities = new Authorities();
		authorities.setRole("ROLE_USER");
		authorities.setUser(customer.getUser());
		customer.getUser().setAuthorities(authorities);
		ShippingAddress shippingAddress = new ShippingAddress();
		customer.setShippingAddress(shippingAddress);
		BillingAddress billingAddress = new BillingAddress();
		customer.setBillingAddress(billingAddress);
		customerDao.registerCustomer(customer);
		ShoppingCart shoppingCart = new ShoppingCart();
		shoppingCart.setCustomer(customer);
		shoppingCartDao.save(shoppingCart);

		String token = UUID.randomUUID().toString();
		passwordResetTokenCustomerDao.createPasswordResetTokenForCustomer(customer, token);

		String appUrl = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();

		SimpleMailMessage eemail = mailConstructor.constructResetTokenEmailCustomer(appUrl, request.getLocale(), token,
				customer, password);

		mailSender.send(eemail);

		model.addAttribute("EmailSent", true);
		return "customer/customerform";

	}
	
	@RequestMapping(value = "/newCustomer")
	public String newCustomer(Locale locale, @RequestParam("token") String token, ModelMap model) {

		PasswordResetTokenCustomer passToken = passwordResetTokenCustomerDao.findByToken(token);
		if (passToken == null) {
			String message = "Invalid Token.";
			model.addAttribute("message", message);
			return "redirect:/badRequest";
		}

		Customer customer = passToken.getCustomer();
		String email = customer.getUser().getEmail();
		customer.getUser().setIsEmailVerified("Verified");
		customerDao.updateCustomer(customer);

		Authentication authentication = new UsernamePasswordAuthenticationToken(
				customerDao.findCustomerByEmail(email).getUser().getEmail(), customer.getUser().getPassword());

		SecurityContextHolder.getContext().setAuthentication(authentication);

		model.addAttribute("customer", customer);
		return "customer/customerupdate";

	}
	
	@RequestMapping(value = "/forgotPasswordCustomer", method = RequestMethod.GET)
	public String forgotPasswordCustomer() {

		return "webpages/forgotPasswordCustomer";

	}

	@RequestMapping(value = "/forgotPasswordCustomerPost")
	public String forgotPasswordCustomerPost(HttpServletRequest request, @ModelAttribute("emaill") String email, Model model) {

		User user = customerDao.getUser(email);

		
		if (user == null || user.getCustomer() == null) {
			model.addAttribute("NotExists", true);
			return "webpages/forgotPasswordCustomer";
		}

		Customer customer = customerDao.findCustomerByEmail(email);
		
		String password = SecurityUtility.randomPassword();
		customer.getUser().setPassword(password);
		System.out.println("password is: " + password);
		customerDao.updateCustomer(customer);
		
		String token = UUID.randomUUID().toString();
		passwordResetTokenCustomerDao.createPasswordResetTokenForCustomer(customer, token);

		String appUrl = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();

		SimpleMailMessage newEmail = mailConstructor.forgotPasswordEmailCustomer(appUrl, request.getLocale(), token, customer, password);

		mailSender.send(newEmail);

		model.addAttribute("forgetPasswordEmailSent", true);

		return "webpages/forgotPasswordCustomer";

	}

	@RequestMapping(value = "/passwordResetCustomer")
	public String passwordResetMailCustomer(Locale locale, @RequestParam("token") String token, Model model) {

		PasswordResetTokenCustomer passToken = passwordResetTokenCustomerDao.findByToken(token);
		if (passToken == null) {
			String message = "Invalid Token.";
			model.addAttribute("message", message);
			return "redirect:/badRequest";
		}

		Customer customer = passToken.getCustomer();
		String email = customer.getUser().getEmail();

		Authentication authentication = new UsernamePasswordAuthenticationToken(
				customerDao.findCustomerByEmail(email).getUser().getEmail(), customer.getUser().getPassword());

		SecurityContextHolder.getContext().setAuthentication(authentication);

		model.addAttribute("customer", customer);
		return "customer/customerpasswordchange";

	}
	



}
