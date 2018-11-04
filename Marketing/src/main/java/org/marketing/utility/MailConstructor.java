package org.marketing.utility;

import java.util.List;
import java.util.Locale;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.marketing.model.CartItem;
import org.marketing.model.Customer;
import org.marketing.model.CustomerOrder;
import org.marketing.model.Retailer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Component;
import org.thymeleaf.context.Context;
import org.thymeleaf.spring4.SpringTemplateEngine;



@Component
public class MailConstructor {

//	@Autowired
//	private Environment env;
	
	@Autowired
	SpringTemplateEngine templateEngine;
	



	// ======================retailer registration
	// E-mail============================
	public SimpleMailMessage constructRegistrationTokenEmailRetailer(String contextPath, Locale locale, String token,
		Retailer retailer, String password) {

		String url = contextPath + "/newRetailer?token=" + token;
		String message = "\nPlease click on this link to verify your email and edit your personal information. Your password is: \n"
				+ password;
		SimpleMailMessage email = new SimpleMailMessage();
		email.setTo(retailer.getUser().getEmail());
		email.setSubject("Fyntra- New Retailer");
		email.setText(url + message);
		email.setFrom("aarya526@gmail.com");
		return email;
	}
	// ======================retailer password reset
	// Email============================

	public SimpleMailMessage forgotPasswordEmail(String contextPath, Locale locale, String token, Retailer retailer,
			String password) {
		String url = contextPath + "/passwordReset?token=" + token;
		String message = "\nPlease click on this link to reset your password. Your Random Password is: \n" + password;
		SimpleMailMessage email = new SimpleMailMessage();
		email.setTo(retailer.getUser().getEmail());
		email.setSubject("Fyntra- Reset Password");
		email.setText(url + message);
		email.setFrom("aarya526@gmail.com");
		return email;
	}

	// ======================customer registration
	// mail================================
	public SimpleMailMessage constructRegistrationTokenEmailCustomer(String contextPath, Locale locale, String token,
			Customer customer, String password) {

		String url = contextPath + "/newCustomer?token=" + token;
		String message = "\nPlease click on this link to verify your email and edit your personal information. Your password is: \n"
				+ password;
		SimpleMailMessage email = new SimpleMailMessage();
		email.setTo(customer.getUser().getEmail());
		email.setSubject("Fyntra- New Customer");
		email.setText(url + message);
		email.setFrom("aarya526@gmail.com");
		return email;
	}
	// ==============================customer password reset
	// mail======================

	public SimpleMailMessage forgotPasswordEmailCustomer(String contextPath, Locale locale, String token,
			Customer customer, String password) {
		String url = contextPath + "/passwordResetCustomer?token=" + token;
		String message = "\nPlease click on this link to reset your password. Your Random Password is: \n" + password;
		SimpleMailMessage email = new SimpleMailMessage();
		email.setTo(customer.getUser().getEmail());
		email.setSubject("Fyntra- Reset Password");
		email.setText(url + message);
		email.setFrom("aarya526@gmail.com");
		return email;
	}
	
	
	public MimeMessagePreparator constructOrderConfirmationEmail (List<CartItem> cartItem, final CustomerOrder customerOrder, Locale locale) {
		Context context = new Context();
		context.setVariable("cartItems", cartItem);
		context.setVariable("customerorder", customerOrder);
		final String text = templateEngine.process("orderConfirmationEmailTemplate", context);
		
		MimeMessagePreparator messagePreparator = new MimeMessagePreparator() {
			public void prepare(MimeMessage mimeMessage) throws Exception {
				MimeMessageHelper email = new MimeMessageHelper(mimeMessage);
				email.setTo(customerOrder.getCustomer().getUser().getEmail());
				email.setSubject("Order Confirmation - "+customerOrder.getId());
				email.setText(text, true);
				email.setFrom(new InternetAddress("aarya526@gmail.com"));
			}
		};
		
		return messagePreparator;
	}

	
}
