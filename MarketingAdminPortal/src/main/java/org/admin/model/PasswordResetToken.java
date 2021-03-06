package org.admin.model;

import java.util.Calendar;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name="password_reset_token")
public class PasswordResetToken {

	private static final int EXPIRATION = 60 * 24;
	
	@Id
	private String token;
	
	@OneToOne(targetEntity = Retailer.class, fetch = FetchType.EAGER)
	@JoinColumn(nullable=false, name="ret_id")
	private Retailer retailer;
	
	
	private Date expiryDate;
	
	public PasswordResetToken(){}
	
	public PasswordResetToken(final String token, final Retailer retailer) {
		super ();
		
		this.token = token;
		this.retailer = retailer;
		this.expiryDate = calculateExpiryDate(EXPIRATION);
	}
	
	private Date calculateExpiryDate (final int expiryTimeInMinutes) {
		final Calendar cal = Calendar.getInstance();
		cal.setTimeInMillis(new Date().getTime());
		cal.add(Calendar.MINUTE, expiryTimeInMinutes);
		return new Date(cal.getTime().getTime());
	}
	
	public void updateToken(final String token) {
		this.token = token;
		this.expiryDate = calculateExpiryDate(EXPIRATION);
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public Retailer getRetailer() {
		return retailer;
	}

	public void setRetailer(Retailer retailer) {
		this.retailer = retailer;
	}

	public Date getExpiryDate() {
		return expiryDate;
	}

	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}

	public static int getExpiration() {
		return EXPIRATION;
	}

	@Override
	public String toString() {
		return "PasswordResetToken [ token=" + token + ", retailer=" + retailer + ", expiryDate=" + expiryDate
				+ "]";
	}
	
	
}
