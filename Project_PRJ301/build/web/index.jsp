<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shoes Shop</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            input{
                margin-top: 8px;
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
                            <p class="nav-link" style="padding-left: 80px; color: white; font-size: 16px;padding-top: 60px;">SHOES SHOP ONLY AUTHENTIC - CHUYÊN HÀNG CHÍNH HÃNG</p>
                        </li>    
                        <div class="col" style="padding-top: 55px">
                            <div class="row" style="margin-left: 20px;width: 128%">
                                <c:set var="size" value="${sessionScope.size}"/>
                                <form action="search" method="post" class="form-inline my-2 my-lg-0" style="margin: 0 auto; "> 

                                    <input oninput="searchByName(this)" name="key" type="text" class="form-control" aria-label="Search" placeholder="Search..." value="${key}">                             

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

        <div class="container">
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
        <div class="container" style="width: 1111px;">
            <div class="row">   
                <div class="col-sm-3" style="border:1px solid black ">
                    <div>                                
                        <form action="search" method="post" style="margin-top: 20px;">                           
                            <h5>Categories: <button id="toggleAll" onclick="toggleAllCheckboxes()" style="font-size: 18px; margin-left: 20px;">All</button></h5>
                            <c:forEach items="${requestScope.listC}" var="c">
                                <c:set var="isChecked" value="false" />
                                <c:if test="${not empty requestScope.cid}">
                                    <c:forEach var="selectedCid" items="${requestScope.cid}">
                                        <c:if test="${c.cid == selectedCid}">
                                            <c:set var="isChecked" value="true" />
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                                <input ${isChecked ? 'checked' : ''} type="checkbox" class="categoryCheckbox" value="${c.cid}" name="cid" onchange="this.form.submit()"/>${c.cname}<br>
                            </c:forEach>
                            <hr>
                            <h5>Filters:</h5>
                            <input type="text" name="key" value="${key != null ? key : ''}" placeholder="Nhập tên, miêu tả" ><br><hr>
                            <h5>Price:</h5>       
                            Min: <input type="number" name="fromprice" value="${fromprice != null ? fromprice : ''}">
                            Max: <input type="number" name="toprice" value="${toprice != null ? toprice : ''}"> <br>
                            <hr>
                            <h5>Date:</h5>
                            Từ ngày: <input type="date" name="fromdate" value="${fromdate != null ? fromdate : ''}"> <br> 
                            Đến ngày: <input type="date" name="todate" value="${todate != null ? todate : ''}"> <br>                            
                            <input type="submit" value="SEARCH">
                        </form>
                    </div>  
                </div>
                <div class="col-sm-9" style="border: 1px solid black">
                    <div class="row" >                        
                        <c:if test="${countP!=0}">   
                            <div class="row col-12 col-md-12 col-lg-12">
                                <h3 style="color: red;padding: 15px">Danh sách sản phẩm</h3>    
                                <form action="search" method="post" style="margin-top: 20px; margin-left: 180px;">
                                    <c:forEach var="cidValue" items="${cid}">
                                        <input type="hidden" value="${cidValue}" name="cid">
                                    </c:forEach>
                                    <input type="hidden" value="${key}" name="key">
                                    <input type="hidden" value="${fromdate}" name="todate">
                                    <input type="hidden" value="${fromprice}" name="fromprice">
                                    <input type="hidden" value="${todate}" name="todate">
                                    <input type="hidden" value="${toprice}" name="toprice">
                                    <select name="sort" onchange="this.form.submit()" style="margin-left: 150px">
                                        <option ${sort == 0 ? 'selected' : ''} value="0">--NONE--</option>
                                        <option ${sort == 1 ? 'selected' : ''} value="1">Giá ↑</option>
                                        <option ${sort == 2 ? 'selected' : ''} value="2">Giá ↓</option>
                                        <option ${sort == 3 ? 'selected' : ''} value="3">⭐ ↑</option>
                                        <option ${sort == 4 ? 'selected' : ''} value="4">⭐ ↓</option>
                                        <option ${sort == 5 ? 'selected' : ''} value="5">Lượt bán ↑</option>    
                                        <option ${sort == 6 ? 'selected' : ''} value="6">Lượt bán ↓</option>
                                    </select>                                    
                                </form>
                                <c:if test="${countP >= 9}">
                                    <div class="clearfix row" style="margin: 10px -24px">
                                        <div class="hint-text" style="margin-left: 40px;">Showing <b>9</b> out of <b>${countP}</b> entries</div>
                                        <ul class="pagination" style="margin-left: 360px;">                                          
                                            <c:forEach begin="1" end="${endP}" var="i">                                             
                                                <li style="margin: -15px 5px;${page==i?'text-decoration: underline;':''}">
                                                    <form action="search">
                                                        <c:forEach var="cidValue" items="${cid}">
                                                            <input type="hidden" value="${cidValue}" name="cid">
                                                        </c:forEach>
                                                        <input type="hidden" value="${key}" name="key">
                                                        <input type="hidden" value="${fromdate}" name="todate">
                                                        <input type="hidden" value="${fromprice}" name="fromprice">
                                                        <input type="hidden" value="${todate}" name="todate">
                                                        <input type="hidden" value="${toprice}" name="toprice">
                                                        <button name="index" value="${i}" type="submit" style="border: none;background-color:${page==i?'orange':''}">${i}</button>
                                                    </form>
                                                </li>
                                            </c:forEach>                                       
                                        </ul>
                                    </div>
                                </c:if>
                            </div>
                            <div  class="row col-12 col-md-12 col-lg-12">                       
                                <c:forEach items="${listS}" var="o">                                       
                                    <div class="col-12 col-md-4 col-lg-4" id="content">
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
                            </div>
                        </div>                         
                    </c:if>
                    <c:if test="${countP==0}">
                        <h3 style="color: red; margin: 50px auto;">Không có sản phẩm bạn cần tìm</h3>
                    </c:if>                    
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

                                        function searchByPrice(price) {
                                            var priceSearch = price.value;
                                            $.ajax({
                                                url: "/project/searchbyajax",
                                                type: "get", //send it through get method
                                                data: {
                                                    toprice1: priceSearch
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
        <script>
            function toggleAllCheckboxes() {
                var checkboxes = document.getElementsByClassName('categoryCheckbox');
                var isAllChecked = true;
                for (var i = 0; i < checkboxes.length; i++) {
                    if (!checkboxes[i].checked) {
                        isAllChecked = false;
                        break;
                    }
                }
                for (var i = 0; i < checkboxes.length; i++) {
                    checkboxes[i].checked = !isAllChecked;
                }
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
