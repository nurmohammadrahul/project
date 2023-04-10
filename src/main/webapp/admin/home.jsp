<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
<%@ include file="allCSS.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
	<c:redirect url="../login.jsp" />
	</c:if>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3">
				<a href="addproduct.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-plus-square fa-3x"></i><br>
							<h1>Add Products</h1>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a href="allproduct.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-sharp fa-solid fa-cart-shopping fa-3x"></i><br>
							<h1>All Products</h1>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a href="orders.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-solid fa-boxes-stacked fa-3x"></i><br>
							<h1>Orders</h1>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	<div style="margin-top:400px"><%@include file="footer.jsp" %></div>
</body>
</html>