package org.admin.dao;

import java.util.List;

import org.admin.model.CustomerOrder;

public interface CustomerOrderDao {

	public List<CustomerOrder> listAllCustomerOrders();
	
	public CustomerOrder findCustomerOrderById(int id);
}
