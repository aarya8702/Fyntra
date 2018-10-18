package org.marketing.dao;

import java.util.List;

import org.marketing.model.CustomerOrder;

public interface CustomerOrderDao {


	public List<CustomerOrder> listAllOrdersByEmail(String email);
	
	public CustomerOrder createCustomerOrder(CustomerOrder customerOrder);
	
	public CustomerOrder findOrderById(int id);
	
	
}
