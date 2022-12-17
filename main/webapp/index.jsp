<%@page import="com.desire.ds.helper.Helper"%>
<%@page import="com.desire.ds.entities.Category"%>
<%@page import="com.desire.ds.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.desire.ds.entities.Product"%>
<%@page import="com.desire.ds.dao.ProductDao"%>
<%@page import="com.desire.ds.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Home Page</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body style="background-color:lightyellow;">
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-3 mx-5 ">

                <%                String cat = request.getParameter("category");
                    ProductDao pDao = new ProductDao(FactoryProvider.getFactory());
                    List<Product> list = null;
                    if (cat == null) {
                        list = pDao.getAllProducts();
                    } else if (cat.equals("all")) {
                        list = pDao.getAllProducts();
                    } else {
                        int catId = Integer.parseInt(cat.trim());
                        list = pDao.getAllProductsById(catId);
                    }

                    // CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
                    //List<Category> cList = cDao.getCategories();
                %>



                <!-- Show Categories --> 
                <div class="col-md-2">

                    <div class="card" style="background-color: lightyellow;">
                        <div class="container m-2">

                            <img style="max-width:150px" class="image-fluid rounded-circle" src="img/desire.jpg" alt="user_icon">
                        </div>

                    </div>
                    <div class="list-group mt-4">
                        <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                            All Products
                        </a>

                        <%                    for (Category c : cList) {%>

                        <a href="index.jsp?category=<%=c.getCategoryId()%>" class="list-group-item list-group-item-action"><%=c.getCategoryName()%></a> 

                        <%
                            }
                        %>



                    </div>

                    <!-- ekhane onek kaj -->
                    <div class="card" style="background-color: #20c997;">
                        <div class="card-header">
                            Be Connected With Us
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item text-center"> <img style="max-width:20px" class="image-fluid rounded-circle" src="img/facebook.png" alt="user_icon"> <a href="https://www.facebook.com/desire013"> Facebook</a></li>
                        </ul>
                    </div>
                    <div class="card" >

                        <button type="button" class="btn btn-lg text-uppercase text-white text-center" style="background-color:#17a2b8;">
                            Your Team
                        </button>
                        <a class="btn btn-outline-dark" href="https://www.facebook.com/RealMadrid" role="button"><img style="max-width:25px" class="image-fluid rounded-circle" src="img/real-madrid.png" alt="user_icon"> Real Madrid</a>
                        <a class="btn btn-outline-dark" href="https://www.facebook.com/fcbarcelona" role="button"><img style="max-width:25px" class="image-fluid rounded-circle" src="img/barcelona.png" alt="user_icon"> FC Barcelona</a>
                        <a class="btn btn-outline-dark" href="https://www.facebook.com/fcbayern.en" role="button"><img style="max-width:25px" class="image-fluid rounded-circle" src="img/bayern-munchen.png" alt="user_icon"> FC Bayern Munich</a>
                        <a class="btn btn-outline-dark" href="https://www.facebook.com/LiverpoolFC" role="button"><img style="max-width:25px" class="image-fluid rounded-circle" src="img/liverpool.png" alt="user_icon"> Liverpool</a>
                        <a class="btn btn-outline-dark" href="https://www.facebook.com/PSG" role="button"><img style="max-width:25px" class="image-fluid rounded-circle" src="img/paris-saint-germain.png" alt="user_icon"> PSG</a>

                    </div>

                </div>

                <!--Show Products -->

                <div class="col-md-10">
                    <button type="button" class="btn btn-warning btn-lg btn-block">
                        <a href="https://www.goal.com/en-in/live-scores" >Get the latest live football scores, results & fixtures from across the world.</a></button>
                    <button type="button" class="btn btn-warning btn-lg btn-block"><a href="https://www.sofascore.com/" >Football live scores on SofaScore livescore from 600+ soccer leagues.</br>Follow live results, statistics, league tables, fixtures and videos .</a></button>
                    <button type="button" class="btn btn-warning btn-lg btn-block">
                        <a href="https://www.transfermarkt.com/" >Get the latest transfers, market values, rumours and stats from across the world.</a></button>
                    <!-- row -->
                    <div class="row mt-4">
                        <!-- Col:12 -->
                        <div class="col-md-12">
                            <div class="card-columns">
                                <!-- Traversing Product -->


                                <%
                                    for (Product p : list) {%>
                                <!-- Product Card -->
                              
                                    <div class="container text-center">
                                        <img src="img/products/<%=p.getProductPhoto()%>" style="max-height: 270px; max-width: 100%;width:auto;" class="card-img-top m-2" alt="...">
                                    </div>
                                    <div class="card-body">

                                        <h5 class="card-title"><%=p.getProductName()%></h5>
                                        <p class="card-text">
                                            <%=Helper.get4Words(p.getProductDescription())%>
                                        </p>
                                    </div>
                                    <div class="card-footer text-center">
                                        <button class="btn btn-outline-success" onclick="add_to_cart(<%=p.getProductId()%>, '<%=p.getProductName()%>', <%=p.getPriceAfterDiscount()%>)"><%=p.getPriceAfterDiscount()%>/- <span class="discount-label" style="color:#000051;"><%=p.getProductPrice()%>/- <%=p.getProductDiscount()%>% off</span></button>
                                        <button class="btn custom-bg text-white" onclick="add_to_cart(<%=p.getProductId()%>, '<%=p.getProductName()%>', <%=p.getPriceAfterDiscount()%>)">Add to cart</button>


                                    </div>


                            
                                <div class="modal fade" id="product-description-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-lg" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Product Details</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">


                                                <div class="card product-card">
                                                    <div class="container text-center">
                                                        <img src="img/products/<%=p.getProductPhoto()%>" style="max-height: 270px; max-width: 100%;width:auto;" class="card-img-top m-2" alt="...">
                                                    </div>
                                                    <div class="card-body">

                                                        <h5 class="card-title"><%=p.getProductName()%></h5>
                                                        <p class="card-text">
                                                            <%=(p.getProductDescription())%>
                                                        </p>
                                                    </div>

                                                </div>

                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                <button type="button" class="btn btn-primary checkout-btn" onclick="add_to_cart(<%=p.getProductId()%>, '<%=p.getProductName()%>', <%=p.getPriceAfterDiscount()%>)">Add to cart</button>
                                            </div>

                                        </div>
                                    </div>
                                </div>

                                <%}

                                    if (list.size() == 0) {
                                        out.println("<h2>No item in this category !!</h2>");
                                    }

                                %>



                            </div>

                        </div>


                    </div>


                </div>



            </div>
        </div>

        <%@include file="components/common_modal.jsp" %>
    </body>

</html>
