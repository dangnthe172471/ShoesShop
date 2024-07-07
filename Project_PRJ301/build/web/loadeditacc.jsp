<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <style>body {
                color: #566787;
                background: #f5f5f5;
                font-family: 'Varela Round', sans-serif;
                font-size: 18px;
            }
            .form-control{
                font-size: 18px;
            }
            input{
                height: 40px;
            }
        </style>
    </head>

    <body>
        <c:if test="${sessionScope.account.isAdmin==1}">
            <div id="editEmployeeModal" class="modalfade">
                <div class="modal-dialog">
                    <div class="modal-content" style="margin-top: 20px;">
                        <form action="editacc" method="post" enctype="multipart/form-data">
                            <div class="modal-header">						
                                <h4 class="modal-title">Edit Account</h4>
                            </div>
                            <div class="modal-body">                                
                                <div class="form-group">
                                    <label>Username</label>
                                    <input value="${a.user}" name="user" type="text" class="form-control" readonly="" required>
                                </div>
                                <div class="form-group">
                                    <label>Avatar</label>
                                    <input id="avatarInput" type="file" name="avatar" placeholder="Upload" style="width: 90%;">
                                    Or: <input type="text" name="avatarU" value="${a.avatar}" placeholder="Nhập đường dẫn URL" >
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input value="${a.pass}" name="pass" type="text" class="form-control" required>
                                </div>                                
                                <div class="form-group">
                                    <label>Email</label>
                                    <input value="${a.email}" name="email" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Số điện thoại</label>
                                    <input value="${a.phone}" name="phone" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Số dư tài khoản</label>
                                    <input value="${a.amount}" name="amount" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Số hàng đã mua</label>
                                    <input value="${a.bought}" name="bought" type="text" class="form-control" required>
                                </div>  
                                <div class="form-group">
                                    <label>Địa chỉ</label>
                                    <input value="${a.address}" name="address" type="text" class="form-control" required>
                                </div> 
                                <input value="${a.status}" name="status" type="hidden" required>
                                <div class="form-group">
                                    <label>Loại tài khoản</label>
                                    <select name="isAdmin" class="form-control" style="height: 40px;">
                                        <option ${a.isAdmin == 0 ? 'selected' : ''} value="0" >Tài khoản thường</option> 
                                        <option ${a.isAdmin == 1 ? 'selected' : ''} value="1">Tài khoản Admin</option> 
                                    </select> 
                                </div>
                            </div>
                            <div class="modal-footer">
                                <a href="loadacc" style="color: black"><input style="width: 50px;"  class="btn btn-outline-dark" value="Cancel"></a>
                                <input type="submit" style="width: 50px" class="btn btn-info" value="Save">                            
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </c:if>
        <c:if test="${sessionScope.account.isAdmin !=1}">
            <nav class="navbar navbar-expand-md navbar-dark bg-info" style="height: 180px">
                <div class="container">
                    <div style="width: 25%"><!-- content logo-->
                        <a href="home"><img src="img/logo.jpg" style="width: 80%; border: 1px soild black; border-radius: 50%"></a>
                    </div>      
                    <div class="collapse navbar-collapse justify-content-end row" id="navbarsExampleDefault">
                        <ul class="navbar-nav" style="width: 100%">
                            <li class="nav-item" >
                                <p class="nav-link" style="padding-left: 20px; color: white; font-size: 16px;padding-top: 60px;">SHOES SHOP ONLY AUTHENTIC - CHUYÊN HÀNG CHÍNH HÃNG</p>
                            </li>                     
                        </ul>
                        <div class="row">                        
                            <jsp:include page="nav.jsp"/>
                        </div>
                    </div>
                </div>
            </nav>
            <h1 style="text-align: center;margin: 200px;color: red">Bạn cần đăng nhập tài khoản Admin để tiếp tục</h1>
            <jsp:include page="footer.jsp"/>
        </c:if>
    </body>
</html>
