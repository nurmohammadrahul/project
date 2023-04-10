<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="allcomponents/allCSS.jsp"%>
</head>
<body style="background-color: #E5E8E8;">
	<%@include file="allcomponents/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Profile</h4>
						<c:if test="${not empty failedmsg }">
							<h1 class="text-center text-danger">${failedmsg }</h1>
							<c:remove var="failledmg" scope="session" />
						</c:if>
						<c:if test="${not empty succmsg}">
							<h3 class="text-center text-danger">${succmsg }</h3>
							<c:remove var="succmsg" scope="session" />
						</c:if>
						<form action="update_profile" method="post">
							<input type="hidden" value="${userobj.id}" name="id">
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Full Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="fname" value="${userobj.name }">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email"value="${userobj.email}">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Phone Number</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required"
									name="phonenumber"value="${userobj.phonenumber }">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required="required" name="password">
							</div>

							<button type="submit" class="btn btn-primary">Update</button>
						</form>
					</div>
				</div>

			</div>
		</div>

	</div>
	<div style="margin-top: 100px"><%@include file="allcomponents/footer.jsp"%></div>
</body>
</html>