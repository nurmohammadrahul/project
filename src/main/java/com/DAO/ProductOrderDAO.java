package com.DAO;

import java.util.List;

import com.entity.ProductOrder;

public interface ProductOrderDAO {

	public boolean saveOrder(List<ProductOrder>p);
	public List<ProductOrder>getProduct(String email);
	public List<ProductOrder>getALLProduct();

}
