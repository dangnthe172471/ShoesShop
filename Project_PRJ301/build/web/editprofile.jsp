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
        <c:set var="acc" value="${sessionScope.account}"/>
        <section class="bg-light">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 mb-4 mb-sm-5">
                        <div class="card card-style1 border-0">
                            <div class="card-body p-1-9 p-sm-2-3 p-md-6 p-lg-7">
                                <div class="row align-items-center">
                                    <div class="col-lg-6 mb-4 mb-lg-0">
                                        <img src="${sessionScope.account.avatar}" style="width: 500px;height: 500px;border-radius: 50%">
                                    </div>
                                    <div class="col-lg-6">
                                        <c:if test="${acc!=null}">
                                            <c:if test="${sessionScope.account.isAdmin!=1}">
                                                <div id="editEmployeeModal" class="modalfade" >
                                                    <div class="modal-dialog">
                                                        <div class="modal-content" style="margin-top: 20px;">
                                                            <form action="editprofile" method="post">
                                                                <div class="modal-header">						
                                                                    <h4 class="modal-title">Edit Profile</h4>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <div class="form-group">
                                                                        <label>Username</label>
                                                                        <input value="${a.user}" name="user" type="text" class="form-control" readonly="" >
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label>Email</label>
                                                                        <input value="${a.email}" name="email" type="text" class="form-control" >
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label>Số điện thoại</label>
                                                                        <input value="${a.phone}" name="phone" type="text" class="form-control">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label>Địa chỉ</label>
                                                                        <input value="${a.address}" name="address" type="text" class="form-control">
                                                                    </div>  
                                                                    <div class="form-group">
                                                                        <label>Số dư tài khoản</label>
                                                                        <input value="${a.amount}" name="amount" type="text" class="form-control" readonly="">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label>Số hàng đã mua</label>
                                                                        <input value="${a.bought}" name="bought" type="text" class="form-control" readonly="">
                                                                    </div>                                                                      
                                                                    <input value="${a.pass}" name="pass" type="hidden" class="form-control">
                                                                    <input value="${a.status}" name="status" type="hidden" class="form-control">
                                                                    <input value="${a.avatar}" name="avatar" type="hidden" class="form-control">
                                                                    <div class="form-group">
                                                                        <label>Loại tài khoản</label>
                                                                        <input value="Tài khoản thường"type="text" class="form-control" readonly="">
                                                                        <input value="${a.isAdmin}" name="isAdmin" type="hidden" class="form-control">
                                                                    </div>                                                                   
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <a href="profile" style="color: black"><input style="width: 80px;"  class="btn btn-outline-dark" value="Cancel"></a>
                                                                    <input type="submit" style="width: 80px" class="btn btn-info" value="Save">                            
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <c:if test="${sessionScope.account.isAdmin==1}">
                                                <div id="editEmployeeModal" class="modalfade" >
                                                    <div class="modal-dialog">
                                                        <div class="modal-content" style="margin-top: 20px;">
                                                            <form action="editprofile" method="post">
                                                                <div class="modal-header">						
                                                                    <h4 class="modal-title">Edit Profile</h4>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <div class="form-group">
                                                                        <label>Username</label>
                                                                        <input value="${a.user}" name="user" type="text" class="form-control" readonly="" >
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label>Email</label>
                                                                        <input value="${a.email}" name="email" type="text" class="form-control" >
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label>Số điện thoại</label>
                                                                        <input value="${a.phone}" name="phone" type="text" class="form-control">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label>Số dư tài khoản</label>
                                                                        <input value="${a.amount}" name="amount" type="text" class="form-control">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label>Số hàng đã mua</label>
                                                                        <input value="${a.bought}" name="bought" type="text" class="form-control">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label>Địa chỉ</label>
                                                                        <input value="${a.address}" name="address" type="text" class="form-control">
                                                                    </div>  
                                                                    <input value="${a.status}" name="status" type="hidden" class="form-control">
                                                                    <input value="${a.pass}" name="pass" type="hidden" class="form-control">
                                                                    <input value="${a.avatar}" name="avatar" type="hidden" class="form-control">
                                                                    <div class="form-group">
                                                                        <label>Loại tài khoản</label>
                                                                        <select name="isAdmin" class="form-control" style="height: 40px;">
                                                                            <option ${a.isAdmin == 0 ? 'selected' : ''} value="0" >Tài khoản thường</option> 
                                                                            <option ${a.isAdmin == 1 ? 'selected' : ''} value="1">Tài khoản Admin</option> 
                                                                        </select> 
                                                                    </div>                                                                  
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <a href="profile" style="color: black"><input style="width: 80px;"  class="btn btn-outline-dark" value="Cancel"></a>
                                                                    <input type="submit" style="width: 80px" class="btn btn-info" value="Save">                            
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>                                             
                                            </c:if>
                                        </c:if>
                                        <c:if test="${acc==null}">
                                            <h1 class="h3 mb-3 font-weight-normal" style="text-align: center">Cần đăng nhập để tiếp tục</h1>
                                        </c:if>
                                    </div>
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
