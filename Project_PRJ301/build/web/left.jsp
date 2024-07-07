<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-sm-3" >
    <div class="card bg-light mb-3" style="border: 1px solid black">
        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
        <ul class="list-group category_block">
            <li class="list-group-item text-white"><a href="search" style="color: black; font-size: 14px;font-weight: bold">ALL</a></li>
                <c:forEach items="${listC}" var="o">                         
                <li class="list-group-item text-white"><a href="search?cid=${o.cid}" style="color: black; font-size: 14px;font-weight: bold">${o.cname}</a></li>
                </c:forEach>
        </ul>
    </div>
    <div class="card bg-light mb-3" style="border: 2px solid black">
        <div class="card-header bg-info text-white text-uppercase">Sản Phẩm Mới</div>
        <div class="card-body">
            <img class="img-fluid" src="${p.image}" />
            <h5 class="card-title show_txt" title="${p.name}" style="margin: 10px 0;"><a href="detail?pid=${p.id}">${p.name}</a></h5>
            <p style="text-align: center; color: black;font-size: 12px;margin-bottom: 0px;"><del>Price: ${p.price*1.5} $</del></p>
            <p style="text-align: center; color: red;font-size: 18px;font-weight: bold">Price: ${p.price} $</p>
            <a href="detail?pid=${p.id}" class="btn btn-group-lg btn-outline-success fa fa-shopping-cart" style="margin-left: 40px;font-size: 24px;font-weight: bold">&nbsp; Detail</a>
        </div>
    </div>
</div>