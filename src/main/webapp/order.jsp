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
<title>My Order</title>
<%@include file="allcomponents/allCSS.jsp"%>
</head>
<body style="background-color: #E5E8E8;">
	<%@include file="allcomponents/navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">My Order</h4>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Order ID</th>
									<th scope="col">Name</th>
									<th scope="col">Product Name</th>
									<th scope="col">Price</th>
									<th scope="col">Payment Type</th>
								</tr>
							</thead>
							<tbody>
								<%
								User us = (User) session.getAttribute("userobj");
								ProductOrderDAOImpl dao = new ProductOrderDAOImpl(DbConnect.getConn());
								List<ProductOrder> plist = dao.getProduct(us.getEmail());
								for (ProductOrder p : plist) {
								%>
								<tr>
									<th scope="row"><%=p.getOid()%></th>
									<td><%=p.getOname()%></td>
									<td><%=p.getProductName()%></td>
									<td><%=p.getPrice()%></td>
									<td><%=p.getPaymentType()%></td>
								</tr>
								<%
								}
								%>


							</tbody>
						</table>
					</div>
				</div>

			</div>
		</div>

	</div>
	<div style="margin-top: 120px"><%@include file="allcomponents/footer.jsp"%></div>
</body>
</html>