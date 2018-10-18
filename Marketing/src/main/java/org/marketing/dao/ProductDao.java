package org.marketing.dao;
import java.util.List;

import org.marketing.model.*;


public interface ProductDao {

	public List<Product> listAllProducts();
	
	public void save(Product product);
	
	public void update(Product product);
	
	public void delete(Product product);
	
	public Product findProductById(int productId);
	
	public Product findProductByEmail(String email);
	
//	public Retailer getRetailer(String email);
	
	public User getUser(String email);
	
	public List<Product> ListProductById(int productId);
	
	public List<Product> searchProductsByCategoryId(String maincategory);
	
	public List<Product> searchProductsBySearchTerm(String searchString);
	
	List<Product> blurrySearch(String searchTerm);
	
	public List<Product> findProductsBySubCat1(String subcategory1);

	
}
