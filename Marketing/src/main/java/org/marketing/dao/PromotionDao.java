package org.marketing.dao;

import java.util.List;

import org.marketing.model.Promotions;

public interface PromotionDao {

public void addPromocode(Promotions promotions);
	
	public List<Promotions> getPromoDetails(String email);
	
	public List<Promotions> ListAllPromoCode();
	
	public Promotions findPromoById(int pid);
	
	public void deletePromoCode(Promotions promotions);
	
	public List<Promotions> blurrySearch(String searchTerm);
}
