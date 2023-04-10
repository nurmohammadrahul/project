<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Log In</title>
<%@include file="allcomponents/allCSS.jsp"%>
</head>
<body>
	<%@include file="allcomponents/navbar.jsp"%>
	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">
							<i class="fas fa-regular fa-users"></i> Log in
						</h4>
						<c:if test="${not empty failledmg }">
							<h1 class="text-center text-danger">${failledmg }</h1>
							<c:remove var="failledmg" scope="session" />
						</c:if>
						<c:if test="${not empty succmsg}">
							<h3 class="text-center text-success">${succmsg }</h3>
							<c:remove var="succmsg" scope="session" />
						</c:if>

						<form action="login" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Email</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required="required" name="password">
							</div>
							<div class="text-center">
								<button type="submit" class="btn
btn-primary ">Login</button>
								<br> <a href="register.jsp">Create Account</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<div style="margin-top: 220px"><%@include file="allcomponents/footer.jsp"%></div>
</html>