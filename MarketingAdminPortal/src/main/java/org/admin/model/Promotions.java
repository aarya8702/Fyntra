package org.admin.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="promotions")
public class Promotions {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int pid;
	
	private String promotioncode;
	
	private String description;
	
	private double discount;
	
	@ManyToOne
	private User user;
	
	@ManyToOne
	private Retailer retailer;

	public Retailer getRetailer() {
		return retailer;
	}

	public void setRetailer(Retailer retailer) {
		this.retailer = retailer;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPromotioncode() {
		return promotioncode;
	}

	public void setPromotioncode(String promotioncode) {
		this.promotioncode = promotioncode;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}
