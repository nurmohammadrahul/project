<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Setting</title>
<%@include file="allcomponents/allCSS.jsp"%>
</head>
<body style="background-color: #E5E8E8;">
	<%@include file="allcomponents/navbar.jsp"%>
	<div class="container">
		<h3 class="text-center text-success">Hello</h3>
		<c:if test="${not empty succmsg}">
			<h3 class="text-center text-success">${succmsg }</h3>
			<c:remove var="succmsg" scope="session" />
		</c:if>
		<div class="row">
			<div class="col-md-6">
				<a href="editprofile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-address-book fa-3x"></i>
							</div>
							<h4>Profile</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-6">
				<a href="address.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-location-dot fa-3x"></i>
							</div>
							<h4>My Address</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-12 mt-3">
				<a href="order.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-danger">
								<i class="fas fa-solid fa-box-open fa-3x"></i>
							</div>
							<h4>My Order</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-12 mt-3">
				<div class="card">
					<div class="card-body text-center">
						<div class="text-danger">
							<i class="fa-solid fa-circle-info fa-3x"></i>
						</div>
						<h4>For Help</h4>
						<h4>Contact</h4>
						<h4>desiresports@gmail.com</h4>
						<h4>01571320869</h4>
					</div>
				</div>
			</div>
		</div>

	</div>
	<div style="margin-top: 20px"><%@include file="allcomponents/footer.jsp"%></div>
</body>
</html>