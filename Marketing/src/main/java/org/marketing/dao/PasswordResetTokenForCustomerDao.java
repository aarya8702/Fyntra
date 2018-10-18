package org.marketing.dao;

import java.util.Date;

import org.marketing.model.Customer;
import org.marketing.model.PasswordResetTokenCustomer;
import org.springframework.data.jpa.repository.Modifying;

public interface PasswordResetTokenForCustomerDao {

	  PasswordResetTokenCustomer findByToken(String token);
		
//		PasswordResetToken findByRetailer(Retailer retailer);
		
//		Stream<PasswordResetToken> findAllByExpiryDateLessThan(Date now);
		
		@Modifying
		void deleteAllExpiredSince(Date now);
				
		void createPasswordResetTokenForCustomer(final Customer customer , final String token);
}
