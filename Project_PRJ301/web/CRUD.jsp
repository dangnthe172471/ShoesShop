<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="img/favicon.ico" rel="icon">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.gstatic.com">    
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <style>
            img{
                width: 100px;
                height: 100px;
            }
        </style>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
        <div class="container" style="margin-top: 10px;margin-bottom: -30px;margin-left: 1100px;">
            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Add New Comment</button>
        </div>         
        <jsp:useBean id="d" class="dal.CommentDAO"/>
        <a href="manager"  class="btn btn-success" style="margin-left: 205px;margin-bottom: -68px;"><span>Manager Comment</span></a>

        <table class="container" border="1" style="margin-top: 50px;width: 1100px">
            <thead class="title" style="background: rgb(233,236,239); height: 50px;">
                <tr>                           
                    <th></th>
                        <c:forEach items="${requestScope.listA}" var="a">
                        <th style="text-align: center;display: table-cell;vertical-align: middle;">${a.user}</th>
                        </c:forEach>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.listP}" var="o">
                    <tr>
                        <td style="display: table-cell;vertical-align: middle;width: 280px;">   
                            <a href="detail?pid=${o.id}"><img src="${o.image}"></a>
                            <div class="ml-0 d-inline-block align-middle">
                                <h6 class="mb-0"> <a href="detail?pid=${o.id}" style="font-size: 14px;" class="text-dark d-inline-block">${o.name}</a></h6>
                            </div> 
                        </td>
                        <c:forEach items="${requestScope.listA}" var="a">
                            <td style="text-align: center;display: table-cell;vertical-align: middle;width: 200px;">
                                <c:forEach var="c" items="${d.getAllCommnet(o.id, a.id)}">
                                    <div class="row" style="margin-left: 5px;text-align: left; width: 150px;">
                                        <form action="loadcommnet">
                                            <input name="voted" type="submit" value="${c.voted}" style="width: 15px;border: none;background-color: white;text-align: left" readonly="">⭐<br>
                                            <a href="loadcommnet?id=${c.id}" style="color: black;font-size: 16px;">${c.content}</a>
                                            <input type="hidden" name="id" value="${c.id}">
                                        </form>
                                    </div>
                                </c:forEach>                
                            </td>
                        </c:forEach>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <c:if test="${page != 0}">
            <a href="crud?index=0" class="page-link container" style="width: 1100px;margin-top: 20px">Show All</a>   
            <div class="clearfix row container" style="margin-left: 190px;margin-top: 30px;" >
                <div class="hint-text" style="margin-top: 3px;">Showing <b>5</b> out of <b>${countP}</b> entries</div>
                <ul class="pagination" style="margin-left: 250px;">
                    <li class="page-item disabled"><a href="#" class="page-link">Previous</a></li>
                        <c:forEach begin="1" end="${endP}" var="i">                                             
                        <li class="${page==i?'page-item active':''}"><a href="crud?index=${i}" class="page-link">${i}</a></li>
                        </c:forEach>
                    <li class="page-item disabled"><a href="#" class="page-link">Next</a></li>
                </ul>
            </div>
        </c:if>   

        <div class="modal fade" id="myModal" role="dialog" >
            <div class="modal-dialog">
                <!-- Modal content-->               
                <div class="modal-content" style="width: 900px;margin-left: -200px;;">
                    <form action="addcmt" enctype="multipart/form-data">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Comment</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Nguời đánh giá</label>
                                <select name="aid">
                                    <c:forEach items="${listA}" var="a">
                                        <option value="${a.id}">${a.user}</option>
                                    </c:forEach>
                                </select>
                            </div>  
                            <div class="form-group">
                                <label>Sản Phẩm</label>
                                <select name="pid">
                                    <c:forEach items="${listP}" var="p">
                                        <option value="${p.id}">${p.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Voted</label>
                                <select name="voted">
                                    <option value="5" style="text-align: center">⭐⭐⭐⭐⭐</option>
                                    <option value="4" style="text-align: center">⭐⭐⭐⭐</option> 
                                    <option value="3" style="text-align: center">⭐⭐⭐</option>
                                    <option value="2" style="text-align: center">⭐⭐</option>
                                    <option value="1" style="text-align: center">⭐</option>                                                                     
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Content</label>                                
                                <textarea name="content" class="form-control" required></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div> 
            </div>
    </body>
</html>
