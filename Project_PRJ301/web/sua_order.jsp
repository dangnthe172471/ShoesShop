<%-- 
    Document   : sua_order
    Created on : Mar 5, 2024, 6:09:33 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <div id="editEmployeeModal" class="modalfade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="editorder">
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
                                <input value="${detail.product.name}" name="pname" type="text" class="form-control"  readonly="">
                            </div>
                            <input value="${detail.product.id}" name="pid" type="hidden" class="form-control">
                            <div class="form-group">
                                <label>Ngày mua</label>
                                <input value="${detail.order.date}" name="odate" type="date" class="form-control"  readonly="">
                            </div>
                            <div class="form-group">
                                <label>Đơn giá</label>
                                <input value="${detail.price}" name="price" type="text" class="form-control"  readonly="">
                            </div>
                            <div class="form-group">
                                <label>Số lượng</label>
                                <input value="${detail.quantity}" name="quantity" type="text" class="form-control"  >
                            </div>                               
                            <div class="form-group">
                                <label>Thông tin liên hệ:</label><br>
                                <input value="${detail.order.account.user}" name="user" type="hidden" class="form-control" readonly="">
                                SĐT <input value="${detail.order.account.phone}" name="phone" type="tel" class="form-control"  >
                                Email: <input value="${detail.order.account.email}" name="email" type="email" class="form-control"  >
                                Địa chỉ: <input value="${detail.order.account.address}" name="address" type="text" class="form-control"  >
                                <input value="${detail.order.status}" name="status" type="hidden" class="form-control"  >
                                <input value="${detail.order.account.id}" name="aid" type="hidden" class="form-control"  >
                            </div>                                 
                        </div>

                        <div class="modal-footer">
                            <a href="cartdetail?aid=${detail.order.account.id}" style="color: black"><input style="width: 50px;"  class="btn btn-outline-dark" value="Cancel"></a>
                            <input type="submit" style="width: 50px" class="btn btn-info" value="Save">                            
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
