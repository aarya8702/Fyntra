package org.admin.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="category")
public class Category implements Serializable{

	private static final long serialVersionUID = -265279672902313094L;

	@Id
	private String maincategory;
	
	@OneToMany(mappedBy = "category")
	private List<Product> product;

	@OneToMany(mappedBy = "category")
	private List<SubCategory1> subCat1;

	@OneToMany(mappedBy = "category")
	private List<Promotions> promotions;
	
	public String getMaincategory() {
		return maincategory;
	}

	public void setMaincategory(String maincategory) {
		this.maincategory = maincategory;
	}

	public List<Product> getProduct() {
		return product;
	}

	public void setProduct(List<Product> product) {
		this.product = product;
	}

	public List<SubCategory1> getSubCat1() {
		return subCat1;
	}

	public void setSubCat1(List<SubCategory1> subCat1) {
		this.subCat1 = subCat1;
	}

	public List<Promotions> getPromotions() {
		return promotions;
	}

	public void setPromotions(List<Promotions> promotions) {
		this.promotions = promotions;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
