<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shoes Shop</title>
        <link href="img/favicon.ico" rel="icon">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.gstatic.com">    
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <style>
            .a th img{
                width: 100px;
                height: 60px;
            }
            .th div {
                display: inline-block;
                vertical-align: middle;
            }
            .a th{
                font-size: 14px;
            }
            .a td{
                font-size: 14px;
            }
        </style>
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
                        <div class="col" style="padding-top: 55px">
                            <div class="row" style="margin-left: 200px;width: 128%">
                                <c:set var="size" value="${sessionScope.size}"/>
                                <a class="btn btn-success btn-sm ml-3" href="cart.jsp">
                                    <i class="fa fa-shopping-cart"></i> Cart <span class="badge badge-light">${size}</span>
                                </a>
                            </div>
                            <jsp:include page="nav.jsp"/>
                        </div>
                    </ul>
                </div>
            </div>
        </nav>
        <br>

        <div style="width: 1200px;margin-left: 155px;">
            <c:set var="acc" value="${sessionScope.account}"/>
            <c:if test="${sessionScope.account.isAdmin==1}">
                <h4 style="text-align: center">Thống kê</h4><br>
                <div class="row" style="margin-bottom: 50px; margin-left: 45px;">
                    <button style="margin-left: 45px"><a href="statistical" style="color: black">Thống kê</a></button>
                    <button style="margin-left: 40px"><a href="statistical2" style="color: black">Doanh thu</a></button>
                    <button style="margin-left: 40px"><a href="orderstatus" style="color: red"><u>Đơn hàng</u></a></button>
                </div>                   
                <form action="orderstatus" method="post" class="row">
                    <div class="row">
                        <input type="text" name="key" value="${key != null ? key : ''}" placeholder="Nhập tên sản phẩm" style="margin-left: 800px;"><br>
                        <button type="submit"><i class="fa fa-search" style="color: blue"></i></button>
                    </div>
                    <select name="sort" onchange="this.form.submit()" style="margin-left: 20px;margin-top: 5px;width: 110px;">
                        <option ${sort == 0 ? 'selected' : ''} value="0">---NONE---</option>
                        <option ${sort == 3 ? 'selected' : ''} value="3">Ngày mua ↑</option>
                        <option ${sort == 4 ? 'selected' : ''} value="4">Ngày mua ↓</option>
                        <option ${sort == 5 ? 'selected' : ''} value="5">Tổng tiền ↑</option>    
                        <option ${sort == 6 ? 'selected' : ''} value="6">Tổng tiền ↓</option>
                    </select>
                </form>
                <br>
                <div class="container">
                    <div class="action">
                        Xuất file
                        <button style="margin-left: 10px;">Xlsx</button>
                        <button>Xls</button>
                    </div>
                </div>
                <table class="table a" id="table">
                    <thead>
                        <tr>
                            <th scope="col" class="border-0 bg-light">
                                <div class="p-2 px-3 text-uppercase">ID<span style="padding-left: 50px;">Sản Phẩm</span></div>
                            </th>
                            <th scope="col" class="border-0 bg-light">
                                <div class="py-2 text-uppercase" style="text-align: center;">Ngày mua</div>
                            </th>
                            <th scope="col" class="border-0 bg-light">
                                <div class="py-2 text-uppercase" style="text-align: center;">Đơn Giá</div>
                            </th>
                            <th scope="col" class="border-0 bg-light">
                                <div class="py-2 text-uppercase" style="text-align: center;">Số Lượng</div>
                            </th>                                              
                            <th scope="col" class="border-0 bg-light">
                                <div class="py-2 text-uppercase" style="text-align: center;">Tổng tiền</div>
                            </th>  
                            <th scope="col" class="border-0 bg-light">
                                <div class="py-2 text-uppercase" style="text-align: center;">Người mua</div>
                            </th>  
                            <th scope="col" class="border-0 bg-light">
                                <div class="py-2 text-uppercase" style="text-align: center;">Trạng thái</div>
                            </th>  
                            <th scope="col" class="border-0 bg-light">
                                <div class="py-2 text-uppercase" style="text-align: center;">Action</div>
                            </th> 

                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${list}" var="od">

                            <tr>
                                <th scope="row">
                                    <div class="pl-0" style="width: 250px;">
                                        <img src="${od.product.image}">
                                        <div class="ml-0 d-inline-block align-middle">
                                            <h6 class="mb-0"> <a href="detail?pid=${od.product.id}" style="font-size: 16px;" class="text-dark d-inline-block" >${od.product.name}</a></h6>
                                        </div>
                                    </div>
                                </th>
                                <td class="align-middle" style="text-align: center;width: 120px;"><strong>${od.order.date}</strong></td>
                                <td class="align-middle" style="text-align: center;width: 100px;"><strong>${od.price}</strong></td>
                                <td class="align-middle" style="text-align: center;width: 110px ;"><strong><fmt:formatNumber pattern="##.#" value="${od.quantity}"/></strong></td>                                                    
                                <td class="align-middle" style="text-align: center;width: 115px;"><strong>${od.order.totalMoney}</strong></td>
                                <td scope="row" style="text-align: center; width: 240px;font-size: 14.5px;padding-top: 20px; "><strong>
                                        Username: ${od.order.account.user}<br>
                                        Phone: ${od.order.account.phone}<br>
                                        Email: ${od.order.account.email}<br>
                                        Address : ${od.order.account.address}<br></strong>
                                </td>
                                <td style="text-align: center;width: 100px;padding-top: 60px;">         
                                    <form action="status">
                                        <input type="hidden" name="id" value="${od.order.oid}"/>
                                        <select name="status" onchange="this.form.submit()" style="background-color:${od.order.status == 0 ? 'red' : 'green'}; border-radius: 25%">
                                            <option style="background-color:red" ${od.order.status == 0 ? 'selected' : ''} value="0" >Chưa hoàn thành</option> 
                                            <option style="background-color:green" ${od.order.status == 1 ? 'selected' : ''} value="1">Hoàn thành</option> 
                                        </select> 
                                    </form>
                                </td>  
                                <td class="align-middle" style="text-align: center;">
                                    <a href="loadorder?oid=${od.order.oid}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                    <a href="#" onclick="doDelete('${od.order.oid}')" class="delete" data-toggle="modal"><i class="material-icons" style="color: red;" title="Delete">&#xE872;</i></a>
                                </td>

                            </tr> 

                        </c:forEach>
                    </tbody>
                </table>
                <c:if test="${countP!=0}">
                    <c:if test="${page!=0}">
                        <a href="orderstatus?key=${key}&sort=${sort}&index=0" class="page-link">Show All</a>
                        <div class="clearfix row" style="margin-left: 80px;margin-top: 30px;">
                            <c:if test="${countP >= 5}">
                                <div class="hint-text" style="margin-top: 3px;">Showing <b>5</b> out of <b>${countP}</b> entries</div>
                            </c:if>
                            <c:if test="${countP < 5}">
                                <div class="hint-text" style="margin-top: 3px;">Showing <b>${countP}</b> out of <b>${countP}</b> entries</div>
                            </c:if>  
                            <ul class="pagination" style="margin-left: 200px;">
                                <li class="page-item disabled"><a href="#" class="page-link">Previous</a></li>
                                    <c:forEach begin="1" end="${endP}" var="i">                                             
                                    <li class="${page==i?'page-item active':''}"><a href="orderstatus?key=${key}&sort=${sort}&index=${i}" class="page-link">${i}</a></li>
                                    </c:forEach>
                                <li class="page-item disabled"><a href="#" class="page-link">Next</a></li>
                            </ul>
                        </div>
                    </c:if>
                </c:if>
                <c:if test="${countP==0}">
                    <h5 style="color: red;text-align: center;">Không tìm thấy đơn hàng bạn cần tìm</h5>
                </c:if>
            </div>   


        </c:if>
        <c:if test="${sessionScope.account.isAdmin!=1}">
            <div class="container">
                <h1 class="h3 mb-3 font-weight-normal" style="text-align: center; color: red;">Cần đăng nhập tài khoản Admin để tiếp tục</h1>
            </div>
        </c:if>
        <jsp:include page="footer.jsp"/>
        <script type="text/javascript">
            function doDelete(oid) {
                if (confirm("Bạn có chắc muốn xóa đơn hàng có id " + oid + "?\n\nThao tác này không thể hoàn tác.")) {
                    window.location = "deleteorder?oid=" + oid;
                }
            }
        </script>
        <script src="js/script.js"></script>
        <script src="js/sheet.js"></script>
    </body>
</html>
