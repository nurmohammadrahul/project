<%@page import="java.util.Map"%>
<%@page import="com.desire.ds.helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.desire.ds.entities.Category"%>
<%@page import="com.desire.ds.dao.CategoryDao"%>
<%@page import="com.desire.ds.helper.FactoryProvider"%>
<%@page import="com.desire.ds.entities.User"%>
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
        <title>Admin Page</title>
        <%@include file="components/common_css_js.jsp"%>
    </head>
    <body style="background-color:lightyellow;">

        <%@include file="components/navbar.jsp" %>
         <% 
                           // CategoryDao cDao =   new CategoryDao(FactoryProvider.getFactory());
                              List<Category>list = cDao.getCategories();
                              
//getcount
 Map<String,Long>m = Helper.getCount(FactoryProvider.getFactory());
                              
                              %>
        <div class="container admin">
            <div class="container-fluid mt-5">
                <%@include file="components/message.jsp" %>

            </div>



            <div class="row mt-5">
                <!-- 1st Column -->
                <div class="col-md-4">
                    <div class="card" onclick="location.href='adminuser.jsp'">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width:100px" class="image-fluid rounded-circle" src="img/user.png" alt="user_icon">
                            </div>
                            <h1><%=m.get("userCount")%></h1>
                            <h1 class="text-uppercase text-muted">Users</h1>
                        </div>
                    </div>
                </div>
                <!-- 2nd Column -->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width:100px" class="image-fluid rounded-circle" src="img/note.png" alt="user_icon">
                            </div>
                            <h1><%=list.size()%></h1>
                            <h1 class="text-uppercase text-muted">Categories</h1>
                        </div>
                    </div>

                </div>
                <!-- 3rd Column -->
                <div class="col-md-4">
                    <div class="card" onclick="location.href='adminproduct.jsp'">
                        <div class="card-body text-center" >
                            <div class="container">
                                <img style="max-width:100px" class="image-fluid rounded-circle" src="img/box.png" alt="user_icon">
                            </div>
                            <h1><%=m.get("productCount")%></h1>
                            <h1 class="text-uppercase text-muted">Products</h1>
                        </div>
                    </div>
                </div>
            </div>
            <!<!-- second row -->
            <div class="row">
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width:90px" class="image-fluid rounded-circle" src="img/add.png" alt="user_icon">
                            </div>
                            <h1 class="mt-1">click here to add</h1>
                            <h1 class="text-uppercase text-muted">Add Category</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width:90px" class="image-fluid rounded-circle" src="img/add-category.png" alt="user_icon">
                            </div>
                            <h1 class="mt-1">click here to add product</h1>
                            <h1 class="text-uppercase text-muted">Add product</h1>
                        </div>
                    </div>
                </div>




            </div>

        </div>
        <!-- adding category modal -->

        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post">
                            <input type="hidden" name="operation" value="addcategory">

                            <div class="form-group">
                                <input type="text" class="form-control" name="categoryName" placeholder="Enter Category Title" required />

                            </div>
                            <div class="form-group">
                                <textarea style="height:300px" class="form-control" name="categoryDescription" placeholder="Enter Category Description" required></textarea>        
                            </div>
                            <div class="container text-center">

                                <button class="btn-btn-outline success">Add Category</button>  
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
        <!-- End category moadl -->
        <!-- niche dekh +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
        <!--product modal -->


        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                       <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="operation" value="addproduct">
                           <!-- product title --> 
                            <div class="form-group">
                                <input type="text" class="form-control" name="productName" placeholder="Enter Product Title" required />
                            </div>
                           <!-- Product Description -->
                            <div class="form-group">
                                <textarea style="height:100px" class="form-control" name="productDescription" placeholder="Enter Product Description" required></textarea>        
                            </div>
                            <!-- product price--> 
                            <div class="form-group">
                                <input type="number" class="form-control" name="productPrice" placeholder="Enter Product Price" required />
                            </div>
                             <!-- product Quantity--> 
                            <div class="form-group">
                                <input type="number" class="form-control" name="productQuantity" placeholder="Enter Product Quantity" required />
                            </div>
                              <!-- product Discount--> 
                            <div class="form-group">
                                <input type="number" class="form-control" name="productDiscount" placeholder="Enter Product Discount" required />
                            </div>
                              <!-- product category--> 
                             
                              
                            
                            <div class="form-group">
                                <select name="categoryId" class="form-control" >
                                  
                                    <%
                                        for(Category c : list){
                                        %>
                                        <option value="<%=c.getCategoryId()%>"><%= c.getCategoryName()%></option>
                                     
                                     <%
                                         }
                                         %>

                                </select>
                            </div>
                                   <!-- product file of pic--> 
                               <div class="form-group">
                                <input type="file" class="form-control" name="productPhoto" id="productPhoto" required />
                            </div>
                              
                             <div class="container text-center">

                                <button class="btn-btn-outline success">Add Product</button>  
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                       </form>
                       <!--end form--> 
                    </div>
        
                </div>
            </div>
        </div>



        <!-- End of product modal -->


 <%@include file="components/common_modal.jsp" %>
    </body>
</html>
