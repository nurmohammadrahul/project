package com.entity;

public class ProductDetails {
	private int productId;
	private String productName;
	private String productType;
	private Double productPrice;
	private int productQuantity;
	private String productPic;
	public ProductDetails() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductDetails(String productName, String productType, Double productPrice, int productQuantity,
			String productPic) {
		super();
		this.productName = productName;
		this.productType = productType;
		this.productPrice = productPrice;
		this.productQuantity = productQuantity;
		this.productPic = productPic;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductType() {
		return productType;
	}
	public void setProductType(String productType) {
		this.productType = productType;
	}
	public Double getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(Double productPrice) {
		this.productPrice = productPrice;
	}
	public int getProductQuantity() {
		return productQuantity;
	}
	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}
	public String getProductPic() {
		return productPic;
	}
	public void setProductPic(String productPic) {
		this.productPic = productPic;
	}
	@Override
	public String toString() {
		return "ProductDetails [productId=" + productId + ", productName=" + productName + ", productType="
				+ productType + ", productPrice=" + productPrice + ", productQuantity=" + productQuantity
				+ ", productPic=" + productPic + "]";
	}
	
}
