package org.marketing.controller;

import java.math.BigDecimal;
import java.security.Principal;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.marketing.dao.CartItemDao;
import org.marketing.dao.CustomerDao;
import org.marketing.dao.CustomerOrderDao;
import org.marketing.dao.ProductDao;
import org.marketing.dao.ShoppingCartDao;
import org.marketing.dao.UserBillingDao;
import org.marketing.dao.UserShippingDao;
import org.marketing.model.CartItem;
import org.marketing.model.Customer;
import org.marketing.model.CustomerOrder;
import org.marketing.model.Product;
import org.marketing.model.Promotions;
import org.marketing.model.ShippingAddress;
import org.marketing.model.ShoppingCart;
import org.marketing.model.User;
import org.marketing.model.UserBilling;
import org.marketing.model.UserShipping;
import org.marketing.utility.MailConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/cart")
public class CartController {

	@Autowired
	private CartItemDao cartItemDao;

	@Autowired
	private ProductDao productDao;

	@Autowired
	private CustomerDao customerDao;

	@Autowired
	private MailConstructor mailConstructor;

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private ShoppingCartDao shoppingCartDao;

	@Autowired
	private CustomerOrderDao customerOrderDao;

	@Autowired
	private UserShippingDao userShippingDao;

	@Autowired
	private UserBillingDao userBillingDao;

	@RequestMapping(value = "/addToCart/{productId}", method = RequestMethod.POST)
	public String addToCart(@PathVariable("productId") int productId, @AuthenticationPrincipal Principal principal,
			@ModelAttribute("requestedQuantity") int requestedQuantity, Model model, HttpSession session) {

		String email = principal.getName();
		ShoppingCart shoppingCart = shoppingCartDao.findShoppingCartByEmail(email);
		List<CartItem> cartItems = cartItemDao.findCartItemsByShoppingCart(shoppingCart);

		Product product = productDao.findProductById(productId);

		if (requestedQuantity > product.getQuantity()) {
			model.addAttribute("error", true);
			System.out.println("Out of stock");
			return "forward:/viewSingleProduct/" + productId;
		}

		for (CartItem cartItem : cartItems) {
			if (cartItem.getProduct().getProductId() == product.getProductId()) {
				cartItem.setQuanity(requestedQuantity);
				cartItem.setSubtotal(new BigDecimal(product.getPrice()).multiply(new BigDecimal(requestedQuantity)));
				cartItemDao.saveOrUpdate(cartItem);
			}

		}

		CartItem cartItem = new CartItem();
		cartItem.setProduct(product);
		cartItem.setQuanity(requestedQuantity);
		cartItem.setSubtotal(new BigDecimal(product.getPrice()).multiply(new BigDecimal(requestedQuantity)));
		cartItem.setShoppingCart(shoppingCart);
		cartItemDao.saveOrUpdate(cartItem);

		model.addAttribute("success", true);
		return "forward:/viewSingleProduct/" + productId;

	}

	@RequestMapping(value = "/listCart", method = RequestMethod.GET)
	public String listCart(@AuthenticationPrincipal Principal principal, Model model) {

		String email = principal.getName();

		ShoppingCart shoppingCart = shoppingCartDao.findShoppingCartByEmail(email);

		List<CartItem> cartItems = cartItemDao.findCartItemsByShoppingCart(shoppingCart);

		BigDecimal cartTotal = new BigDecimal(0);

		for (CartItem cartItem : cartItems) {
			if (cartItem.getProduct().getQuantity() > 0) {

				cartItemDao.saveOrUpdate(cartItem);
				cartTotal = cartTotal.add(cartItem.getSubtotal());
			}
		}

		shoppingCart.setGrandTotal(cartTotal);
		shoppingCartDao.updateShoppingCart(shoppingCart);

		model.addAttribute("cartItems", cartItems);
		model.addAttribute("shoppingCart", shoppingCart);

		return "cart/cart";
	}

	@RequestMapping(value = "/delete/{cartId}", method = RequestMethod.GET)
	public String deleteCartItem(@PathVariable("cartId") Long cartId, @AuthenticationPrincipal Principal principal) {

		cartItemDao.delete(cartId);
		return "redirect:/cart/listCart";
	}

	@RequestMapping(value = "/clearCart", method = RequestMethod.GET)
	public String clearCart(@AuthenticationPrincipal Principal principal) {

		String email = principal.getName();
		ShoppingCart shoppingCart = shoppingCartDao.findShoppingCartByEmail(email);
		List<CartItem> cartItems = cartItemDao.findCartItemsByShoppingCart(shoppingCart);
		for (CartItem cartItem : cartItems) {
			cartItemDao.delete(cartItem.getCartId());
		}

		return "redirect:/cart/listCart";

	}

	@RequestMapping(value = "/shippingaddress")
	public String getShippingAddress(@AuthenticationPrincipal Principal principal, Model model) {
		String email = principal.getName();
		User user = cartItemDao.getUser(email);
		Customer customer = user.getCustomer();
		ShippingAddress shippingAddress = customer.getShippingAddress();
		customer.setShippingAddress(shippingAddress);
		customerDao.updateCustomer(customer);
		model.addAttribute("shippingaddress", shippingAddress);
		return "cart/shippingaddress";
	}

	@RequestMapping(value = "/reviewYourOrder")
	public String reviewYourOrder(@AuthenticationPrincipal Principal principal, Model model,
			@ModelAttribute("shippingaddress") ShippingAddress shippingAddress) {

		String email = principal.getName();
		User user = cartItemDao.getUser(email);
		Customer customer = user.getCustomer();
		customer.setShippingAddress(shippingAddress);
		customerDao.updateCustomer(customer);

		ShoppingCart shoppingCart = shoppingCartDao.findShoppingCartByEmail(email);
		List<CartItem> cartItems = cartItemDao.findCartItemsByShoppingCart(shoppingCart);
		model.addAttribute("customer", customer);
		model.addAttribute("cartItems", cartItems);
		model.addAttribute("shoppingCart", shoppingCart);
		return "cart/reviewyourorder";
	}

	@RequestMapping(value = "/applyCode")
	public String applyPromoCode(@AuthenticationPrincipal Principal principal,
			@RequestParam("promoCode") String promoCode, Model model) {

		String email = principal.getName();

		Promotions promo = cartItemDao.findPromoCodeByName(promoCode);
		model.addAttribute("promoCode", promoCode);

		ShoppingCart shoppingCart = shoppingCartDao.findShoppingCartByEmail(email);
		List<CartItem> cartItems = cartItemDao.findCartItemsByShoppingCart(shoppingCart);

		for (CartItem cartItem : cartItems) {

			if (promoCode.equals(promo.getPromotioncode())) {

				
				if (cartItem.getProduct().getRetailer().getRetailername()
						.equals(promo.getRetailer().getRetailername())) {

					if (cartItem.getPromotions() != null) {
						model.addAttribute("exists", true);
						System.out.println("Already Applied");
						return "forward:/cart/listCart";
					}
					
					cartItem.setPromotions(promo);
					BigDecimal discount = cartItem.getSubtotal()
							.multiply(new BigDecimal(promo.getDiscount()).divide(new BigDecimal(100)));
					cartItem.setSubtotal(cartItem.getSubtotal().subtract(discount));
					cartItemDao.saveOrUpdate(cartItem);
					System.out.println("promoRate: " + promo.getDiscount());
					System.out.println("Discount " + discount);

				}
			}
		}
        
		model.addAttribute("cartItems", cartItems);

		return "forward:/cart/listCart";
	}

	@RequestMapping(value = "/createorder")
	public String createOrder(@AuthenticationPrincipal Principal principal, Model model, HttpSession session) {

		String email = principal.getName();
		User user = cartItemDao.getUser(email);
		Customer customer = user.getCustomer();
		user.setCustomer(customer);

		ShoppingCart shoppingCart = shoppingCartDao.findShoppingCartByEmail(email);
		List<CartItem> cartItems = cartItemDao.findCartItemsByShoppingCart(shoppingCart);

		// create CustomerOrder object
		CustomerOrder customerOrder = new CustomerOrder();
		customerOrder.setOrderDate(new Date());
		customerOrder.setCustomer(customer);
		customerOrder.setOrderTotal(shoppingCart.getGrandTotal());

		UserBilling userBilling = new UserBilling();
		userBilling.setApartmentnumber(customer.getBillingAddress().getApartmentnumber());
		userBilling.setStreetname(customer.getBillingAddress().getStreetname());
		userBilling.setCity(customer.getBillingAddress().getCity());
		userBilling.setState(customer.getBillingAddress().getState());
		userBilling.setZipcode(customer.getBillingAddress().getZipcode());
		userBilling.setCountry(customer.getBillingAddress().getCountry());
		userBillingDao.save(userBilling);

		UserShipping userShipping = new UserShipping();
		userShipping.setApartmentnumber(customer.getShippingAddress().getApartmentnumber());
		userShipping.setStreetname(customer.getShippingAddress().getStreetname());
		userShipping.setCity(customer.getShippingAddress().getCity());
		userShipping.setState(customer.getShippingAddress().getState());
		userShipping.setZipcode(customer.getShippingAddress().getZipcode());
		userShipping.setCountry(customer.getShippingAddress().getCountry());
		userShippingDao.save(userShipping);

		customerOrder.setUserBilling(userBilling);
		customerOrder.setUserShipping(userShipping);
		if (cartItems.size() > 0) {
		         customerOrderDao.createCustomerOrder(customerOrder);
		         userBilling.setCustomerOrder(customerOrder);
		     	 userShipping.setCustomerOrder(customerOrder);

		}
		for (CartItem cartItem : cartItems) {

			Product product = cartItem.getProduct();
			product.setQuantity(product.getQuantity() - cartItem.getQuanity());
			if(product.getQuantity() == 0) {
				
				product.setActive(false);
			}
			productDao.update(product);// update
			cartItem.setCustomerOrder(customerOrder);
			cartItem.setShoppingCart(null);
			cartItemDao.saveOrUpdate(cartItem);
			// if (product.getQuantity() == 0) {
			// productDao.delete(product);
			// }

		}
		shoppingCart.setGrandTotal(new BigDecimal(0));
		shoppingCartDao.updateShoppingCart(shoppingCart);

		mailSender.send(mailConstructor.constructOrderConfirmationEmail(cartItems, customerOrder, Locale.ENGLISH));

		model.addAttribute("customerorder", customerOrder);
		model.addAttribute("cartItems", cartItems);

		return "cart/orderdetails";

	}

}
