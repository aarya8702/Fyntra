package org.admin.dao;

import java.util.List;

import org.admin.model.Customer;

public interface CustomerDao {

	public List<Customer> listAllCustomer();
	
	public void save(Customer customer);
	
	public void update(Customer customer);
	
	public void delete(Customer customer);
	
	public Customer findCustomerById(int customerId);
}
