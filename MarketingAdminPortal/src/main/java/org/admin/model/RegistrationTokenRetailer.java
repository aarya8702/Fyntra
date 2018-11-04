package org.admin.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="registration_token_retailer")
public class RegistrationTokenRetailer {
	
	@Id
	private String token;
	
	@OneToOne(targetEntity = Retailer.class,fetch = FetchType.EAGER)
	@JoinColumn(nullable = false, name= "ret_id")
	private Retailer retailer;
	
	public RegistrationTokenRetailer() {}
	
	public RegistrationTokenRetailer(String token,Retailer retailer) {
		
		super();
		this.token = token;
		this.retailer = retailer;
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

	@Override
	public String toString() {
		return "RegistrationTokenRetailer [token=" + token + ", retailer=" + retailer + "]";
	}
	
	

}
