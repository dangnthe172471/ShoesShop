<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shoes Shop</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
        <link rel="shortcut icon" href="img/logo.jpg"/>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            input{
                margin-top: 8px;
            }
        </style>
    </head>
    <body>   
        <jsp:include page="menu.jsp"></jsp:include>      
            <div class="container">
                <div class="row">   
                <jsp:include page="left.jsp"></jsp:include>
                    <div class="col-sm-9">
                        <div class="row" style="border: 2px solid black"> 
                            <div class="col-12 col-md-12 col-lg-12">
                                <div><img src="img/banner1.png" style="width: 100%;height: 312px; margin-bottom: 20px;"></div>
                            </div>
                            <div class="row" id="content" style="margin-left: -2px;">
                                <h3 style="width: 100%;color: red;padding: 5px 15px">Sản phẩm bán chạy</h3>
                            <c:forEach items="${listS}" var="o">   
                                <div class="col-12 col-md-4 col-lg-4" >
                                    <div class="card" >
                                        <img src="${o.image}" alt="Card image cap" style="height: 250px;">
                                        <div class="card-body">
                                            <h4 class="card-title show_txt" style="font-size: 18px;"><a href="detail?pid=${o.id}" title="${o.name}">${o.name}</a></h4>
                                            <div class="row">
                                                <span class="card-text show_txt" style="width: 40%; padding-left: 20px;">${o.rate}&#9733;</span>
                                                <p class="card-text show_txt" title="${o.sold}" style="width: 40%;font-size: 12px;text-align: right; margin-left: 30px;margin-top: 5px;">Đã bán: ${o.sold}</p><br><br>
                                            </div>
                                            <div class="row" style="width: 100%;margin: -20px auto;">
                                                <div class="col" style="width: 100%">
                                                    <p style="text-align: center; color: black;font-size: 12px;margin-bottom: 0px;"><del>Price: ${o.price*1.5} $</del></p>
                                                    <p style="text-align: center; color: red;font-size: 16px;font-weight: bold">Price: ${o.price} $</p>
                                                </div>
                                                <div class="col" style="width: 100%; padding-bottom: 15px;">
                                                    <a href="detail?pid=${o.id}" class="btn btn-success btn-block fa fa-shopping-cart btn-outline-success" style="text-align: center; margin: 0 30px;width: 60%;">&nbsp;&nbsp; Detail</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                            <h3 style="width: 100%;color: red;padding: 5px 15px">Sản phẩm mới</h3>
                            <c:forEach items="${listL}" var="o">   
                                <div class="col-12 col-md-4 col-lg-4" >
                                    <div class="card" >
                                        <img src="${o.image}" alt="Card image cap" style="height: 250px;">
                                        <div class="card-body">
                                            <h4 class="card-title show_txt" style="font-size: 18px;"><a href="detail?pid=${o.id}" title="${o.name}">${o.name}</a></h4>
                                            <div class="row">
                                                <span class="card-text show_txt" style="width: 40%; padding-left: 20px;">${o.rate}&#9733;</span>
                                                <p class="card-text show_txt" title="${o.sold}" style="width: 40%;font-size: 12px;text-align: right; margin-left: 30px;margin-top: 5px;">Đã bán: ${o.sold}</p><br><br>
                                            </div>
                                            <div class="row" style="width: 100%;margin: -20px auto;">
                                                <div class="col" style="width: 100%">
                                                    <p style="text-align: center; color: black;font-size: 12px;margin-bottom: 0px;"><del>Price: ${o.price*1.5} $</del></p>
                                                    <p style="text-align: center; color: red;font-size: 16px;font-weight: bold">Price: ${o.price} $</p>
                                                </div>
                                                <div class="col" style="width: 100%; padding-bottom: 15px;">
                                                    <a href="detail?pid=${o.id}" class="btn btn-success btn-block fa fa-shopping-cart btn-outline-success" style="text-align: center; margin: 0 30px;width: 60%;">&nbsp;&nbsp; Detail</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                            <h3 style="width: 100%;color: red;padding: 5px 15px">Sản phẩm giá tốt</h3>
                            <c:forEach items="${listP}" var="o">   
                                <div class="col-12 col-md-4 col-lg-4" >
                                    <div class="card" >
                                        <img src="${o.image}" alt="Card image cap" style="height: 250px;">
                                        <div class="card-body">
                                            <h4 class="card-title show_txt" style="font-size: 18px;"><a href="detail?pid=${o.id}" title="${o.name}">${o.name}</a></h4>
                                            <div class="row">
                                                <span class="card-text show_txt" style="width: 40%; padding-left: 20px;">${o.rate}&#9733;</span>
                                                <p class="card-text show_txt" title="${o.sold}" style="width: 40%;font-size: 12px;text-align: right; margin-left: 30px;margin-top: 5px;">Đã bán: ${o.sold}</p><br><br>
                                            </div>
                                            <div class="row" style="width: 100%;margin: -20px auto;">
                                                <div class="col" style="width: 100%">
                                                    <p style="text-align: center; color: black;font-size: 12px;margin-bottom: 0px;"><del>Price: ${o.price*1.5} $</del></p>
                                                    <p style="text-align: center; color: red;font-size: 16px;font-weight: bold">Price: ${o.price} $</p>
                                                </div>
                                                <div class="col" style="width: 100%; padding-bottom: 15px;">
                                                    <a href="detail?pid=${o.id}" class="btn btn-success btn-block fa fa-shopping-cart btn-outline-success" style="text-align: center; margin: 0 30px;width: 60%;">&nbsp;&nbsp; Detail</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                            <h3 style="width: 100%;color: red;padding: 5px 15px">Sản phẩm đại hạ giá</h3>
                            <c:forEach items="${list1}" var="o">   
                                <div class="col-12 col-md-4 col-lg-4" >
                                    <div class="card" >
                                        <img src="${o.image}" alt="Card image cap" style="height: 250px;">
                                        <div class="card-body">
                                            <h4 class="card-title show_txt" style="font-size: 18px;"><a href="detail?pid=${o.id}" title="${o.name}">${o.name}</a></h4>
                                            <div class="row">
                                                <span class="card-text show_txt" style="width: 40%; padding-left: 20px;">${o.rate}&#9733;</span>
                                                <p class="card-text show_txt" title="${o.sold}" style="width: 40%;font-size: 12px;text-align: right; margin-left: 30px;margin-top: 5px;">Đã bán: ${o.sold}</p><br><br>
                                            </div>
                                            <div class="row" style="width: 100%;margin: -20px auto;">
                                                <div class="col" style="width: 100%">
                                                    <p style="text-align: center; color: black;font-size: 12px;margin-bottom: 0px;"><del>Price: ${o.price*1.5} $</del></p>
                                                    <p style="text-align: center; color: red;font-size: 16px;font-weight: bold">Price: 1000000000 VND</p>
                                                     <fmt:formatNumber value="1000000000" type="number" groupingUsed="true"/>
                                                </div>
                                                <div class="col" style="width: 100%; padding-bottom: 15px;">
                                                    <a href="detail?pid=${o.id}" class="btn btn-success btn-block fa fa-shopping-cart btn-outline-success" style="text-align: center; margin: 0 30px;width: 60%;">&nbsp;&nbsp; Detail</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <h5 style="padding: 5px;margin: 15px auto; border: 1px solid chocolate; background-color: #E4E4E4"><a href="search" style="color: black ">Tất Cả</a></h5>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
            function searchByName(param) {
                var keySearch = param.value;
                $.ajax({
                    url: "/project/searchbyajax",
                    type: "get", //send it through get method
                    data: {
                        key: keySearch
                    },
                    success: function (data) {
                        var row = document.getElementById("content");
                        row.innerHTML = data;
                    },
                    error: function (xhr) {
                        //Do Something to handle error
                    }
                });
            }
        </script>
        <script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
    <df-messenger
        intent="WELCOME"
        chat-title="Shoes_Shop"
        agent-id="7e28c551-7ff5-4972-aba7-4448e544df93"
        language-code="vi"
        ></df-messenger>
</body>    
</html>
