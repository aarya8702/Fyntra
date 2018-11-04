package org.marketing.dao;

import org.marketing.model.RegistrationTokenRetailer;
import org.marketing.model.Retailer;

public interface RegistrationTokenRetailerDao {

	public RegistrationTokenRetailer findTokenById(String token);
	
	public void createTokenForRetailer(final Retailer retailer,final String token);
	
	
}
