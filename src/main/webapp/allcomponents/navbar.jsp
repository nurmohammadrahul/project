<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<div class="container-fluid"
	style="height: 10px; background-color: #e65100;"></div>
<div class="container-fluid p-3">
	<div class="row">
		<div class="col-md-3">
	      <h2 style="color:#FF0000;">Desire Sports</h2>
		</div>
		<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
				<input class="form-control mr-sm-2" type="search" name="ch"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
		<div class="col-md-3">
			<c:if test="${not empty userobj}">
				<a href="checkout.jsp" class="btn btn-success"><i
					class="fa-solid fa-cart-shopping fa-2x"></i></a>
				<a href="index.jsp" class="btn btn-success text-white"> <i
					class="fas fa-solid fa-user"></i> ${userobj.name}
				</a>
				<a data-toggle="modal" data-target="#exampleModal"
					class="btn btn-success text-white"><i
					class="fa-solid fa-right-to-bracket"></i> Logout</a>
			</c:if>
			<c:if test="${empty userobj}">
				<a href="login.jsp" class="btn btn-success text-white"><i
					class="fa-solid fa-right-to-bracket"></i> Login</a>

				<a href="register.jsp" class="btn btn-primary text-white"><i
					class="fa-solid fa-id-card"></i> Register </a>
			</c:if>
		</div>
	</div>
</div>
<!-- Logout Modal -->
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel"> Logout</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<h4>Do you want to logout?</h4>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<a href="logout" type="button" class="btn btn-primary text-white">
					<i class="fa-solid fa-right-to-bracket"></i> Logout
				</a>
			</div>
		</div>
	</div>
</div>
<!-- End -->
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp"><i
					class="fas fa-regular fa-house"></i> Home <span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="alljersey.jsp"><i class="fas fa-light fa-shirt"></i>
					Jersey</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="allshorts.jsp"><i class="fas fa-regular fa-person-running"></i>
					Shorts</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="allfootball.jsp"><i class="fas fa-duotone fa-futbol"></i>
					Football</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="allboots.jsp"><i class="fas fa-duotone fa-shoe-prints"></i>
					Boots</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<a href="setting.jsp" class="btn btn-light my-2 my-sm-0" type="submit">
				<i class="fas fa-duotone fa-gear"></i> Setting
			</a>
			<button class="btn btn-light my-2 my-sm-0" type="submit">
				<i class="fa-sharp fa-regular fa-address-book"></i> Contact Us
			</button>
		</form>
	</div>
</nav>