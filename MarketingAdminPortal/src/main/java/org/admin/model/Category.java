package org.admin.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="catgeory")
public class Category implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -265279672902313094L;

	@Id
	private String maincategory;
	
	@OneToMany(mappedBy = "category")
	private List<Product> product;
	

	@OneToMany(mappedBy = "category")
	private List<SubCategory1> subCat1;

	
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

	
	

	
}
