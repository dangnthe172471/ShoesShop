<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shoes Shop</title>
        <!--<script src="ckeditor/ckeditor.js"></script>-->
        <script src="//cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style_detail.css" rel="stylesheet" type="text/css"/>    
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-growl/1.0.0/jquery.bootstrap-growl.min.js"></script>
    </head>
    <body>      

        <jsp:include page="menu.jsp"/>
        <div class="container">
            <div class="row">                
                <div class="col-sm-9" style="margin-top: 60px;">
                    <div class="container">
                        <div class="card">
                            <div class="row">                                   
                                <div class="col-sm-5">
                                    <img style="width: 350px;height: 460px;" src="${detail.image}">
                                </div>
                                <aside class="col-sm-7">
                                    <article class="card-body p-3">
                                        <form name="f" action="" method="post">
                                            <h3 class="title mb-3">${detail.name}</h3>
                                            <p class="price-detail-wrap"> 
                                                <span class="price h5 text-dark"> 
                                                    <span class="num"><del>${detail.price*1.5} $</del></span>
                                                </span> <br>
                                                <span class="price h3 text-warning"> 
                                                    <span class="num">${detail.price} $</span>
                                                </span> 
                                            </p>                                       
                                            <span class="text-danger" style="font-size: 20px;font-weight: bold">Ngày Sản Xuất: </span><input class="text-danger" style="width: 200px;border: none;font-size: 20px;font-weight: bold" type="date"  value="${detail.releaseDate}" readonly="" />
                                            <br><br><p class="text-dark" style="font-weight: bold">Lượng hàng trong kho: ${detail.quantity}</p>
                                            <p class="text-dark">⭐ ${detail.rate}/5 <span style="padding-left: 30px;">Đã bán: ${detail.sold}</span></p>
                                            <dl class="item-property">
                                                <dt>Mô tả</dt>
                                                <dd><p>${detail.description} </p></dd>
                                            </dl>
                                            <hr>
                                            <div class="row">
                                                <div class="col-sm-5">
                                                    <dl class="param param-inline">
                                                        <dt>Số lượng: </dt>
                                                        <dd>
                                                            <input type="number" name="num" style="width:70px;" min="1" max="${detail.quantity}" value="1" >
                                                        </dd>
                                                    </dl> 
                                                    <a href="#" onclick="buy('${detail.id}')" class="btn btn-lg btn-primary text-uppercase" style="padding-right: 30px;padding-left: 30px; margin-left: 120px;"> Buy now </a>
                                                </div>
                                            </div>
                                        </form>
                                    </article>
                                </aside>
                            </div>                                                
                        </div>

                        <c:if test="${sessionScope.account!=null}">
                            <form action="comment" style="margin-top: 20px;" id="feedback" >
                                <div style="display: flex; align-items: center; padding-left: 10px;">
                                    <img src="${sessionScope.account.avatar}" style="width: 40px;height: 40px;border-radius: 50%;"/>
                                    <h6 style="margin-left: 10px;font-size:20px;color: red;margin-top: 10px;">${sessionScope.account.user}</h6>
                                </div>
                                <textarea style="height: 80px;width: 300px;margin-top: 10px;" name="content" placeholder="Viết đánh giá của bạn tại đây"></textarea>                              
                                <select name="voted">
                                    <option value="5" style="text-align: center">⭐⭐⭐⭐⭐</option>
                                    <option value="4" style="text-align: center">⭐⭐⭐⭐</option> 
                                    <option value="3" style="text-align: center">⭐⭐⭐</option>
                                    <option value="2" style="text-align: center">⭐⭐</option>
                                    <option value="1" style="text-align: center">⭐</option>                                                                     
                                </select>
                                <div class="g-recaptcha" data-sitekey="6LePFu8pAAAAAGmtUh76Nc4A3dKyJG-S6ioyycBR"></div>
                                <div style="color: red; display: none" id="uncheck">Vui lòng xác thực bạn không phải là robot</div>
                                <input type="button" onclick="checkCaptcha()" value="Đánh giá">
                                <input value="${detail.id}" type="hidden" name="pid">
                                <input value="${sessionScope.account.id}" type="hidden" name="aid">
                            </form>
                        </c:if>
                        <c:if test="${sessionScope.account==null}">
                            <span style="color: red; font-size: 18px;">Vui lòng <a href="login" style="color: red">đăng nhập</a> để đánh giá!</span>
                        </c:if>
                        <hr>
                        <span style="color: chocolate; font-size: 20px;">Đánh giá:</span>
                        <div>                                        
                            <c:forEach items="${listCo}" var="co">
                                <div style="display: flex; align-items: center; padding-left: 10px;border: 0.5px solid black;margin-bottom: 10px;">
                                    <img src="${co.account.avatar}" style="width: 50px;height: 50px;border-radius: 50%"/>
                                    <h6 style="margin-left: 10px;font-size:20px; padding-top: 10px;color: red">${co.account.user} <span style="font-size:18px; font-weight: normal; color: black">(${co.voted}⭐)</span><br><span style="font-size:18px; font-weight: normal; color: black">${co.content}</span></h6>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="clearfix row" >
                            <c:if test="${countP >= 8}">
                                <div class="hint-text" style="margin-top: 22px;margin-left: 10px;">Showing <b>8</b> out of <b>${countP}</b> feedback</div>
                            </c:if>
                            <c:if test="${countP < 8}">
                                <div class="hint-text" style="margin-top: 22px;margin-left: 10px;">Showing <b>${countP}</b> out of <b>${countP}</b> feedback</div>
                            </c:if>  
                            <ul class="pagination" style="margin-left: 100px;">
                                <li class="page-item disabled"><a href="#" class="page-link">Previous</a></li>
                                    <c:forEach begin="1" end="${endP}" var="i">                                             
                                    <li class="${page==i?'page-item active':''}">
                                        <a href="detail?pid=${detail.id}&index=${i}" class="page-link">${i}</a></li>
                                    </c:forEach>
                                <li class="page-item disabled"><a href="#" class="page-link">Next</a></li>
                            </ul>
                        </div> 

                    </div>
                </div>
                <div class="col-sm-3">
                    <h5 style="color: black;padding-left: 20px; margin: 0 auto; width: 100%">Các sản phẩm cùng loại<hr></h5>                   
                        <c:forEach items="${listP}" var="o">   
                        <div class="col-12 col-md-12 col-lg-12" >
                            <div class="card" >
                                <img src="${o.image}" alt="Card image cap" style="height: 200px;">
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
                                            <a href="detail?pid=${o.id}" class="btn btn-light btn-block fa fa-shopping-cart btn-outline-success" style="text-align: center; margin: 0 30px;width: 60%;">&nbsp;&nbsp; Detail</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>                   
                </div>


            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script type="text/javascript">
                                    function checkCaptcha() {
                                        var form = document.getElementById("feedback");
                                        var uncheck = document.getElementById("uncheck");
                                        const response = grecaptcha.getResponse();
                                        console.log(response);
                                        if (response) {
                                            form.submit();
                                        } else {
                                            uncheck.style.display = "";
                                        }
                                    }
        </script>


        <script type="text/javascript">
            function buy(id) {
                $.bootstrapGrowl("Thêm giỏ hàng thành công!", {
                    type: "success"
                });

                setTimeout(function () {
                    document.f.action = "buy?id=" + id;
                    document.f.submit();
                }, 800);
            }
        </script>   

        <script>
            var editor = CKEDITOR.replace('content');
            CKFinder.setupCKEditor(editor, 'ckfinder/');
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
