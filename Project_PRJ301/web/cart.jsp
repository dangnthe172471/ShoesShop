<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shoes Shop</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <style>
            .th div {
                display: inline-block;
                vertical-align: middle;
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

        <div class="shopping-cart">
            <div class="px-4 px-lg-0">
                <div class="pb-5">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 p-2 bg-white rounded shadow-sm mb-5">
                                <!-- Shopping cart table -->
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="p-2 px-3 text-uppercase" style="text-align: center;">Sản Phẩm</div>
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
                                                    <div class="py-2 text-uppercase" style="text-align: center;">Xóa</div>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:set var="o" value="${sessionScope.cart}"/>
                                            <c:set var="t" value="0"/>
                                            <c:forEach items="${o.items}" var="i">
                                                <tr>
                                                    <th scope="row">
                                                        <div class="p-0">
                                                            <img src="${i.product.image}" width="160px;">
                                                            <div class="ml-0 d-inline-block align-middle">
                                                                <h6 class="mb-0"> <a href="detail?pid=${i.product.id}" style="font-size: 16px;" class="text-dark d-inline-block" >${i.product.name}</a></h6>
                                                            </div>
                                                        </div>
                                                    </th>

                                                    <td class="align-middle" style="text-align: center;"><strong><fmt:formatNumber pattern="##.#" value="${i.price}"/></strong></td>
                                                    <td class="align-middle row" style="margin-top: 15%">
                                                        <a href="process?num=-1&id=${i.product.id}"><button class="btnSub">-</button></a> 
                                                        <form action="process" id="f">
                                                            <input value="${i.product.id}" type="hidden" name="id" />
                                                            <input value="${i.quantity}" name="num" id="numProduct"/>
                                                        </form>
                                                        <a href="process?num=1&id=${i.product.id}"><button class="btnAdd">+</button></a>
                                                    </td>
                                                    <td class="align-middle" style="text-align: center;"><strong><fmt:formatNumber pattern="##.#" value="${i.quantity*i.price}"/></strong></td>
                                                    <td class="align-middle" style="text-align: center;">
                                                        <form action="process" method="post" style="text-align: center;">
                                                            <input type="hidden" name="id" value="${i.product.id}"/>
                                                            <button type="submit" class="btn btn-danger">Delete</button>
                                                        </form>
                                                    </td>                                                    
                                                </tr>                                                                                
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>                        
                        <c:forEach items="${o.items}" var="i">
                            <input type="hidden" name="num" value="${i.quantity}"/>
                            <input type="hidden" name="totalP" value="${i.quantity*i.price}"/>
                        </c:forEach>
                        Tổng tiền: ${totalMoney}$ (${totalMoney*25000}VND)
                        <form action="tt" method="post">   
                            Chọn hình thức thanh toán:<br>
                            <input type="radio" checked="true" name="ttweb" value="1"/> tài khoản web<br>
                            <input type="radio" name="ttweb" value="2"/> tài khoản vn<br>
                            <button type="submit" class="btn btn-default" href>Thanh toán</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <c:if test="${sessionScope.account==null}">
            <a href="checkout" style="margin-left: 1250px;margin-bottom: 20px;"><input type="button" value="Đơn hàng đã mua"/> </a>                                  
            </c:if>
            <c:if test="${sessionScope.account!=null}">
            <a href="cartdetail?aid=${sessionScope.account.id}" style="margin-left: 1250px;margin-bottom: 20px;"><input type="button" value="Đơn hàng đã mua"/> </a>                                  
            </c:if>
        <br><br>
        <input  />
        <jsp:include  page="footer.jsp" />
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


    </body>
</html>
