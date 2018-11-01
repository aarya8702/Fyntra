package org.admin.model;

import java.math.BigDecimal;
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
@Table(name="shopping_cart")
public class ShoppingCart {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private BigDecimal grandTotal;
	
	private BigDecimal oldGrandTotal;

	@OneToMany(mappedBy = "shoppingCart",cascade = CascadeType.ALL)
	private List<CartItem> cartItem;
	
	@OneToOne(cascade = CascadeType.ALL)
	private Customer customer;

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	

	public BigDecimal getGrandTotal() {
		return grandTotal;
	}

	public void setGrandTotal(BigDecimal grandTotal) {
		this.grandTotal = grandTotal;
	}

	public List<CartItem> getCartItem() {
		return cartItem;
	}

	public void setCartItem(List<CartItem> cartItem) {
		this.cartItem = cartItem;
	}

	public BigDecimal getOldGrandTotal() {
		return oldGrandTotal;
	}

	public void setOldGrandTotal(BigDecimal oldGrandTotal) {
		this.oldGrandTotal = oldGrandTotal;
	}

	
	
	
}
