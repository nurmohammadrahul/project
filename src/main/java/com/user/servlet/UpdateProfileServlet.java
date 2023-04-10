package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDaoImpl;
import com.DB.DbConnect;
import com.entity.User;
@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String name=req.getParameter("fname");
     	   String email=req.getParameter("email");
     	   String phonenumber=req.getParameter("phonenumber");
     	   String password=req.getParameter("password");
     	  HttpSession session =req.getSession();
     	 
     	   User us = new User();
     	   us.setId(id);
     	   us.setName(name);
     	   us.setEmail(email);
     	   us.setPhonenumber(phonenumber);
     	
     	  UserDaoImpl dao= new  UserDaoImpl(DbConnect.getConn());
     	   boolean f = dao.checkPassword(id, password);
     	   if(f) {
     		   boolean f2= dao.updateProfile(us);
     		   if(f2) { session.setAttribute("succmsg", "Profile Updated Successfully");
          	 resp.sendRedirect("setting.jsp");
           }
           else {
          	 session.setAttribute("failedmsg", "Not Updated ");
          	 resp.sendRedirect("editprofile.jsp");
           }
     	   }else {
     		  session.setAttribute("succmsg", "Your password is incorrect");
           	 resp.sendRedirect("editprofile.jsp");
     	   }
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
