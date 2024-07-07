<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shoes Shop</title>
        <link href="img/favicon.ico" rel="icon">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.gstatic.com">    
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
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
                            <div class="row" style="margin-left: 20px;width: 128%">
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
        <br>

        <div class="container">
            <c:set var="acc" value="${sessionScope.account}"/>
            <c:if test="${sessionScope.account.isAdmin==1}">
                <div class="container">
                    <h4 style="text-align: center">Thống kê</h4><br>

                    <div class="row" style="margin-bottom: 50px;">
                        <button style="margin-left: 45px"><a href="statistical" style="color: Red"><u>Thống kê</u></a></button>
                        <button style="margin-left: 40px"><a href="statistical2" style="color: black">Doanh thu</a></button>
                        <button style="margin-left: 40px"><a href="orderstatus" style="color: black">Đơn hàng</a></button>
                    </div>

                    <div class="row" style="margin-bottom: 30px;">
                        <div class="div1 col-md-5" style="margin-left: 45px;">                           
                            <div class="row"><i class="fa fa-users" style="font-size: 50px;margin-left: 10px;color: blue"></i>  
                                <div class="col-md-10" style="text-align: right; font-size: 16px;font-weight: bold"><a href="loadacc" style="color: black"><span>Số tài khoản: ${count} <br/>( Tài khoản admin: ${count1}, Tài khoản thường: ${count2} )</span> </a></div>
                            </div>                       
                        </div>
                        <div class="div1 col-md-5" style="margin-left: 80px;">                           
                            <div class="row"><i class="fas fa-box" style="font-size: 50px;margin-left: 10px; color: green"></i>  
                                <div class="col-md-10" style="text-align: right; font-size: 16px;font-weight: bold"> <span>Tổng số sản phẩm đã bán<br> ${totalS}</span>
                                </div>                       
                            </div>
                        </div>  
                    </div>

                    <div class="row"  style="margin-bottom: 30px;">
                        <div class="div1 col-md-5" style="margin-left: 45px;">                           
                            <div class="row"><i class="fa fa-user-secret" style="font-size: 50px;margin-left: 10px;"></i>  
                                <div class="col-md-10" style="text-align: right; font-size: 16px;font-weight: bold"><span>Số người đã truy cập web<br> ${sessionScope.count}</span></div>
                            </div>                       
                        </div>
                        <div class="div1 col-md-5" style="margin-left: 80px;">                           
                            <div class="row"><i class="fas fa-money-bill-wave" style="font-size: 50px;margin-left: 10px; color: khaki"></i>  
                                <div class="col-md-10" style="text-align: right; font-size: 16px;font-weight: bold"> <span>Tổng số tiền đã bán được<br>${totalP}$</span>
                                </div>                       
                            </div>
                        </div>  
                    </div>

                    <div class="row">
                        <div class="div1 col-md-5" style="margin-left: 45px;">                           
                            <div class="row"><i class="fas fa-user-tag" style="font-size: 50px;margin-left: 10px;color: red"></i>  
                                <div class="col-md-10" style="text-align: right; font-size: 16px;font-weight: bold"><span>Người dùng nổi bật: ${a.user}<br>( Số sản phẩm đã mua: ${a.bought} )</span></div>
                            </div>                       
                        </div>
                        <div class="div1 col-md-5" style="margin-left: 80px;">                           
                            <div class="row"><i class="far fa-money-bill-alt" style="font-size: 50px;margin-left: 10px; color: yellowgreen"></i>  
                                <div class="col-md-10" style="text-align: right; font-size: 16px;font-weight: bold"> <span>Trung bình giá tiền từng sản phẩm:<br>${avaP}$</span>
                                </div>                       
                            </div>
                        </div>  
                    </div>
                    <hr>
                    <i class="fas fa-shipping-fast ml-5"></i><span class="ml-3" style="font-size: 18px;font-weight: bold">Sản phẩm bán chạy nhất:</span><br>                                            
                    <div class="container" style="width: 80%">
                        <table border="1" style="width: 100%" >
                            <tr>
                                <th style="text-align: center">Sản phẩm</th>                                                    
                                <th style="text-align: center">Loại giày</th>
                                <th style="text-align: center">Đã bán</th>
                                <th style="text-align: center">Lượng hàng trong kho</th>
                                <th style="text-align: center">Giá</th>                                                     
                            </tr>   
                            <tr>
                                <td style="text-align: center; width: 550px;"> <a href="detail?pid=${p.id}"><img src="${p.image}" style="height: 60px;"></a>                                                       
                                    <a href="detail?pid=${p.id}" style="color: black">${p.name}</a>                                                        
                                </td>
                                <td style="text-align: center;width: 130px;">${p.category.cname}</td>
                                <td style="text-align: center;width: 80px;">${p.sold}</td>
                                <td style="text-align: center; width: 150px;">${p.quantity}</td>
                                <td style="text-align: center;width: 80px;">${p.price}$</td>

                            </tr>
                        </table></div>
                    <br><i class="fas fa-shopping-cart ml-5"></i><span class="ml-3" style="font-size: 18px;font-weight: bold">Sản phẩm ế nhất:</span><br>
                    <div class="container" style="width: 80%">
                        <table border="1" style="width: 100%" >
                            <tr>
                                <th style="text-align: center">Sản phẩm</th>                                                    
                                <th style="text-align: center">Loại giày</th>
                                <th style="text-align: center">Đã bán</th>
                                <th style="text-align: center">Lượng hàng trong kho</th>
                                <th style="text-align: center">Giá</th>                                                     
                            </tr>   
                            <tr>
                                <td style="text-align: center; width: 550px;"><a href="detail?pid=${pm.id}"><img src="${pm.image}" style="height: 60px;">  </a>                                                      
                                    <a href="detail?pid=${pm.id}" style="color: black">${pm.name}</a>                                                        
                                </td>
                                <td style="text-align: center;width: 130px;">${pm.category.cname}</td>
                                <td style="text-align: center; width: 80px;">${pm.sold}</td>
                                <td style="text-align: center; width: 150px;">${pm.quantity}</td>
                                <td style="text-align: center; width: 80px;">${pm.price}$</td>

                            </tr>
                        </table></div>

                </div>
            </c:if>
            <c:if test="${sessionScope.account.isAdmin!=1}">
                <div class="container">
                    <h1 class="h3 mb-3 font-weight-normal" style="text-align: center; color: red;">Cần đăng nhập tài khoản Admin để tiếp tục</h1>
                </div>
            </c:if>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
