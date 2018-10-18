package org.marketing.dao;

import java.util.List;

import org.marketing.model.Customer;
import org.marketing.model.User;

public interface CustomerDao {
	
	public void registerCustomer(Customer customer);
	
	public Customer findCustomerByEmail(String email);
	
	public List<Customer> listCustomerByEmail(String email);
	
	public void updateCustomer(Customer customer);
	
	public boolean isEmailUnique(String email);
	
	
	public User getUser(String email);
	

}
