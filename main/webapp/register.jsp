<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>

        <div class="container-fluid">
            <div class="row mt-5">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <%@include file="components/message.jsp" %>
                        <div class="card-body px-5">
                            <div class="container text-center">
                                <img src="img/add-user.png" style="max-height: 100px" class="image-fluid">
                            </div>
                     
                            <h3 class="text-center">Sign Up</h3>
                            <form action="RegisterServlet" method="post">
                                <div class="form-group">
                                    <label for="name">User Name</label>
                                    <input name="user_name" type="text" class="form-control" id="name" placeholder="Enter name">
                                </div>
                                <div class="form-group">
                                    <label for="email">User E-mail</label>
                                    <input name="user_email" type="email" class="form-control" id="email" placeholder="Enter email">
                                </div>
                                <div class="form-group">
                                    <label for="password">User Password</label>
                                    <input name="user_password" type="password" class="form-control" id="password" placeholder="Enter Password">
                                </div>
                                <div class="form-group">
                                    <label for="phonenumber">User Phone Number</label>
                                    <input name="user_phonenumber" type="number" class="form-control" id="phonenumber" placeholder="Enter Your Phone Number">
                                </div>
                                <div class="form-group">
                                    <label for="address">User Address</label>
                                    <input name="user_address" type="text" class="form-control" id="address" placeholder="Enter Your Address">
                                </div>
                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Register</button>
                                    <button class="btn btn-outline-warning">Reset</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
