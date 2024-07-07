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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
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

        <div class="container bg-light">
            <c:set var="acc" value="${sessionScope.account}"/>
            <c:if test="${sessionScope.account.isAdmin==1}">
                <div class="container">
                    <h4 style="text-align: center">Thống kê</h4><br>

                    <div class="row" style="margin-bottom: 50px;">
                        <button style="margin-left: 45px"><a href="statistical" style="color: black">Thống kê</a></button>
                        <button style="margin-left: 40px"><a href="statistical2" style="color: red"><u>Doanh thu</u></a></button>
                        <button style="margin-left: 40px"><a href="orderstatus" style="color: black">Đơn hàng</a></button>
                    </div>
                    <form action="statistical3">
                        <select name="year" onchange="this.form.submit()">
                            <option ${year==2020 ?'selected':''} value="2020">2020</option>
                            <option ${year==2021 ?'selected':''} value="2021">2021</option>
                            <option ${year==2022 ?'selected':''} value="2022">2022</option>
                            <option ${year==2023 ?'selected':''} value="2023">2023</option>
                            <option ${year==2024 ?'selected':''} value="2024">2024</option>
                        </select>                        
                    </form>
                    <div class="row" style=";margin-left: 900px">
                        <button style="margin-left: 40px"><a href="statistical3?year=2024" style="color: red"><u>1</u></a></button>
                        <button style="margin-left: 10px"><a href="statistical4?year=2024" style="color: black">2</a></button>
                    </div>
                    <canvas id="myChart"></canvas>
                    <script>
                        var xValues = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
                        var yValues = [${requestScope.month1},${requestScope.month2},${requestScope.month3},${requestScope.month4},${requestScope.month5},${requestScope.month6},
                        ${requestScope.month7},${requestScope.month8},${requestScope.month9},${requestScope.month10},${requestScope.month11},${requestScope.month12}];
                        var barColors = ["red", "blue", "green", "yellow", "orange", "purple", "pink", "cyan", "magenta", "teal", "brown", "grey"];

                        new Chart("myChart", {
                            type: "bar",
                            data: {
                                labels: xValues,
                                datasets: [{
                                        backgroundColor: barColors,
                                        data: yValues
                                    }]
                            },
                            options: {
                                legend: {display: false},
                                title: {
                                    display: true,
                                    text: "Thống kê chi tiết từng năm"
                                }
                            }
                        });
                    </script>
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
