<%@page import="java.util.List"%>
<%@page import="com.DB.DbConnect"%>
<%@page import="com.DAO.ProductDAOImpl"%>
<%@page import="com.entity.ProductDetails"%>
<%@page import="com.DAO.UserDaoImpl"%>
<%@page import="com.entity.User"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="com.entity.Cart"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your Cart</title>
<%@include file="allcomponents/allCSS.jsp"%>
</head>
<body style="background-color: #E5E8E8;">
	<%@include file="allcomponents/navbar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<c:if test="${not empty succmsg }">
		<div class="alert alert-success" role="alert">${succmsg }</div>
		<c:remove var="succmsg" scope="session" />
	</c:if>
	<c:if test="${not empty failedmsg }">
		<div class="alert alert-danger" role="alert">${failedmsg }</div>
		<c:remove var="failedmsg" scope="session" />
	</c:if>
	<div class="container">
		<div class="row p-2">
			<div class="col-md-6">

				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Your Items</h3>
						<table class="table">
							<thead class="thead-dark">
								<tr>
									<th scope="col">Product Name</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								User u = (User) session.getAttribute("userobj");
								CartDAOImpl dao = new CartDAOImpl(DbConnect.getConn());
								List<Cart> cart = dao.getProductByUser(u.getId());
								Double totalPrice = 0.00;
								for (Cart c : cart) {
									totalPrice = c.getTotalPrice();
								%>
								<tr>
									<th scope="row"><%=c.getProductName()%></th>
									<td><%=c.getPrice()%></td>
									<td><a href="remove_product?pid=<%=c.getPid()%>&&uid=<%=c.getUserId()%>&&cid=<%=c.getCid()%>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>
								<%
								}
								%>

								<tr>
									<th class="text-success"><strong>Total Price</strong></th>
									<td></td>
									<td class="text-danger"><strong><%=totalPrice%></strong></td>
								</tr>
							</tbody>
						</table>

					</div>
				</div>
			</div>


			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Your Details</h3>
						<form action="order" method="post">
						<input type="hidden" value="${userobj.id}" name="oid">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text"
										class="form-control" id="inputEmail4" name="oname" required="required" value="${userobj.name}">
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4">Email</label> <input type="email"
										class="form-control" id="inputEmail4" required="required" name="oemail" value="${userobj.email}" readonly="readonly">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Phone Number</label> <input
										type="number" class="form-control" id="inputEmail4"required="required" name="opn"value="${userobj.phonenumber}">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text" name="oaddress"
										required="required" class="form-control" id="inputPassword4">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">City</label><input type="text" name="ocity" required="required"
										class="form-control" id="inputEmail4">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Zip</label><input type="text" name="ozip" required="required"
										class="form-control" id="inputPassword4">
								</div>
							</div>
							<div class="form-group">
								<label>Payment Mode</label> <select class="form-control" name="opayment" type="text" required="required">
									<option value="COD">COD</option>
								</select>
							</div>
							<div class="text-center">
								<button class="btn btn-lg btn-warning">Order Now</button>
								<a href="index.jsp" class="btn btn-lg btn-success">Continue
									Shopping</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<div style="margin-top: 40px"><%@include file="allcomponents/footer.jsp"%></div>
</body>
</html>