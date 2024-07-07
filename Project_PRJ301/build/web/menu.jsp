<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<section class=" text-center" style="height: 100px; padding:15px;background-color: rgb(233,236,239);margin-bottom: 20px;">
    <div class="container">
        <h1 class="jumbotron-heading">Siêu thị giày chất lượng cao</h1>
        <p class="lead text-muted mb-0">Uy tín tạo nên thương hiệu, chuyên cung cấp các sản phầm giày đẹp chính hãng với giá tốt</p>
    </div>
</section>   
<div class="container">
    <div class="row">
        <div class="col">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="home">Home</a></li>
                        <c:forEach items="${listC}" var="o">
                        <li class="breadcrumb-item" style="${cid == o.cid ? 'display: block;' : 'display: none;'}">${o.cname}</li>
                        </c:forEach>
                </ol>
            </nav>
        </div>
    </div>
</div>
