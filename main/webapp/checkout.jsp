<%-- 
    Document   : checkout
    Created on : May 28, 2022, 12:30:58 AM
    Author     : NUR MOHAMMAD
--%>
<%
     User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "Login First To Order");
        response.sendRedirect("login.jsp");
        return;
    } 


    %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container">

            <div class="row mt-5">
                <div class="col-md-6">
                    <div class="card">
                        <h2 class="text-center mb-2">Your Items</h2>
                        <div class="cart-body">
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card">
                        <h2 class="text-center mb-2">Place Order</h2>
                        <div class="card-body">
                            <form>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email </label>
                                    <input value="<%= user.getUserEmail()%>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Please enter your email" required>

                                </div>
                                <div class="form-group">
                                    <label for="name">Name</label>
                                    <input value="<%= user.getUserName()%>" type="text" class="form-control" id="name"  placeholder="Please enter your name" required>

                                </div>
                                <div class="form-group">
                                    <label for="number">Phone number </label>
                                    <input  type="number" class="form-control" id="phoneNumber" placeholder="Please enter your phonenumber" required>

                                </div>
                              
                                <div class="form-group">
                                    <label for="shippingAddress">Shipping Address</label>
                                    <textarea class="form-control" id="shippingAddress" rows="3" placeholder="Please enter your address" required></textarea>
                                </div>
                                <div class="container text-center">
                                    
                                    <button class="btn btn-outline-success">Order now</button>
                                    <button class="btn btn-outline-primary"><a href="index.jsp">Continue shopping</a></button>
                                </div> 
                            </form>
                        </div>
                    </div>


                </div>
            </div>
        </div>
        <%@include file="components/common_modal.jsp" %>
    </body>
</html>
