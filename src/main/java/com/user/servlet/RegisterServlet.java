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
@WebServlet("/register")
public class RegisterServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
           try {
        	   String name=req.getParameter("fname");
        	   String email=req.getParameter("email");
        	   String phonenumber=req.getParameter("phonenumber");
        	   String password=req.getParameter("password");
        	   String check=req.getParameter("check");
        	  // System.out.println(name+" "+email+" "+password+" "+phonenumber+" "+check);
            User us = new User();
            us.setName(name);
            us.setEmail(email);
            us.setPhonenumber(phonenumber);
            us.setPassword(password);
            
            HttpSession session =req.getSession();
            
            if(check!=null) {
            	 UserDaoImpl dao = new UserDaoImpl(DbConnect.getConn());
                 boolean f2=dao.checkUser(email);
                 if(f2) {
                	 boolean f=dao.userRegister(us);
                     if(f) {
                     //	System.out.println("User Registration Successful");
                    	 session.setAttribute("succmg", "Registration Successful");
                    	 resp.sendRedirect("register.jsp");
                     }
                     else {
                     	//System.out.println("Fuck Off");
                    	 session.setAttribute("failedmg", "Something Wrong");
                    	 resp.sendRedirect("register.jsp");
                     }
                	 
                 }else {
                	 session.setAttribute("failedmg", "This Email is already registered");
                	 resp.sendRedirect("register.jsp");
                 }
            }
            else {
            	//System.out.println("Please Agree Terms and Conditions");
           	 session.setAttribute("failedmg", "Please Agree Terms and Conditions");
        	 resp.sendRedirect("register.jsp");
            }
            
           
            
           }catch(Exception e) {
        	   e.printStackTrace();
           }
	}
	

}
