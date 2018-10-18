package org.marketing.dao;

import java.util.List;

import org.marketing.model.Product;
import org.marketing.model.Promotions;
import org.marketing.model.Retailer;
import org.marketing.model.User;

public interface RetailerDao {

	
	public List<Retailer> listAllRetailer();
	
	public List<Retailer> ListRetailerById(String email);
	
	public void registerRetailer(Retailer retailer);
	
	public void update(Retailer retailer);
			
	public Retailer findRetailerById(int retId);
	
	public Retailer findRetailerByEmail(String email);
	
	public User getUser(String email);
	
	public boolean isEmailUnique(String email);
	
	public List<Product> getProductDetails(String email);
	
	public List<Product> listAllProductByRetailer(int retId);
	
	public void addPromocode(Promotions promotions);
	
	public List<Promotions> getPromoDetails(String email);
	
	public List<Promotions> ListAllPromoCode();
	
	public Promotions findPromoById(int pid);
	
	public void deletePromoCode(Promotions promotions);
	
	
}
