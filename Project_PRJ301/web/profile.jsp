<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shoes Shop</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>        
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
            <section class="bg-light">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 mb-4 mb-sm-5">
                            <div class="card card-style1 border-0">
                                <div class="card-body p-1-9 p-sm-2-3 p-md-6 p-lg-7">
                                    <div class="row align-items-center">                                        
                                        <div class="col-lg-6 mb-4 mb-lg-0">   
                                            <img id="avatarPreview" src="${sessionScope.account.avatar}" style="margin-left: 100px;width: 300px;height: 300px;border-radius: 50%">
                                        <form id="uploadForm" action="avatar" method="post" enctype="multipart/form-data">
                                            <input id="avatarInput" type="file" name="avatar" placeholder="Upload" style="width: 68%; padding-left: 80px; ">
                                            <input type="hidden" name="user" value="${sessionScope.account.user}" readonly>
                                        </form>
                                        <form action="avatar" style="margin-top: 5px;margin-left: 50px;">                                                
                                            Or: <input type="text" name="avatar" placeholder="Nhập đường dẫn URL" ><input type="submit" value="Upload">
                                            <input type="hidden" name="user" value="${sessionScope.account.user}" readonly>
                                        </form>
                                    </div>
                                    <div class="col-lg-6">
                                        <c:set var="acc" value="${sessionScope.account}"/>
                                        <c:if test="${acc!=null}">
                                            <c:if test="${sessionScope.account.isAdmin!=1}">
                                                <h4 style="text-align: center">Thông tin tài khoản</h4><br>
                                                Tên tài khoản: ${acc.user}<br>
                                                Email: ${acc.email} &nbsp;&nbsp; <a href="loadeditprofile?user=${acc.user}"><i class="fas fa-user-edit"></i></a><br> 
                                                Số điện thoại: ${acc.phone} &nbsp;&nbsp; <a href="loadeditprofile?user=${acc.user}"><i class="fas fa-user-edit"></i></a><br> 
                                                Địa chỉ: ${acc.address} &nbsp;&nbsp; <a href="loadeditprofile?user=${acc.user}"><i class="fas fa-user-edit"></i></a><br>
                                                Số sản phẩm đã mua: ${acc.bought}<br>
                                                Số dư: ${acc.amount>=0?'':'0'} $<br>
                                                Role: ${acc.isAdmin == 0 ? "Tài khoản thường" : "Tài khoản Admin"}<br>    
                                            </c:if>
                                            <c:if test="${sessionScope.account.isAdmin==1}">
                                                <h4 style="text-align: center">Thông tin tài khoản</h4><br>                                             
                                                Tên tài khoản: ${acc.user}<br>
                                                Email: ${acc.email}  &nbsp;&nbsp; <a href="loadeditprofile?user=${acc.user}"><i class="fas fa-user-edit"></i></a><br> 
                                                Số điện thoại: ${acc.phone}  &nbsp;&nbsp; <a href="loadeditprofile?user=${acc.user}"><i class="fas fa-user-edit"></i></a><br> 
                                                Địa chỉ: ${acc.address} &nbsp;&nbsp; <a href="loadeditprofile?user=${acc.user}"><i class="fas fa-user-edit"></i></a><br>
                                                Số sản phẩm đã mua: ${acc.bought}<br>
                                                Số dư: ${acc.amount} $<br>
                                                Role: ${acc.isAdmin == 0 ? "Tài khoản thường" : "Tài khoản Admin"}<br>  
                                                Số người đã truy cập web: ${sessionScope.count} &nbsp;&nbsp;<i class="fa fa-user-secret"></i>                                                
                                            </c:if>
                                        </c:if>
                                        <c:if test="${acc==null}">
                                            <h1 class="h3 mb-3 font-weight-normal" style="text-align: center">Cần đăng nhập để tiếp tục</h1>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="footer.jsp"></jsp:include> 
        <script>
            // Bắt sự kiện khi có thay đổi trong input file
            document.getElementById('avatarInput').addEventListener('change', function () {
                // Lấy form upload
                var form = document.getElementById('uploadForm');

                // Gửi form tự động khi có thay đổi
                form.submit();
            });
        </script>
    </body>    
</html>
