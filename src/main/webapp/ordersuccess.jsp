<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ordersuccess</title>
<%@include file="allcomponents/allCSS.jsp"%>
</head>
<body style="background-color: #E5E8E8;">
	<%@include file="allcomponents/navbar.jsp"%>
	<div class="container">
	<div class="row p-5 mt-4">
	<div class="col-md-12 text-center">
	  <h1 class="text-success">Thank you for your order</h1>
	  <h1 class="text-success">Your order will be delivered within <strong>15</strong> days.</h1>
	  <h1>Contact us for further inquiry</h1>
	  <a href="order.jsp" class="btn btn-lg btn-warning">My Order</a>
	  </div>
	</div>
	</div>
<div style="margin-top: 310px"><%@include file="allcomponents/footer.jsp"%></div>
</body>
</html>