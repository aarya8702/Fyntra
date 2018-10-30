package org.admin.dao;

import java.util.List;

import org.admin.model.CustomerOrder;
import org.admin.model.CartItem;

public interface CartItemDao {

	public List<CartItem> listCartItemsByOrder(CustomerOrder customerOrder);
}
