package com.DAO;

import java.util.List;

import com.entity.ProductDetails;

public interface ProductDAO {
	public boolean addProduct(ProductDetails p);
	public List<ProductDetails> getAllProducts();
	public ProductDetails getProductById(int id);
	public boolean updateEditProduct(ProductDetails p);
	public boolean deleteProduct(int id);
	public List<ProductDetails> getJersey();
	public List<ProductDetails> getShorts();
	public List<ProductDetails> getFootball();
	public List<ProductDetails> getBoots();
	public List<ProductDetails> getAllJersey();
	public List<ProductDetails> getAllShorts();
	public List<ProductDetails> getAllFootball();
	public List<ProductDetails> getAllBoots();
	public List<ProductDetails> getProductBySearch(String ch);
}
