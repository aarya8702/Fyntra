package org.admin.dao;

import java.util.List;

import org.admin.model.Retailer;

public interface RetailerDao {

	
	public List<Retailer> listAllRetailer();
	
	public void registerRetailer(Retailer retailer);
	
	public void update(Retailer retailer);
	
	public void delete(Retailer retailer);
	
	public Retailer findRetailerById(int retId);
	
	public boolean isEmailUnique(String email);
	
	public List<Retailer> ListRetailerById(int retId);
}
