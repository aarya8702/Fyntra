package org.admin.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

//import org.hibernate.search.annotations.Field;
//import org.hibernate.search.annotations.Indexed;
import org.springframework.web.multipart.MultipartFile;


@Entity
@Table(name="product")
//@Indexed
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int productId;
	
//	@Field
	private String productname;
	
//	@Field
	private String description;
	
	private int quantity;
	
	private double temprice;
	
	private double price;
	
	@ManyToOne
	private Category category;
	
	@ManyToOne
	private SubCategory1 subcategory1;
	
	@ManyToOne
	private Retailer retailer;
	
	@ManyToOne
	private User user;
	
	@Transient
	private MultipartFile file1;
	
	private String imageUrl1;
	
	

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getTemprice() {
		return temprice;
	}

	public void setTemprice(double temprice) {
		this.temprice = temprice;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public MultipartFile getFile1() {
		return file1;
	}

	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}

	public String getImageUrl1() {
		return imageUrl1;
	}

	public void setImageUrl1(String imageUrl1) {
		this.imageUrl1 = imageUrl1;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public SubCategory1 getSubcategory1() {
		return subcategory1;
	}

	public void setSubcategory1(SubCategory1 subcategory1) {
		this.subcategory1 = subcategory1;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Retailer getRetailer() {
		return retailer;
	}

	public void setRetailer(Retailer retailer) {
		this.retailer = retailer;
	}
	
	

	
	

	
}
