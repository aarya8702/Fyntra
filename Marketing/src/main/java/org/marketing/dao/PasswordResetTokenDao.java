package org.marketing.dao;

import java.util.Date;

import org.marketing.model.PasswordResetToken;
import org.marketing.model.Retailer;
import org.springframework.data.jpa.repository.Modifying;

public interface PasswordResetTokenDao {
	
	
    PasswordResetToken findByToken(String token);
	
//	PasswordResetToken findByRetailer(Retailer retailer);
	
//	Stream<PasswordResetToken> findAllByExpiryDateLessThan(Date now);
	
	@Modifying
	void deleteAllExpiredSince(Date now);
	
	void createPasswordResetTokenForRetailer(final Retailer retailer , final String token);
	
}
