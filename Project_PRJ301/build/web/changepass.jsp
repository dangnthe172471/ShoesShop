<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shoes Shop</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include> 
            <section class="bg-light">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 mb-4 mb-sm-5">
                            <div class="card card-style1 border-0">
                                <div class="card-body p-1-9 p-sm-2-3 p-md-6 p-lg-7">
                                    <div class="row align-items-center">
                                        <div class="col-lg-6 mb-4 mb-lg-0">
                                            <img src="${sessionScope.account.avatar}" style="margin-left: 100px;width: 300px;height: 300px;border-radius: 50%">
                                        </div>
                                    <c:if test="${sessionScope.account!=null}">
                                        <div class="col-lg-6">
                                            <form action="changepass" method="post">
                                                <h1 class="h3 mb-3 font-weight-normal" style="text-align: center">Đổi Mật Khẩu</h1>
                                                <h5 style="color: red;font-size: 18px">${requestScope.error}</h5>
                                                <h5 style="color: red;font-size: 18px">${requestScope.error1}</h5>
                                                <div class="form-group row">                                                    
                                                    <input type="hidden" class="form-control" value="${sessionScope.account.email}" readonly="" name="email">
                                                    <input type="hidden" class="form-control" value="${sessionScope.account.phone}" readonly="" name="phone">
                                                    <input type="hidden" value="${sessionScope.account.user}" class="form-control" readonly="" name="user">
                                                </div>
                                                <div class="form-group">
                                                    <label>Mật khẩu hiện tại</label>
                                                    <input type="password" class="form-control" placeholder="Password" name="pass">
                                                </div>
                                                <div class="form-group">
                                                    <label>Mật khẩu mới</label>
                                                    <input type="password" class="form-control" placeholder="New Password" name="newpass">
                                                </div>
                                                <div class="form-group">
                                                    <label>Nhập lại mật khẩu mới</label>
                                                    <input type="password" class="form-control" placeholder="Repeat New Password" name="re_newpass">
                                                </div>
                                                <button class="btn btn-info btn-group" type="submit" style="margin-left: 205px;">Đổi mật khẩu</button>    
                                            </form>
                                        </div>
                                    </c:if>
                                    <c:if test="${sessionScope.account==null}">
                                        <h1 class="h3 mb-3 font-weight-normal" style="text-align: center; color: red">Cần đăng nhập để đổi mật khẩu</h1>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="footer.jsp"></jsp:include> 
    </body>    
</html>
