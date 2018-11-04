package org.admin.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="registration_token_customer")
public class RegistrationTokenCustomer {

	@Id
	private String token;
	
	@OneToOne(targetEntity = Customer.class,fetch = FetchType.EAGER)
	@JoinColumn(nullable = false, name= "cust_id")
	private Customer customer;

	public RegistrationTokenCustomer() {}
	
	public RegistrationTokenCustomer(String token, Customer customer) {
		super();
		this.token = token;
		this.customer = customer;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	@Override
	public String toString() {
		return "RegistrationTokenCustomer [token=" + token + ", customer=" + customer + "]";
	}

	
	
	
	
}
