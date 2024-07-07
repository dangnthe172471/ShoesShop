<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shoes Shop</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
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
                            <div class="row" >
                                <c:set var="size" value="${sessionScope.size}"/>
                                <form action="search" method="post" class="form-inline my-2 my-lg-0" style="margin: 0 auto; "> 
                                    <input name="key" type="text" class="form-control" aria-label="Search" placeholder="Search..." value="${key}">                             
                                    <div style="height: 32px;"><button type="submit" class="btn btn-success btn-number">
                                            <i class="fa fa-search"></i>
                                        </button></div>

                                    <a class="btn btn-success btn-sm ml-3" href="cart.jsp">
                                        <i class="fa fa-shopping-cart"></i> Cart <span class="badge badge-light">${size}</span>
                                    </a>
                                </form>
                            </div>
                            <jsp:include page="nav.jsp"/>
                        </div>
                    </ul>
                </div>
            </div>
        </nav>  
        <div class="container mt-3">
            <div class="row">
                <div class="col">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home">Home</a></li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <c:set var="acc" value="${sessionScope.account}"/>
        <form action="cartdetail" class="row">
            <input value="${acc.id}" name="aid" type="hidden">
            <div class="row">
                <input type="text" name="key" value="${key != null ? key : ''}" placeholder="Nhập tên sản phẩm" style="margin-left: 950px;"><br>
                <button type="submit"><i class="fa fa-search" style="color: blue"></i></button>
            </div>
            <select name="sort" onchange="this.form.submit()" style=" margin-left: 38px;width: 110px;">
                <option ${sort == 0 ? 'selected' : ''} value="0">---NONE---</option>
                <option ${sort == 3 ? 'selected' : ''} value="3">Ngày mua ↑</option>
                <option ${sort == 4 ? 'selected' : ''} value="4">Ngày mua ↓</option>
                <option ${sort == 5 ? 'selected' : ''} value="5">Tổng tiền ↑</option>    
                <option ${sort == 6 ? 'selected' : ''} value="6">Tổng tiền ↓</option>
            </select>
        </form>
        <div class="shopping-cart">
            <div class="px-4 px-lg-0">
                <div class="pb-5">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 p-2 bg-white rounded shadow-sm mb-5">
                                <!-- Shopping cart table -->
                                <div class="container">
                                    <div class="action">
                                        Xuất file
                                        <button style="margin-left: 10px;">Xlsx</button>
                                        <button>Xls</button>
                                    </div>
                                </div>

                                <div class="table-responsive">
                                    <table class="table a" id="table">
                                        <thead>
                                            <tr>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="p-2 px-3 text-uppercase" style="text-align: center;">Sản Phẩm</div>
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
                                                    <div class="py-2 text-uppercase" style="text-align: center;">Thông tin</div>
                                                </th> 
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase" style="text-align: center;">Trạng thái</div>
                                                </th>  
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase" style="text-align: center;">Chỉnh sửa</div>
                                                </th> 
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listOD}" var="od">
                                                <tr>
                                                    <th scope="row">
                                                        <div class="pl-0" style="width: 200px;">                                                           
                                                            <img src="${od.product.image}">
                                                            <div class="ml-0 d-inline-block align-middle">
                                                                <h6 class="mb-0"> <a href="detail?pid=${od.product.id}" style="font-size: 16px;" class="text-dark d-inline-block">${od.product.name}</a></h6>
                                                            </div>
                                                        </div>
                                                    </th>
                                                    <td class="align-middle" style="text-align: center;width: 120px;"><strong>${od.order.date}</strong></td>
                                                    <td class="align-middle" style="text-align: center;width: 100px;"><strong>${od.price}</strong></td>
                                                    <td class="align-middle" style="text-align: center;width: 110px"><strong><fmt:formatNumber pattern="##.#" value="${od.quantity}"/></strong></td>                                                    
                                                    <td class="align-middle" style="text-align: center;width: 115px;"><strong>${od.price*od.quantity}</strong></td>
                                                    <td scope="row" style="text-align: center;padding-top: 20px; width: 240px; "><strong>
                                                            Username: ${od.order.account.user}<br>
                                                            Phone: ${od.order.account.phone}<br>
                                                            Email: ${od.order.account.email}<br>
                                                            Address : ${od.order.account.address}<br></strong>
                                                    </td>
                                                    <td class="align-middle" style="text-align: center;width: 125px;"><strong style="color: ${od.order.status==0?'red':'green'}">${od.order.status==0?'Chưa hoàn thành':'Hoàn thành'}</strong></td>
                                                        <c:if test="${od.order.status==0}">
                                                        <td class="align-middle" style="text-align: center;width: 115px;">
                                                            <form action="loadorder" method="post">
                                                                <button style="width: 0px; border: none; background: none;" name="oid" value="${od.order.oid}" type="submit"><i class="material-icons" title="Sửa đơn" style="color: #FFC107">&#xE254;</i></button>
                                                            </form><br>
                                                            <button style="width: 0px; border: none; background: none; margin-top: -10px" name="oid" value="${od.order.oid}"><a href="#" onclick="doDelete('${od.order.oid}')" class="delete" data-toggle="modal"><i class="material-icons" style="color: red;" title="Hủy đơn">&#xE872;</i></a></button>
                                                        </td>
                                                    </c:if>
                                                </tr>                                                                                
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <hr>
                                </div>
                                <c:if test="${countP==0}">
                                    <h5 style="color: red;text-align: center;">Không tìm thấy đơn hàng bạn cần tìm</h5>
                                </c:if>
                                <c:if test="${countP!=0}">
                                    <c:if test="${page!=0}">
                                        <li class="d-flex justify-content-between py-3 border-bottom" style="margin: 0 53px;"><strong class="align-middle">Tổng tiền đã mua hàng</strong><strong>${totalM}$</strong></li>
                                        <a href="cartdetail?aid=${sessionScope.account.id}&index=0" class="page-link">Show All</a>   

                                        <div class="clearfix row" style="margin-left: 80px;margin-top: 30px;" >
                                            <c:if test="${countP >= 5}">
                                                <div class="hint-text" style="margin-top: 3px;">Showing <b>5</b> out of <b>${countP}</b> entries</div>
                                            </c:if>
                                            <c:if test="${countP < 5}">
                                                <div class="hint-text" style="margin-top: 3px;">Showing <b>${countP}</b> out of <b>${countP}</b> entries</div>
                                            </c:if>  
                                            <ul class="pagination" style="margin-left: 200px;">
                                                <li class="page-item disabled"><a href="#" class="page-link">Previous</a></li>
                                                    <c:forEach begin="1" end="${endP}" var="i">                                             
                                                    <li class="${page==i?'page-item active':''}"><a href="cartdetail?aid=${sessionScope.account.id}&index=${i}" class="page-link">${i}</a></li>
                                                    </c:forEach>
                                                <li class="page-item disabled"><a href="#" class="page-link">Next</a></li>
                                            </ul>
                                        </div>                                   
                                    </c:if>
                                </c:if>
                            </div>
                        </div>  
                    </div>
                </div>
                <jsp:include page="footer.jsp"/>
            </div>
        </div>
        <script type="text/javascript">
            function doDelete(oid) {
                if (confirm("Bạn có chắc muốn Hủy đơn hàng có id " + oid + "?\nHủy đơn hàng có thể sẽ mất ưu đãi trước đó.\n\n Bạn có chắc muốn hủy ?")) {
                    window.location = "deleteordercart?oid=" + oid;
                }
            }
        </script>
        <script src="js/script.js"></script>
        <script src="js/sheet.js"></script>
    </body>
</html>
