
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shoes Shop</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-md navbar-dark bg-info" style="height: 160px">
            <div class="container">
                <div style="width: 25%"><!-- content logo-->
                    <a href="home"><img src="img/logo.jpg" style="width: 165PX;height: 145px; border: 1px solid black; border-radius: 50%"></a>
                </div>      
                <div class="collapse navbar-collapse justify-content-end col" id="navbarsExampleDefault">
                    <div class="row">
                        <ul class="navbar-nav col-md-8" style="">
                            <li class="nav-item" >
                                <p class="nav-link" style="color: white; font-size: 16px;padding-top: 60px;">SHOES SHOP ONLY AUTHENTIC - CHUYÊN HÀNG CHÍNH HÃNG</p>
                            </li>                     
                        </ul>
                        <a class="btn btn-success btn-sm ml-3" href="cart.jsp" style="height: 30px;margin-top: 55px;font-size: 14px;">
                            <i class="fa fa-shopping-cart"></i> Cart <span class="badge badge-light">${size}</span>
                        </a>
                    </div>
                    <div class="row" style="padding-left: 468px;width: 160%">                        
                        <jsp:include page="nav.jsp"/>
                    </div>
                </div>
            </div>
        </nav>
        <br>
        <c:if test="${sessionScope.account.isAdmin==1}">
            <div class="container">
                <div class="table-wrapper" style="width: 1150px;margin-left: -30px;">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2>Manage <b>Account</b></h2>
                            </div>
                            <div class="col-sm-6">
                                <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Account</span></a>
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover">
                        <thead class="title">
                            <tr>                           
                                <th style="text-align: center">Username</th>
                                <th style="text-align: center">Passworld</th>
                                <th style="text-align: center">Avatar</th>
                                <th style="text-align: center">Email</th>
                                <th style="text-align: center">Số điện thoại</th>
                                <th style="text-align: center">Số dư tài khoản</th>
                                <th style="text-align: center">Đã mua</th>
                                <th style="text-align: center">Địa chỉ</th>
                                <th style="text-align: center">Trạng thái</th>
                                <th style="text-align: center">Chức vụ</th>
                                <th style="text-align: center">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listA}" var="o">
                                <tr>
                                    <td style="text-align: center">${o.user}</td>
                                    <td style="text-align: center">${o.pass}</td>
                                    <td><img src="${o.avatar}" style="width: 60px;height: 60px;border-radius: 50%"/></td>
                                    <td style="text-align: center">${o.email}</td> 
                                    <td style="text-align: center">${o.phone}</td> 
                                    <td style="text-align: center">${o.amount}$</td> 
                                    <td style="text-align: center">${o.bought}</td> 
                                    <td style="text-align: center">${o.address}</td> 
                                    <td style="text-align: center">${o.status==0?'Active':'Block'}</td> 
                                    <td style="text-align: center">${o.isAdmin == 0 ? "Tài khoản thường" : "Tài khoản Admin"}</td>   
                                    <td style="text-align: center">
                                        <a href="loadeditacc?user=${o.user}"> <i class="material-icons">&#xE254;</i></a>
                                        <a href="#" onclick="doDelete('${o.id}', '${o.user}')" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                        <a href="#" onclick="doBlock('${o.id}')" class="delete" data-toggle="modal"><i class="fa fa-ban"></i></a>
                                        <a href="#" onclick="doActive('${o.id}')" style="color: green" data-toggle="modal"><i class="fa fa-check-square-o"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>  
                    <div class="clearfix">
                        <c:if test="${countP >= 5}">
                            <div class="hint-text">Showing <b>5</b> out of <b>${countP}</b> entries</div>
                        </c:if>
                        <c:if test="${countP < 5}">
                            <div class="hint-text">Showing <b>${countP}</b> out of <b>${countP}</b> entries</div>
                        </c:if>  
                        <ul class="pagination">
                            <li class="page-item disabled"><a href="#">Previous</a></li>
                                <c:forEach begin="1" end="${endP}" var="i">                                             
                                <li class="${page==i?'page-item active':''}"><a href="loadacc?index=${i}" class="page-link">${i}</a></li>
                                </c:forEach>
                            <li class="page-item disabled"><a href="#" class="page-link">Next</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </c:if>
        <c:if test="${sessionScope.account.isAdmin!=1}">
            <h1 class="h3 mb-3" style="text-align: center; color: red;padding: 150px;font-size: 28px;">Cần đăng nhập tài khoản Admin để chỉnh sửa</h1>
            <jsp:include page="footer.jsp"/>
        </c:if>
        <!-- ADD -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addacc" method="post" enctype="multipart/form-data">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Account</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Avatar</label>
                                <input id="avatarInput" type="file" name="avatar" placeholder="Upload" style="width: 90%;">

                                Or: <input type="text" name="avatarU" placeholder="Nhập đường dẫn URL" >
                            </div> 
                            <div class="form-group">
                                <label>Username</label>
                                <input name="user" type="text" class="form-control" required>
                            </div>  
                            <div class="form-group">
                                <label>Password</label>
                                <input name="pass" type="text" class="form-control" required>
                            </div>                             
                            <div class="form-group">
                                <label>Email</label>
                                <input name="email" type="text" class="form-control" required>
                            </div> 
                            <div class="form-group">
                                <label>Số điện thoại</label>
                                <input name="phone" type="text" class="form-control" required>
                            </div> 
                            <div class="form-group">
                                <label>Số dư tài khoản</label>
                                <input name="amount" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Số hàng đã mua</label>
                                <input name="bought" type="text" class="form-control" required>
                            </div> 
                            <div class="form-group">
                                <label>Địa chỉ</label>
                                <input name="address" type="text" class="form-control" required>
                            </div> 
                            <div class="form-group">
                                <label>Loại tài khoản</label>
                                <select name="isAdmin" class="form-select" aria-label="Default select example">                                    
                                    <option value="0">Tài khoản thường</option>
                                    <option value="1">Tài khoản Admin</option>                                  
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>   <script src="js/manager.js" type="text/javascript"></script>
        <script type="text/javascript">
                                            function doDelete(id, user) {
                                                if (confirm("Bạn có chắc muốn xóa tài khoản " + user + "?\n\nThao tác này không thể hoàn tác.")) {
                                                    window.location = "deleteacc?aid=" + id + "&user=" + user;
                                                }
                                            }
                                            function doBlock(id) {
                                                if (confirm("Bạn có chắc muốn Block tài khoản này?")) {
                                                    window.location = "blockacc?id=" + id;
                                                }
                                            }
                                            function doActive(id) {
                                                if (confirm("Bạn có muốn kích hoạt lại tài khoản này?")) {
                                                    window.location = "active?id=" + id;
                                                }
                                            }
        </script>       
    </body>
</html>
