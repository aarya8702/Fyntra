package org.marketing.model;

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
	
	private boolean active=true;

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
	
	@Transient
	private MultipartFile file2;
	
	@Transient
	private MultipartFile file3;
	
	@Transient
	private MultipartFile file4;
	
	@Transient
	private MultipartFile file5;
	
	
	private String imageUrl1;

	private String imageUrl2;

	private String imageUrl3;

	private String imageUrl4;
	
	private String imageUrl5;

	

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

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
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

	public Retailer getRetailer() {
		return retailer;
	}

	public void setRetailer(Retailer retailer) {
		this.retailer = retailer;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public MultipartFile getFile2() {
		return file2;
	}

	public void setFile2(MultipartFile file2) {
		this.file2 = file2;
	}

	public MultipartFile getFile3() {
		return file3;
	}

	public void setFile3(MultipartFile file3) {
		this.file3 = file3;
	}

	public MultipartFile getFile4() {
		return file4;
	}

	public void setFile4(MultipartFile file4) {
		this.file4 = file4;
	}

	public MultipartFile getFile5() {
		return file5;
	}

	public void setFile5(MultipartFile file5) {
		this.file5 = file5;
	}

	public String getImageUrl1() {
		return imageUrl1;
	}

	public void setImageUrl1(String imageUrl1) {
		this.imageUrl1 = imageUrl1;
	}

	public String getImageUrl2() {
		return imageUrl2;
	}

	public void setImageUrl2(String imageUrl2) {
		this.imageUrl2 = imageUrl2;
	}

	public String getImageUrl3() {
		return imageUrl3;
	}

	public void setImageUrl3(String imageUrl3) {
		this.imageUrl3 = imageUrl3;
	}

	public String getImageUrl4() {
		return imageUrl4;
	}

	public void setImageUrl4(String imageUrl4) {
		this.imageUrl4 = imageUrl4;
	}

	public String getImageUrl5() {
		return imageUrl5;
	}

	public void setImageUrl5(String imageUrl5) {
		this.imageUrl5 = imageUrl5;
	}
	
	
	
	

	
}
