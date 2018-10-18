package org.marketing.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="retailer")
public class Retailer {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int retId;
	
	private String retailername;
	
	private String contactperson;
	
	private String gtin;
	
	private String phonenumber;
	
	private String alternatenumber;
	
	private String street1;
	
	private String route1;
	
	private String city1;
	
	private String state1;

	private String zipcode1;
	
	private String country1;
		
	@OneToOne(cascade = CascadeType.ALL)
	private User user;
	
	@OneToMany(mappedBy = "retailer",cascade = CascadeType.ALL)
	private List<Product> product;
	
	@OneToMany(mappedBy = "retailer",cascade = CascadeType.ALL)
	private List<Promotions> promotions;
	
	
	public List<Product> getProduct() {
		return product;
	}

	public void setProduct(List<Product> product) {
		this.product = product;
	}

	public List<Promotions> getPromotions() {
		return promotions;
	}

	public void setPromotions(List<Promotions> promotions) {
		this.promotions = promotions;
	}

	public int getRetId() {
		return retId;
	}

	public void setRetId(int retId) {
		this.retId = retId;
	}

	public String getRetailername() {
		return retailername;
	}

	public void setRetailername(String retailername) {
		this.retailername = retailername;
	}

	public String getContactperson() {
		return contactperson;
	}

	public void setContactperson(String contactperson) {
		this.contactperson = contactperson;
	}

	public String getGtin() {
		return gtin;
	}

	public void setGtin(String gtin) {
		this.gtin = gtin;
	}


	

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getAlternatenumber() {
		return alternatenumber;
	}

	public void setAlternatenumber(String alternatenumber) {
		this.alternatenumber = alternatenumber;
	}

	public String getStreet1() {
		return street1;
	}

	public void setStreet1(String street1) {
		this.street1 = street1;
	}

	public String getRoute1() {
		return route1;
	}

	public void setRoute1(String route1) {
		this.route1 = route1;
	}

	public String getCity1() {
		return city1;
	}

	public void setCity1(String city1) {
		this.city1 = city1;
	}

	public String getState1() {
		return state1;
	}

	public void setState1(String state1) {
		this.state1 = state1;
	}

	public String getZipcode1() {
		return zipcode1;
	}

	public void setZipcode1(String zipcode1) {
		this.zipcode1 = zipcode1;
	}

	public String getCountry1() {
		return country1;
	}

	public void setCountry1(String country1) {
		this.country1 = country1;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}


	

}
