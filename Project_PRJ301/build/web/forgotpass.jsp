<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <title>Shoes Shop</title>   
    </head>
    <body>
        <nav class="navbar navbar-expand-md navbar-dark bg-info" style="height: 180px">
            <div class="container">
                <div style="width: 25%"><!-- content logo-->
                    <a href="home"><img src="img/logo.jpg" style="width: 80%; border: 1px solid black; border-radius: 50%"></a>
                </div>      
                <div class="collapse navbar-collapse justify-content-end row" id="navbarsExampleDefault">
                    <ul class="navbar-nav" style="width: 100%">
                        <li class="nav-item" >
                            <p class="nav-link" style="padding-left: 20px; color: white; font-size: 16px;padding-top: 60px;">SHOES SHOP ONLY AUTHENTIC - CHUYÊN HÀNG CHÍNH HÃNG</p>
                        </li>                           
                    </ul><div style="margin-right: 100px;">
                        <jsp:include page="nav.jsp"/></div>
                </div>
            </div>
        </nav>

        <div class="container">             
            <form action="forgot" method="post" style="width: 40%;margin: 30px auto; border: 1px solid aqua;padding: 30px; background-color:#ffffff4d">
                <h1 class="h3 mb-3 font-weight-normal" style="text-align: center"> Forgot password</h1>
                <h5 style="color: red;font-size: 18px">${requestScope.mess}</h5>
                <div class="form-group">
                    <label>Username</label>
                    <input type="text" class="form-control" placeholder="Username" name="user" value="${user}">
                </div>
                <div class="form-group">
                    <label >Email</label>
                    <input type="email" class="form-control" placeholder="Email" name="email" value="${email}">
                </div>  
                <div class="row">
                    <a class="col-sm-6" href="login"><button class="btn btn-primary btn-block" type="button" id="btn-signup"><i class="fas fa-sign-in-alt"></i> Back</button></a>
                    <button class="btn btn-success btn-block col-sm-5" type="submit"><i class="fas fa-user-plus"></i> Forgot</button> 
                </div>
            </form>            
        </div>
        <jsp:include page="footer.jsp"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/login.js"></script>
    </body>
</html>