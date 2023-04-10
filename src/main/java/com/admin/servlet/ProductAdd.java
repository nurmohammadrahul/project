package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.ProductDAOImpl;
import com.DB.DbConnect;
import com.entity.ProductDetails;
@WebServlet("/add_product")
@MultipartConfig
public class ProductAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String productName = req.getParameter("pname");
			String productType = req.getParameter("ptype");
			Double productPrice = Double.parseDouble(req.getParameter("price"));
			int productQuantity = Integer.parseInt(req.getParameter("pquantity"));
			Part part =req.getPart("pimage");
			String fileName=part.getSubmittedFileName();
			ProductDetails p= new ProductDetails( productName, productType,  productPrice, productQuantity, fileName);
			//System.out.println(p);
			ProductDAOImpl dao = new ProductDAOImpl(DbConnect.getConn());
			boolean f =dao.addProduct(p);
			HttpSession session = req.getSession();
			
			if(f==true) {
				String path = getServletContext().getRealPath("")+"jersey";
		
			File file= new File(path);
			part.write(path + File.separator + fileName);
				session.setAttribute("succmsg","product added");
				resp.sendRedirect("admin/addproduct.jsp");
			}else {
				session.setAttribute("failedmsg","not product added");
				resp.sendRedirect("admin/addproduct.jsp");
			}
		
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
