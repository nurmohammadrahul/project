<%@page import="java.util.List"%>
<%@page import="com.DB.DbConnect"%>
<%@page import="com.DAO.ProductDAOImpl"%>
<%@page import="com.entity.ProductDetails"%>
<%@page import="com.DAO.UserDaoImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Desire Sports</title>
<%@include file="allcomponents/allCSS.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/wp2022767.jpg");
	height: 50vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
.crd-ho:hover{
background-color:#bdbdbd;
}
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}

</style>
</head>
<body style="background-color:#757575;">
<c:if test="${not empty add_cart}">
<div id="toast">${add_cart}</div>

<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>

</c:if>
<% User us =(User)session.getAttribute("userobj");
%>
	<%@include file="allcomponents/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h1 class="text-center" style="font-family:Castellar;color: crimson; font-size:800%;">Desire Sports</h1>
	</div>
	
	
	<!-- Shorts -->
	<div class="container">
		<h3 class="text-center text-white"style="font-size:400%;">Shorts</h3>
		<div class="row">
			
			<%
			   ProductDAOImpl dao =new ProductDAOImpl(DbConnect.getConn());
			  List<ProductDetails> list = dao.getAllShorts();
			  for(ProductDetails p:list){
				  %>
				  <div class="col-md-3">
				  <div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="jersey/<%= p.getProductPic() %>"
							style="width: 150px; height: 200px;" class="img-thumblin">
					 <p><%= p.getProductName() %></p>
					 <p></p>
					 <div class="row">
					 <% if(us==null){ %>
					 <a href="login.jsp" class="btn btn-success btn-sm ml-4"> Add to Cart</a>
					 <a href="login.jsp" class="btn btn-success btn-sm ml-4"><%= p.getProductPrice() %></a>
					  <%
					 }else{
					  %>
					   <a href="cart?pid=<%=p.getProductId()%>&&uid=<%=us.getId()%>" class="btn btn-success btn-sm ml-4"> Add to Cart</a>
					 <a href="cart?pid=<%=p.getProductId()%>&&uid=<%=us.getId()%>" class="btn btn-success btn-sm ml-4"><%= p.getProductPrice() %></a>
					 <%
					 }
					 %>
					 </div>
					</div>
				</div>
				</div>
			  <%
			  }
			%>
			

		</div>
	</div>
	<!-- end Shorts -->
	<hr>
	<div style="margin-top: 310px"><%@include file="allcomponents/footer.jsp"%></div>
</body>
</html>