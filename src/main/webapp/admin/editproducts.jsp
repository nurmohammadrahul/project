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
<title>Edit product</title>
<%@ include file="allCSS.jsp"%>
</head>
<body style="background-color: #f0f2f2;">
	<%@ include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
	<c:redirect url="../login.jsp" />
	</c:if>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card center">
					<div class="card-body">
					<%
					int id =Integer.parseInt(request.getParameter("id"));
					ProductDAOImpl dao = new ProductDAOImpl(DbConnect.getConn());
					ProductDetails p = dao.getProductById(id);
					%>
						<form action="../editproducts" method="post"
							>
							<h3 class="text-center"><i class="fas fa-solid fa-pen-to-square"></i> Edit Product</h3>
							
							<input type="hidden" name ="id" value="<%= p.getProductId()%>">
							<div class="form-group">
								<label for="exampleInputEmail1">Product Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="pname" value="<%= p.getProductName()%>">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Price</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="price"value="<%= p.getProductPrice()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Quantity</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required"
									name="pquantity" value="<%= p.getProductQuantity()%>">
							</div>
							
							
							<button type="submit" class="btn btn-primary">UPDATE
								PRODUCT</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 130px"><%@include file="footer.jsp"%></div>
</body>
</html>