<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Address</h4>
						<form action="">
							<div class="form-row">
								<div class="form-group col-md-12">
									<label for="inputPassword4">Address</label> <input type="text"
										class="form-control" id="inputPassword4">
								</div>

								<div class="form-group col-md-12">
									<label for="inputEmail4">City</label> <input type="text"
										class="form-control" id="inputEmail4">
								</div>
								<div class="form-group col-md-12">
									<label for="inputPassword4">Zip</label> <input type="text"
										class="form-control" id="inputPassword4">
								</div>
							</div>
							<div class="text-center">
							<button type="submit" class="btn btn-warning text-center">ADD ADDRESS</button>
							</div>

						</form>

					</div>
				</div>

			</div>
		</div>

	</div>
	<div style="margin-top: 310px"><%@include file="allcomponents/footer.jsp"%></div>
</body>
</html>