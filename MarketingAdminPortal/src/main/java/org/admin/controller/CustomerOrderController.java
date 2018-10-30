package org.admin.controller;

import java.util.List;

import org.admin.dao.CartItemDao;
import org.admin.dao.CustomerOrderDao;
import org.admin.model.CartItem;
import org.admin.model.CustomerOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/admin")
public class CustomerOrderController {

	@Autowired
	private CustomerOrderDao orderDao;
	
	@Autowired
	private CartItemDao cartItemDao;
	
	@RequestMapping(value="/order/list")
	public String orderList(Model model) {
		
		List<CustomerOrder> customerOrder = orderDao.listAllCustomerOrders();
		model.addAttribute("list",customerOrder);
		return "order/orderList";
		
	}
	@RequestMapping(value="/order/info/{id}")
	public String findOrder(@PathVariable("id") int id,Model model) {
		
		CustomerOrder order = orderDao.findCustomerOrderById(id);
		List<CartItem> cartItem = cartItemDao.listCartItemsByOrder(order);
		model.addAttribute("order",order);
		model.addAttribute("cartItem",cartItem);
		return "order/orderInfo";
		
	}
}
