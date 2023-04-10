package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.ProductDetails;

public class ProductDAOImpl implements ProductDAO {
	private Connection conn;

	public ProductDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addProduct(ProductDetails p) {
		boolean f = false;
		try {
			String sql = "insert into product(productname ,productprice ,producttype,productpic,productquantity) values(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, p.getProductName());
			ps.setDouble(2, p.getProductPrice());
			ps.setString(3, p.getProductType());
			ps.setString(4, p.getProductPic());
			ps.setInt(5, p.getProductQuantity());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;

	}

	public List<ProductDetails> getAllProducts() {
		// TODO Auto-generated method stub
		List<ProductDetails>list =new ArrayList<ProductDetails>();
		ProductDetails p=null;
		try {
			String sql = "select * from product";
			PreparedStatement ps =  conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				p = new ProductDetails();
				p.setProductId(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setProductPrice(rs.getDouble(3));
				p.setProductType(rs.getString(4));
				p.setProductQuantity(rs.getInt(6));
				p.setProductPic(rs.getString(5));
				list.add(p);
			}
			

		} catch (Exception e) {
			e.printStackTrace();

		}
		return list;
	}

	public ProductDetails getProductById(int id) {
		ProductDetails p =null;
		try {
			String sql= "select * from product where productid=?";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setInt(1, id);
			 
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				p = new ProductDetails();
				p.setProductId(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setProductPrice(rs.getDouble(3));
				p.setProductType(rs.getString(4));
				p.setProductQuantity(rs.getInt(6));
				p.setProductPic(rs.getString(5));

			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return p;
	}

	public boolean updateEditProduct(ProductDetails p) {
		boolean f = false;
		try {
			String sql = "update product set productname=?,productprice=?, productquantity=? where productid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, p.getProductName());
			ps.setDouble(2, p.getProductPrice());
			ps.setInt(3, p.getProductQuantity());
			ps.setInt(4, p.getProductId());
			
			int i = ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return f;
	}

	public boolean deleteProduct(int id) {
		boolean f= false;
		try {
			String sql ="delete from product where productid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,id);
			int i = ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<ProductDetails> getJersey() {
		 List<ProductDetails> list =new ArrayList<ProductDetails>();
		 ProductDetails p= null;
		 try {
			 String sql= "select * from product where producttype=? order by productid DESC";
			 
			 PreparedStatement ps = conn.prepareStatement(sql);
			 ps.setString(1,"jersey");
			 ResultSet rs = ps.executeQuery();
			 int i=1 ;
			 while(rs.next() && i<=4) {
				p= new ProductDetails();
				p.setProductId(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setProductPrice(rs.getDouble(3));
				p.setProductType(rs.getString(4));
				p.setProductQuantity(rs.getInt(6));
				p.setProductPic(rs.getString(5));
				list.add(p);
				i++;
			 }
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		 
		return list;
	}
	
	public List<ProductDetails> getShorts() {
		 List<ProductDetails> list1 =new ArrayList<ProductDetails>();
		 ProductDetails p= null;
		 try {
			 String sql= "select * from product where producttype=? order by productid DESC";
			 
			 PreparedStatement ps = conn.prepareStatement(sql);
			 ps.setString(1,"shorts");
			 ResultSet rs = ps.executeQuery();
			 int i=1 ;
			 while(rs.next() && i<=4) {
				p= new ProductDetails();
				p.setProductId(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setProductPrice(rs.getDouble(3));
				p.setProductType(rs.getString(4));
				p.setProductQuantity(rs.getInt(6));
				p.setProductPic(rs.getString(5));
				list1.add(p);
				i++;
			 }
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		 
		return list1;
	}
	public List<ProductDetails> getFootball() {
		 List<ProductDetails> list1 =new ArrayList<ProductDetails>();
		 ProductDetails p= null;
		 try {
			 String sql= "select * from product where producttype=? order by productid DESC";
			 
			 PreparedStatement ps = conn.prepareStatement(sql);
			 ps.setString(1,"football");
			 ResultSet rs = ps.executeQuery();
			 int i=1 ;
			 while(rs.next() && i<=4) {
				p= new ProductDetails();
				p.setProductId(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setProductPrice(rs.getDouble(3));
				p.setProductType(rs.getString(4));
				p.setProductQuantity(rs.getInt(6));
				p.setProductPic(rs.getString(5));
				list1.add(p);
				i++;
			 }
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		 
		return list1;
	}
	public List<ProductDetails> getBoots() {
		 List<ProductDetails> list1 =new ArrayList<ProductDetails>();
		 ProductDetails p= null;
		 try {
			 String sql= "select * from product where producttype=? order by productid DESC";
			 
			 PreparedStatement ps = conn.prepareStatement(sql);
			 ps.setString(1,"boots");
			 ResultSet rs = ps.executeQuery();
			 int i=1 ;
			 while(rs.next() && i<=4) {
				p= new ProductDetails();
				p.setProductId(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setProductPrice(rs.getDouble(3));
				p.setProductType(rs.getString(4));
				p.setProductQuantity(rs.getInt(6));
				p.setProductPic(rs.getString(5));
				list1.add(p);
				i++;
			 }
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		 
		return list1;
	}
	public List<ProductDetails> getAllJersey() {
		 List<ProductDetails> list =new ArrayList<ProductDetails>();
		 ProductDetails p= null;
		 try {
			 String sql= "select * from product where producttype=? order by productid DESC";
			 
			 PreparedStatement ps = conn.prepareStatement(sql);
			 ps.setString(1,"jersey");
			 ResultSet rs = ps.executeQuery();
			 int i=1 ;
			 while(rs.next()) {
				p= new ProductDetails();
				p.setProductId(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setProductPrice(rs.getDouble(3));
				p.setProductType(rs.getString(4));
				p.setProductQuantity(rs.getInt(6));
				p.setProductPic(rs.getString(5));
				list.add(p);
				i++;
			 }
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		 
		return list;
	}
	public List<ProductDetails> getAllShorts() {
		 List<ProductDetails> list1 =new ArrayList<ProductDetails>();
		 ProductDetails p= null;
		 try {
			 String sql= "select * from product where producttype=? order by productid DESC";
			 
			 PreparedStatement ps = conn.prepareStatement(sql);
			 ps.setString(1,"shorts");
			 ResultSet rs = ps.executeQuery();
			 int i=1 ;
			 while(rs.next()) {
				p= new ProductDetails();
				p.setProductId(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setProductPrice(rs.getDouble(3));
				p.setProductType(rs.getString(4));
				p.setProductQuantity(rs.getInt(6));
				p.setProductPic(rs.getString(5));
				list1.add(p);
				i++;
			 }
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		 
		return list1;
	}
	public List<ProductDetails> getAllFootball() {
		 List<ProductDetails> list1 =new ArrayList<ProductDetails>();
		 ProductDetails p= null;
		 try {
			 String sql= "select * from product where producttype=? order by productid DESC";
			 
			 PreparedStatement ps = conn.prepareStatement(sql);
			 ps.setString(1,"football");
			 ResultSet rs = ps.executeQuery();
			 int i=1 ;
			 while(rs.next() && i<=4) {
				p= new ProductDetails();
				p.setProductId(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setProductPrice(rs.getDouble(3));
				p.setProductType(rs.getString(4));
				p.setProductQuantity(rs.getInt(6));
				p.setProductPic(rs.getString(5));
				list1.add(p);
				i++;
			 }
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		 
		return list1;
	}
	public List<ProductDetails> getAllBoots() {
		 List<ProductDetails> list1 =new ArrayList<ProductDetails>();
		 ProductDetails p= null;
		 try {
			 String sql= "select * from product where producttype=? order by productid DESC";
			 
			 PreparedStatement ps = conn.prepareStatement(sql);
			 ps.setString(1,"boots");
			 ResultSet rs = ps.executeQuery();
			 int i=1 ;
			 while(rs.next() && i<=4) {
				p= new ProductDetails();
				p.setProductId(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setProductPrice(rs.getDouble(3));
				p.setProductType(rs.getString(4));
				p.setProductQuantity(rs.getInt(6));
				p.setProductPic(rs.getString(5));
				list1.add(p);
				i++;
			 }
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		 
		return list1;
	}

	public List<ProductDetails> getProductBySearch(String ch) {
		 List<ProductDetails>list= new ArrayList<ProductDetails>();
		 ProductDetails p= null;
		 try {
			 String sql= "select * from product where productname like ? or producttype like ?";
			 
			 PreparedStatement ps = conn.prepareStatement(sql);
			 ps.setString(1,"%"+ch+"%");
			 ps.setString(2,"%"+ch+"%");
			 ResultSet rs = ps.executeQuery();
		
			 while(rs.next()) {
				p= new ProductDetails();
				p.setProductId(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setProductPrice(rs.getDouble(3));
				p.setProductType(rs.getString(4));
				p.setProductQuantity(rs.getInt(6));
				p.setProductPic(rs.getString(5));
				list.add(p);
			
			 }
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		 
		 return list;
	}
	
}
