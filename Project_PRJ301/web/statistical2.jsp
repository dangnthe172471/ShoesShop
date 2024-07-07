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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

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
                        <button style="margin-left: 45px"><a href="statistical" style="color: black">Thống kê</a></button>
                        <button style="margin-left: 40px"><a href="statistical2" style="color: red"><u>Doanh thu</u></a></button>
                        <button style="margin-left: 40px"><a href="orderstatus" style="color: black">Đơn hàng</a></button>
                    </div>
                    <div class="row">
                        <canvas id="myChart1" style="width:100%;max-width:550px"></canvas>
                        
                        <!--<canvas id="myChart" style="width:100%;max-width:550px"></canvas>-->

                        <div
                            id="myChart" style="width:100%;max-width:560px;">
                        </div>
                    </div> 
                    <div class="row">
                        <div class="div1 col-md-6" style="text-align: center">                           
                            <h3>Top khách hàng tiềm năng </h3>
                            <div class="row" style="height: 255px;">
                                <div class="col-md-6">
                                    Tên<hr>
                                    <c:forEach items="${listA}" var="a">
                                        <div style="display: flex; align-items: center;margin-left: 55px;;">
                                            <img src="${a.avatar}" style="width: 45px;height: 45px;border-radius: 50%" />
                                            <h6 style="margin-left: 10px;font-size:20px; padding-top: 10px; ">${a.user}</h6>
                                        </div><hr>
                                    </c:forEach>
                                </div>
                                <div class="col-md-6">
                                    Số sản phẩm đã mua<hr>
                                    <c:forEach items="${listA}" var="a">
                                        <h6 style="font-size: 22px;padding-top: 8px;height: 42px;"> ${a.bought}</h6><hr>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <button type="button" style="margin-left: 100px;height: 30px;margin-top: 30px;" ><a href="statistical3?year=2024" style="color: black;"> chi tiết</a></button>
                    </div>
                </div>
            </c:if>
            <c:if test="${sessionScope.account.isAdmin!=1}">
                <div class="container">
                    <h1 class="h3 mb-3 font-weight-normal" style="text-align: center; color: red;">Cần đăng nhập tài khoản Admin để tiếp tục</h1>
                </div>
            </c:if>
        </div>
        <jsp:include page="footer.jsp"/>
        <script>
            new Chart("myChart1", {
                type: "line",
                data: {
                    labels: ["2020", "2021", "2022", "2023", "2024"],
                    datasets: [{
                            label: "Doanh thu",
                            data: [${requestScope.year20}, ${requestScope.year21}, ${requestScope.year22}, ${requestScope.year23}, ${requestScope.year24}],
                            backgroundColor: "rgba(0,156,255,0.5)"
                        }]
                },
                options: {
                    responsive: true
                }
            });
        </script>
        
<!--        <script>
            var xValues = ["Adidas", "Nike", "Skechers", "Converse"];
            var yValues = [${requestScope.ad}, ${requestScope.ni}, ${requestScope.ske}, ${requestScope.con}];

            var barColors = [
                "#b91d47",
                "#00aba9",
                "#2b5797",
                "#e8c3b9"
            ];

            new Chart("myChart", {
                type: "pie",
                data: {
                    labels: xValues,
                    datasets: [{
                            backgroundColor: barColors,
                            data: yValues
                        }]
                },
                options: {
                    title: {
                        display: true,
                        text: "Tỷ lệ giày bán được"
                    }
                }
            });
        </script>-->

        <script>
            google.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawChart);
        
            function drawChart() {
                const data = google.visualization.arrayToDataTable([
                    ['Giày', 'Mh1'],
                    ['Adidas', ${requestScope.ad}],
                    ['Nike', ${requestScope.ni}],
                    ['Skechers', ${requestScope.ske}],
                    ['Converse', ${requestScope.con}]
                ]);
        
                const options = {
                    title: 'Tỷ lệ giày bán được',
                    is3D: true
                };
        
                const chart = new google.visualization.PieChart(document.getElementById('myChart'));
                chart.draw(data, options);
            }
        </script>
    </body>
</html>
