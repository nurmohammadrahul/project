package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.ProductDAOImpl;
import com.DB.DbConnect;
import com.entity.ProductDetails;

@WebServlet("/editproducts")
public class EditProductServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
try {
	int id = Integer.parseInt(req.getParameter("id"));
	String productName = req.getParameter("pname");
	Double productPrice = Double.parseDouble(req.getParameter("price"));
	int productQuantity = Integer.parseInt(req.getParameter("pquantity"));
	
	ProductDetails p =new ProductDetails();
	p.setProductId(id);
	p.setProductName(productName);
	p.setProductPrice(productPrice);
	p.setProductQuantity(productQuantity);
	ProductDAOImpl dao = new ProductDAOImpl(DbConnect.getConn());
	boolean f = dao.updateEditProduct(p);
	HttpSession session = req.getSession();
	if(f) {
		session.setAttribute("succmsg", "Product Updated Successfully");
		resp.sendRedirect("admin/allproduct.jsp");
		
	}
	else {
		session.setAttribute("failedmsg", "Product Updated not Successfully");
		resp.sendRedirect("admin/allproduct.jsp");
	}
}catch(Exception e) {
	e.printStackTrace();
	
}
	}

}
