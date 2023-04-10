package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DAO.ProductDAOImpl;
import com.DB.DbConnect;
import com.entity.Cart;
import com.entity.ProductDetails;
@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int pid = Integer.parseInt(req.getParameter("pid"));
			int uid = Integer.parseInt(req.getParameter("uid"));
			ProductDAOImpl dao = new ProductDAOImpl(DbConnect.getConn());
			ProductDetails p = dao.getProductById(pid);
			
			
			Cart c= new Cart();
		  c.setPid(pid);
		  c.setUserId(uid);
		  c.setProductName(p.getProductName());
		  c.setPrice(p.getProductPrice());
		  c.setTotalPrice(p.getProductPrice());
		  
		  CartDAOImpl dao2 = new CartDAOImpl(DbConnect.getConn());
		  
		  boolean f= dao2.addCart(c);
		  HttpSession session = req.getSession();
		  if(f) {
			  session.setAttribute("add_cart","Product added to your cart");
			 resp.sendRedirect("index.jsp");
			 // System.out.println("Added");
		  }else {
			  System.out.println("Not Added");
		  }
		  
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
