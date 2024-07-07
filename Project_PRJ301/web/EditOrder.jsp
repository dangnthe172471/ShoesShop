<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shoes Shop</title>
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
                font-size: 16px;
            }
            .form-control{
                font-size: 15px;
            }
        </style>
    </head>

    <body>
        <c:if test="${sessionScope.account.isAdmin==1}">
            <div id="editEmployeeModal" class="modalfade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="editorder" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Edit Order</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label>ID</label>
                                    <input value="${detail.order.oid}" name="oid" type="text" class="form-control" readonly=""  >
                                </div>
                                <div class="form-group">
                                    <label>Sản phẩm</label>                                    
                                    <textarea name="pname" class="form-control">${detail.product.name}</textarea>
                                </div>
                                <input value="${detail.product.id}" name="pid" type="hidden" class="form-control"  >
                                <div class="form-group">
                                    <label>Ngày mua</label>
                                    <input value="${detail.order.date}" name="odate" type="date" class="form-control"  >
                                </div>
                                <div class="form-group">
                                    <label>Đơn giá</label>
                                    <input value="${detail.price}" name="price" type="text" class="form-control"  >
                                </div>
                                <div class="form-group">
                                    <label>Số lượng</label>
                                    <input value="${detail.quantity}" name="quantity" type="text" class="form-control"  >
                                </div>                               
                                <div class="form-group">
                                    <label>Người mua:</label><br>
                                    Tên:<input value="${detail.order.account.user}" name="user" type="text" class="form-control" readonly="">
                                    SĐT <input value="${detail.order.account.phone}" name="phone" type="tel" class="form-control"  >
                                    Email: <input value="${detail.order.account.email}" name="email" type="email" class="form-control"  >
                                    Địa chỉ: <input value="${detail.order.account.address}" name="address" type="text" class="form-control"  >
                                    <input value="${detail.order.account.id}" name="aid" type="hidden" class="form-control"  >
                                </div> 
                                <div class="form-group">
                                    <label>Trạng thái</label>
                                    <select name="status">
                                        <option ${detail.order.status == 0 ? 'selected' : ''} value="0" >Chưa hoàn thành</option> 
                                        <option ${detail.order.status == 1 ? 'selected' : ''} value="1">Hoàn thành</option> 
                                    </select> 
                                </div>
                            </div>

                            <div class="modal-footer">
                                <a href="orderstatus" style="color: black"><input style="width: 50px;"  class="btn btn-outline-dark" value="Cancel"></a>
                                <input type="submit" style="width: 50px" class="btn btn-info" value="Save">                            
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </c:if>
        <c:if test="${sessionScope.account.isAdmin!=1}">
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
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
        <script>
            CKEDITOR.replace('pname');
        </script>
    </body>
</html>
