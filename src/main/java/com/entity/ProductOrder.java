package com.entity;

public class ProductOrder {
	private int id;
	private String oid;
	private String oname;
	private String oemail;
	private String opn;
	private String fullAddress;
	private String paymentType;
	private String productName;
	private Double price;
	public ProductOrder() {
		super();
	}
	
	

	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getOid() {
		return oid;
	}



	public void setOid(String oid) {
		this.oid = oid;
	}



	public String getOname() {
		return oname;
	}



	public void setOname(String oname) {
		this.oname = oname;
	}



	public String getOemail() {
		return oemail;
	}



	public void setOemail(String oemail) {
		this.oemail = oemail;
	}



	public String getOpn() {
		return opn;
	}



	public void setOpn(String opn) {
		this.opn = opn;
	}



	public String getFullAddress() {
		return fullAddress;
	}



	public void setFullAddress(String fullAddress) {
		this.fullAddress = fullAddress;
	}



	public String getPaymentType() {
		return paymentType;
	}



	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}



	public String getProductName() {
		return productName;
	}



	public void setProductName(String productName) {
		this.productName = productName;
	}



	public Double getPrice() {
		return price;
	}



	public void setPrice(Double price) {
		this.price = price;
	}



	@Override
	public String toString() {
		return "ProductOrder [id=" + id + ", oid=" + oid + ", oname=" + oname + ", oemail=" + oemail + ", opn=" + opn
				+ ", fullAddress=" + fullAddress + ", paymentType=" + paymentType + ", productName=" + productName
				+ ", price=" + price + "]";
	}
	
	
	
	
}
