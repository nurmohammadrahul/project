package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.ProductOrder;

public class ProductOrderDAOImpl implements ProductOrderDAO {
	private Connection conn;

	public ProductOrderDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	

	public boolean saveOrder(List<ProductOrder> plist) {
		boolean f= false;
		try {
	String sql = "insert into ordername(order_id,username,useremail,useraddress,userphone,userpayment,userproductname,price) values(?,?,?,?,?,?,?,?)";
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			
			for(ProductOrder p1 : plist) {
				ps.setString(1 ,p1.getOid());
				ps.setString(2,p1.getOname());
				ps.setString(3,p1.getOemail());
				ps.setString(5,p1.getOpn());
				ps.setString(4,p1.getFullAddress());
				ps.setString(7,p1.getProductName());
				ps.setDouble(8,p1.getPrice());
				ps.setString(6,p1.getPaymentType());
				ps.addBatch();
				
			}
			int[] c=ps.executeBatch();
			conn.commit();
			f=true;
			conn.setAutoCommit(true);
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}



	public List<ProductOrder> getProduct( String email) {
		List<ProductOrder> list= new ArrayList<ProductOrder>();
		ProductOrder p=null;
		try {
			String sql="select * from ordername where useremail=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				p= new ProductOrder();
				p.setId(rs.getInt(1));
				p.setOid(rs.getString(2));
				p.setOname(rs.getString(3));
				p.setOemail(rs.getString(4));
				p.setFullAddress(rs.getString(5));
				p.setOpn(rs.getString(6));
				p.setPaymentType(rs.getString(7));
				p.setProductName(rs.getString(8));
				p.setPrice(rs.getDouble(9));
				list.add(p);
				
				
			}
			
		 
				
				}catch(Exception e) {
					e.printStackTrace();
				}
				return list;
	}



	public List<ProductOrder> getALLProduct() {
		List<ProductOrder> list= new ArrayList<ProductOrder>();
		ProductOrder p=null;
		try {
			String sql="select * from ordername";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				p= new ProductOrder();
				p.setId(rs.getInt(1));
				p.setOid(rs.getString(2));
				p.setOname(rs.getString(3));
				p.setOemail(rs.getString(4));
				p.setFullAddress(rs.getString(5));
				p.setOpn(rs.getString(6));
				p.setPaymentType(rs.getString(7));
				p.setProductName(rs.getString(8));
				p.setPrice(rs.getDouble(9));
				list.add(p);
				
				
			}
			
		 
				
				}catch(Exception e) {
					e.printStackTrace();
				}
				return list;
	}

	
	

}
