
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div style="width: 155%;">
            <nav class="navbar-nav ">
                <ul class="navbar-nav row" style="margin: 0 auto">
                    <c:if test="${sessionScope.account==null}">
                        <li class="nav-item m-1">
                            <a href="login" style="color: #fff" class="nav-link">Login</a>
                        </li>
                        <li class="nav-item m-1">
                            <a href="register" style="color: #fff" class="nav-link">Register</a>
                        </li>
                    </c:if>
                    <c:if test="${sessionScope.account!=null}">
                        <li class="nav-item m-1">
                            <a href="profile" style="color: #fff" class="nav-link">Hello ${sessionScope.account.user}</a>
                        </li>      
                        <li class="nav-item m-1">
                            <a href="manager" style="color: #fff" class="nav-link">Manager</a>
                        </li> 
                        <c:if test="${sessionScope.account.isAdmin==1}">
                            <li class="nav-item m-1">
                                <a href="statistical" style="color: #fff" class="nav-link">Statistical</a>
                            </li> 
                        </c:if>
                        <li class="nav-item m-1">
                            <a href="changepass" style="color: #fff" class="nav-link">Change password</a>
                        </li>
                        <li class="nav-item m-1">
                            <a href="logout" style="color: #fff" class="nav-link">Logout</a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </body>
</html>
