package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.CartDAOImpl;
import com.DAO.ProductOrderDAOImpl;
import com.DB.DbConnect;
import com.entity.Cart;
import com.entity.ProductOrder;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 try {
			 int id = Integer.parseInt(req.getParameter("oid"));
			 String uname=req.getParameter("oname");
			 String uemail=req.getParameter("oemail");
			 String uphonenumber=req.getParameter("opn");
			 String address=req.getParameter("oaddress");
			 String city=req.getParameter("ocity");
			 String zip=req.getParameter("ozip");
			 String upayment=req.getParameter("opayment");
			 String fullAdd=address+","+city+","+zip;
			// System.out.println(name+" "+email+" "+" "+phonenumber+" "+fullAddress+" "+payment);
			 CartDAOImpl dao=new CartDAOImpl(DbConnect.getConn());
			List<Cart> plist= dao.getProductByUser(id);
			if(plist.isEmpty()) {
				resp.sendRedirect("checkout.jsp");
			}
			else {

				ProductOrderDAOImpl dao2 = new ProductOrderDAOImpl(DbConnect.getConn());
				ProductOrder o = null;
				ArrayList<ProductOrder>orderList = new ArrayList<ProductOrder>();
				Random r = new Random();
				for(Cart c: plist) {
					o=new ProductOrder();
					o.setOid("PRODUCT-00"+r.nextInt(1000));
					o.setOname(uname);
					o.setOemail(uemail);
					o.setOpn(uphonenumber);
					o.setFullAddress(fullAdd);
					o.setProductName(c.getProductName());
					o.setPrice(c.getPrice());
					o.setPaymentType(upayment);
					orderList.add(o);
					System.out.println(c.getProductName()+" "+c.getPrice()+" "+o.getOname()+" "+o.getFullAddress() +" "+o.getPaymentType()+" "+o.getOid());
					
				}
				boolean f = dao2.saveOrder(orderList);
				if(f) {
					System.out.println("Order Success");
					resp.sendRedirect("ordersuccess.jsp");				}
				else {
					System.out.println("Order Not Success");
				}
			}
			
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
	}

}
