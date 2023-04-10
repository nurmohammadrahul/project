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

@WebServlet("/delete")
public class ProductDeleteServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			ProductDAOImpl dao= new ProductDAOImpl(DbConnect.getConn());
			boolean f =dao.deleteProduct(id);
			HttpSession session = req.getSession();
			if(f) {
				session.setAttribute("succmsg", "Product Deleted Successfully");
				resp.sendRedirect("admin/allproduct.jsp");
				
			}
			else {
				session.setAttribute("failedmsg", "Product Deleted not Successfully");
				resp.sendRedirect("admin/allproduct.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	

}
