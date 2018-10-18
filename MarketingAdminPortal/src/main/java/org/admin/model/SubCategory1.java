package org.admin.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="subcategory1")
public class SubCategory1 implements Serializable{
	
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 215311268573838008L;

	@Id
	private String subcategory1;
	
	@ManyToOne
	private Category category;
	
	@OneToMany(mappedBy = "subcategory1")
	private List<Product> product;

	public String getSubcategory1() {
		return subcategory1;
	}

	public void setSubcategory1(String subcategory1) {
		this.subcategory1 = subcategory1;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public List<Product> getProduct() {
		return product;
	}

	public void setProduct(List<Product> product) {
		this.product = product;
	}
	
	
	
	
	
}
