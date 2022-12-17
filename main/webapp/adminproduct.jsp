<%-- 
    Document   : adminproduct
    Created on : May 29, 2022, 11:59:50 PM
    Author     : NUR MOHAMMAD
--%>
<%@page import="com.desire.ds.helper.Helper"%>
<%@page import="com.desire.ds.entities.Category"%>
<%@page import="com.desire.ds.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.desire.ds.entities.Product"%>
<%@page import="com.desire.ds.dao.ProductDao"%>
<%@page import="com.desire.ds.helper.FactoryProvider"%>
<%

    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "Login First");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You are not Admin. Access denied!!");
            response.sendRedirect("login.jsp");
            return;
        }
    }


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Page</title>
        <%@include file="components/common_css_js.jsp" %>
        <style>
         table,tr, th, td {
            border: 1px solid black;
         }
      </style>
    </head>
    <body>
         <%@include file="components/navbar.jsp" %>
        <%
             ProductDao pDao = new ProductDao(FactoryProvider.getFactory());
                    List<Product> list =  pDao.getAllProducts();
            %>
            <div class="container">
            <div class="col-md-15">
                    <div class="card" data-toggle="modal" data-target="#change-product-modal"  style="background-color: lightcoral;">
                        <div class="card-body text-center">
                          
                           
                            <h1 class="text-uppercase text-center"> Change product</h1>
                        </div>
                    </div>
                </div>
            </div>
        <div class="container">
             <div class="modal fade" id="change-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Product Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                       <!--form-->
                       <form action="AdminProductHandleServlet" method="post">
                            <input type="hidden" name="operation" value="changingproduct">
                           <!-- product Id --> 
                            <div class="form-group">
                                <input type="number" class="form-control" name="productNewId" placeholder="Enter Product Id" required />
                            </div>
                
                            <!-- product price--> 
                            <div class="form-group">
                                <input type="number" class="form-control" name="productNewPrice" placeholder="Enter Product Price" required />
                            </div>
                             <!-- product Quantity--> 
                            <div class="form-group">
                                <input type="number" class="form-control" name="productNewQuantity" placeholder="Enter Product Quantity" required />
                            </div>
                              <!-- product Discount--> 
                            <div class="form-group">
                                <input type="number" class="form-control" name="productNewDiscount" placeholder="Enter Product Discount" required />
                            </div>
                             
                             
                              
                             <div class="container text-center">

                                <button class="btn-btn-outline-successsuccess">Change Product</button>  
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                       </form>
                       <!--end form--> 
                    </div>
                    <div class="modal-body">
                        <!--form for deleting product-->
                        <form action="AdminProductHandleServlet" method="post">
                            <input type="hidden" name="operation" value="deletingproduct"><!-- comment -->
                             <div class="form-group">
                                <input type="number" class="form-control" name="productNewId" placeholder="Enter Product Id" required />
                            </div>
                             <div class="container text-center">

                                <button class="btn-btn-outline-successsuccess">Delete product</button>  
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>
        
                </div>
            </div>
        </div>

            <h2>All Products </h2>
        <div class="row m-2">
            <table style="background-color: rosybrown;">
                <tr>
                     <th style="text-align: center;">
                          Product Id  
                    </th>
                     <th style="text-align: center;">
                          Product Name
                    </th>
                     
                     <th style="text-align: center;">
                        Product Quantity
                    </th>
                      <th style="text-align: center;">
                        Product Discount
                    </th>
                     <th style="text-align: center;">
                        Product Price
                    </th>
                   <th style="text-align: center;">
                        Product Price After Disc
                    </th>
                    <th style="text-align: center;">
                        Product Description
                    </th>
                    
                </tr>

                     <%
                                    for (Product p : list) {%>
                                    <tr>
                                     <td style="text-align: center;">
                                         <h6><%=p.getProductId()%></h6>
                    </td>
                     <td>
                        <h6><%=p.getProductName()%></h6>
                    </td>
                     
                      <td style="text-align: center;">
                       <h6><%=p.getProductQuantity()%></h6>
                    </td>
                      <td style="text-align: center;">
                         <h6><%=p.getProductDiscount()%></h6>
                    </td>
                     <td style="text-align: center;">
                        <h6><%=p.getProductPrice()%></h6>
                    </td>
                      <td style="text-align: center;">
                        <h6><%=p.getPriceAfterDiscount()%></h6>
                    </td>
                    <td>
                      <h6><%=p.getProductDescription()%></h6>
                    </td>
                                    </tr>
                    <% } %>
                    
                
            </table>
            
            
        </div>
        </div>
        <%@include file="components/common_modal.jsp" %>
    </body>
</html>
