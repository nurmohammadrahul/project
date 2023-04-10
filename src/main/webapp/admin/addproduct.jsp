<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add product</title>
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
						<form action="../add_product" method="post"
							enctype="multipart/form-data">
							<h3 class="text-center">Add Product</h3>
							<c:if test="${not empty succmsg }">
								<p class="text-center text-success">${succmsg }</p>
								<c:remove var="succmsg" scope="session" />
							</c:if>
							<c:if test="${not empty failedmsg }">
								<p class="text-center text-success">${failedmsg }</p>
								<c:remove var="failedmsg" scope="session" />
							</c:if>
							<div class="form-group">
								<label for="exampleInputEmail1">Product Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="pname">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Price</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="price">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Quantity</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required"
									name="pquantity">
							</div>
							<div class="form-group">
								<label for="inputState">Type</label> <select id="inputState"
									class="form-control" name="ptype">
									<option selected>..select..</option>
									<option value="jersey">Jersey</option>
									<option value="shorts">Shorts</option>
									<option value="football">Football</option>
									<option value="boots">Boots</option>
								</select>
							</div>
							<div class="form-group">
								<label for="exampleFormControlFile1">Image</label> <input
									type="file" class="form-control-file"
									id="exampleFormControlFile1" name="pimage">
							</div>
							<button type="submit" class="btn btn-primary">ADD
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