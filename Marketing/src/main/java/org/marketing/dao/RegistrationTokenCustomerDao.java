package org.marketing.dao;

import org.marketing.model.Customer;
import org.marketing.model.RegistrationTokenCustomer;

public interface RegistrationTokenCustomerDao {
	
public RegistrationTokenCustomer findTokenById(String token);
	
	public void createTokenForCustomer(final Customer customer, final String token);

}
