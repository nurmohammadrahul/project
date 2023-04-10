<%@page import="java.util.List"%>
<%@page import="com.DB.DbConnect"%>
<%@page import="com.DAO.ProductDAOImpl"%>
<%@page import="com.entity.ProductDetails"%>
<%@page import="com.DAO.UserDaoImpl"%>
<%@page import="com.entity.User"%>
<%@page import="com.DAO.ProductOrderDAOImpl"%>
<%@page import="com.entity.ProductOrder"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Orders</title>
<%@ include file="allCSS.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>
	<h2 class="text-center">All Orders</h2>
	<table class="table table-striped">
		<thead class="table-dark">
			<tr>
				<th scope="col">Order ID</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone Number</th>
				<th scope="col">Product Name</th>
				<th scope="col">Price</th>
				<th scope="col">Payment</th>
			</tr>
		</thead>
		<tbody>
			<%
			User us = (User) session.getAttribute("userobj");
			ProductOrderDAOImpl dao = new ProductOrderDAOImpl(DbConnect.getConn());
			List<ProductOrder> plist = dao.getALLProduct();
			for (ProductOrder p : plist) {
			%>
			<tr>
				<th scope="row"><%=p.getOid()%></th>
				<td><%=p.getOname()%></td>
				<td><%=p.getOemail()%></td>
				<td><%=p.getFullAddress()%></td>
				<td><%=p.getOpn()%></td>
				<td><%=p.getProductName()%></td>
				<td><%=p.getPrice()%></td>
				<td><%=p.getPaymentType()%></td>
			</tr>
			<%
			}
			%>
			
		</tbody>
	</table>
	<div style="margin-top: 310px"><%@include file="footer.jsp"%></div>
</body>
</html>