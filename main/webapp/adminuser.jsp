<%-- 
    Document   : adminproduct
    Created on : May 29, 2022, 11:59:50 PM
    Author     : NUR MOHAMMAD
--%>
<%@page import="com.desire.ds.dao.UserDao"%>
<%@page import="com.desire.ds.entities.User"%>
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
            table, th, td {
                border: 1px solid black;
            }
        </style>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <%            UserDao uDao = new UserDao(FactoryProvider.getFactory());
            List<User> ulist = uDao.getAllUser();
        %>
        <div class="container">
            <h2>Admin</h2>
            <div class="row m-2">
                <table>
                    <tr>
                        <th style="text-align: center;">
                            User Id  
                        </th>
                        <th style="text-align: center;">
                            User Name
                        </th>
                        <th style="text-align: center;">
                            User Email
                        </th>
                        <th style="text-align: center;">
                            User Phone

                        </th>
                        <th style="text-align: center;">
                            User Address
                        </th>
                    </tr>

                    <%
                        for (User u : ulist) {
                            if (u.getUserType().equals("admin")) {%>
                    <tr>
                        <td style="text-align: center;">
                            <h6> <%=u.getUserId()%></h6>
                        </td>
                        <td>
                            <h6> <%=u.getUserName()%></h6>
                        </td>
                        <td>
                            <h6><%=u.getUserEmail()%></h6>
                        </td>
                        <td style="text-align: center;">
                            <h6><%=u.getUserPhone()%></h6>
                        </td>
                        <td>
                            <h6><%=u.getUserAddress()%></h6>
                        </td>

                    </tr>
                    <% }
                        }%>


                </table>


            </div>
            <h2>All Users</h2>
            <div class="row m-2">
                <table style="background-color : azure;">
                    <tr>
                        <th style="text-align: center;">
                            User Id  
                        </th>
                        <th style="text-align: center;">
                            User Name
                        </th>
                        <th style="text-align: center;">
                            User Email
                        </th>
                        <th style="text-align: center;">
                            User Phone

                        </th>
                        <th style="text-align: center;">
                            User Address
                        </th>
                    </tr>

                    <%
                        for (User u : ulist) {
                            if (u.getUserType().equals("normal")) {%>
                    <tr>
                        <td style="text-align: center;">
                            <h6> <%=u.getUserId()%></h6>
                        </td>
                        <td>
                            <h6> <%=u.getUserName()%></h6>
                        </td>
                        <td>
                            <h6><%=u.getUserEmail()%></h6>
                        </td>
                        <td style="text-align: center;">
                            <h6><%=u.getUserPhone()%></h6>
                        </td>
                        <td>
                            <h6><%=u.getUserAddress()%></h6>
                        </td>

                    </tr>
                    <% }
                        }%>


                </table>


            </div>
        </div>
        <%@include file="components/common_modal.jsp" %>
    </body>
</html>
