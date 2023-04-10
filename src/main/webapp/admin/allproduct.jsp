<%@page import="java.util.List"%>
<%@page import="com.DB.DbConnect"%>
<%@page import="com.DAO.ProductDAOImpl"%>
<%@page import="com.entity.ProductDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Products</title>
<%@ include file="allCSS.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
	<c:redirect url="../login.jsp" />
	</c:if>
	<c:if test="${not empty succmsg }">
								<p class="text-center text-success">${succmsg }</p>
								<c:remove var="succmsg" scope="session" />
							</c:if>
							<c:if test="${not empty failedmsg }">
								<p class="text-center text-success">${failedmsg }</p>
								<c:remove var="failedmsg" scope="session" />
							</c:if>
	<h2 class="text-center">Hello Rahul</h2>
	<table class="table table-striped">
		<thead class="table-dark">
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Product Pic</th>
				<th scope="col">Product Name</th>
				<th scope="col">Product Price</th>
				<th scope="col">Product Type</th>
				<th scope="col">Product Quantity</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			ProductDAOImpl dao = new ProductDAOImpl(DbConnect.getConn());
			List<ProductDetails> list = dao.getAllProducts();
			for(ProductDetails p : list){
				%>
				<tr>
				<td><%= p.getProductId() %></td>
				<td><img src="../jersey/<%= p.getProductPic() %>" style="height: 50px ; width:50px; "></td>
				<td><%= p.getProductName() %></td>
				<td><%= p.getProductPrice() %></td>
				<td><%= p.getProductType() %></td>
				<td><%= p.getProductQuantity() %></td>
				<td><a href="editproducts.jsp?id=<%=p.getProductId()  %>" class="btn btn-sm btn-primary"><i class="fas fa-solid fa-pen-to-square"></i> Edit</a><a
					href="delete?id=<%=p.getProductId()  %>"  class="btn btn-sm btn-danger"><i class="fas fa-solid fa-trash"></i> Delete</a></td>
			</tr>
				<% 
				
			}
			%>
		</tbody>
	</table>
	<div style="margin-top: 310px"><%@include file="footer.jsp"%></div>
</body>
</html>