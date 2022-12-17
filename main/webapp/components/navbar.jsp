<%@page import="java.util.List"%>
<%@page import="com.desire.ds.dao.CategoryDao"%>
<%@page import="com.desire.ds.helper.FactoryProvider"%>
<%@page import="com.desire.ds.entities.Category"%>
<%@page import="com.desire.ds.entities.User"%>
<%

    User user1 = (User) session.getAttribute("current-user");
     CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());

                List<Category> cList = cDao.getCategories();

%>



<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
    <div class="container">
         <img style="max-width:45px" class="image-fluid rounded-circle" src="img/football.png" alt="user_icon">
        <a class="navbar-brand" style="text-transform: uppercase;" href="index.jsp"> Desire Sports</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Categories
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
           
                
                          <a href="index.jsp?category=all" class="dropdown-item" >
                    </a>
                   
                <%
                    for (Category c : cList) { %>
                    
                    <a href="index.jsp?category=<%=c.getCategoryId()%>" class="list-group-item list-group-item-action"><%=c.getCategoryName()%></a> 
                    
                 <%
                    }
                 %>
                     
                    </div>
                </li>  
            </ul>
            <ul class="navbar-nav ml-auto">
                 <li class="nav-item active">
                     <a class="nav-link" href="#!" data-toggle="modal" data-target="#cart"><i class="fa fa-cart-plus" style="font-size: 25px;"></i><span class="ml-auto cart-items"> ( 0 )</span></a>
                </li>
                
                
                <%               if (user1 == null) {
                %>
                <li class="nav-item active">
                    <a class="nav-link" href="login.jsp">Login </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="register.jsp">Register</a>
                </li>
                <%
                } else {
                %>


                <li class="nav-item active">
                    <a class="nav-link" href="<%=user1.getUserType().equals("admin")?"admin.jsp" : "index.jsp"%>"><%=user1.getUserName()%> </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="LogoutServlet">Logout</a>
                </li>


                <%
                    }
                %>

            </ul>

        </div>
    </div>


</nav>