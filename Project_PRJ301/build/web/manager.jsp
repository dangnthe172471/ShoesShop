<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shoes Shop</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style type="text/css">
            img{
                width: 200px;
                height: 150px;
            }
            input{
                margin-top: 5px;
            }
            table{
                border:0.5px solid black;
            }
            th{
                border:1px solid black;
            }
            td{
                border:1px dotted blue;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-md navbar-dark bg-info" style="height: 160px">
            <div class="container">
                <div style="width: 25%"><!-- content logo-->
                    <a href="home"><img src="img/logo.jpg" style="width: 165PX;height: 145px; border: 1px solid black; border-radius: 50%"></a>
                </div>      
                <div class="collapse navbar-collapse justify-content-end col" id="navbarsExampleDefault">
                    <div class="row">
                        <ul class="navbar-nav col-md-8" style="">
                            <li class="nav-item" >
                                <p class="nav-link" style="color: white; font-size: 16px;padding-top: 60px;">SHOES SHOP ONLY AUTHENTIC - CHUYÊN HÀNG CHÍNH HÃNG</p>
                            </li>                     
                        </ul>
                        <a class="btn btn-success btn-sm ml-3" href="cart.jsp" style="height: 30px;margin-top: 55px;font-size: 14px;">
                            <i class="fa fa-shopping-cart"></i> Cart <span class="badge badge-light">${size}</span>
                        </a>
                    </div>
                    <div class="row" style="padding-left: 468px;width: 160%">                        
                        <jsp:include page="nav.jsp"/>
                    </div>
                </div>
            </div>
        </nav>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manage <b>Product</b></h2>
                        </div>
                        <c:if test="${sessionScope.account.isAdmin==1}">

                            <div class="col-sm-6">
                                <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">add_circle_outline</i> <span>Add New Product</span></a>
                            </div>
                        </c:if>
                    </div>                    
                </div>                
                <form action="manager" style="padding-left: 30px;" class="container">
                    <div class="row">
                        <div class="col-md-8">Chọn loại giày:
                            <button id="toggleAll" onclick="toggleAllCheckboxes()" style="font-size: 14px;">All</button><br>
                            <c:forEach items="${requestScope.listC}" var="c">
                                <c:set var="isChecked" value="false" />
                                <c:if test="${not empty requestScope.cid}">
                                    <c:forEach var="selectedCid" items="${requestScope.cid}">
                                        <c:if test="${c.cid == selectedCid}">
                                            <c:set var="isChecked" value="true" />
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                                <input onchange="this.form.submit()" ${isChecked ? 'checked' : ''} type="checkbox" class="categoryCheckbox" style="margin-left: 20px;" value="${c.cid}" name="cid"/>${c.cname}
                            </c:forEach>
                            <br><input type="text" name="key" value="${key != null ? key : ''}" placeholder="Nhập tên, miêu tả" style="padding-right: 60px"><br>
                            Từ giá: <input type="number" name="fromprice" value="${fromprice != null ? fromprice : ''}" style="margin-left: 10px;width: 140px;">
                            Đến giá: <input type="number" name="toprice" value="${toprice != null ? toprice : ''}" style="margin-left: 12px;width: 140px;"> <br>
                            Từ ngày: <input type="date" name="fromdate" value="${fromdate != null ? fromdate : ''}" style="margin-left: -2px;">&nbsp; &nbsp; &nbsp;
                            Đến ngày: <input type="date" name="todate" value="${todate != null ? todate : ''}"> <br>
                        </div>
                        <div class="col-md-4">
                            <select name="sort" onchange="this.form.submit()" style="margin-left: 150px;margin-top: 5px">
                                <option ${sort == 0 ? 'selected' : ''} value="0">--NONE--</option>
                                <option ${sort == 1 ? 'selected' : ''} value="1">Giá ↑</option>
                                <option ${sort == 2 ? 'selected' : ''} value="2">Giá ↓</option>
                                <option ${sort == 3 ? 'selected' : ''} value="3">⭐ ↑</option>
                                <option ${sort == 4 ? 'selected' : ''} value="4">⭐ ↓</option>
                                <option ${sort == 5 ? 'selected' : ''} value="5">Lượt bán ↑</option>    
                                <option ${sort == 6 ? 'selected' : ''} value="6">Lượt bán ↓</option>
                            </select>
                        </div>
                    </div>
                    <input type="submit" value="SEARCH">                    
                </form>                
                <c:if test="${countP >= 9}">
                    <div class="clearfix" style="margin: 10px -24px">
                        <div class="hint-text" style="margin-left: 40px;">Showing <b>9</b> out of <b>${countP}</b> entries</div>
                        <ul class="pagination" style="display: flex; margin-right: 120px;">                                          
                            <c:forEach begin="1" end="${endP}" var="i">                                             
                                <li style="margin: -15px 5px;${page==i?'text-decoration: underline;':''}">
                                    <form action="manager">
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
                <a href="crud"  class="btn btn-success" style="margin: 10px;"><span>Manager Comment</span></a>
                <table class="table table-striped table-hover">
                    <thead class="title">
                        <tr>                           
                            <th style="text-align: center;display: table-cell;vertical-align: middle;">ID</th>
                            <th style="text-align: center;display: table-cell;vertical-align: middle;">Sản phẩm</th>
                            <th style="text-align: center;display: table-cell;vertical-align: middle;">Category
                                <form action="manager">
                                    <input type="hidden" value="${key}" name="key">
                                    <input type="hidden" value="${fromdate}" name="todate">
                                    <input type="hidden" value="${fromprice}" name="fromprice">
                                    <input type="hidden" value="${todate}" name="todate">
                                    <input type="hidden" value="${toprice}" name="toprice">
                                    <select name="cid" onchange="this.form.submit()">
                                        <c:forEach items="${listC}" var="o">
                                            <option value="${o.cid}">${o.cname}</option>
                                        </c:forEach>
                                    </select>
                                </form>
                            </th>
                            <th style="text-align: center;display: table-cell;vertical-align: middle;">Đánh giá</th>
                            <th style="text-align: center;display: table-cell;vertical-align: middle;">Số lượng</th>
                            <th style="text-align: center;display: table-cell;vertical-align: middle;">Đã bán</th>
                            <th style="text-align: center;display: table-cell;vertical-align: middle;">Ngày nhập</th>
                            <th style="text-align: center;display: table-cell;vertical-align: middle;">Giá</th>
                            <th style="text-align: center;display: table-cell;vertical-align: middle;">Mô tả</th>
                                <c:if test="${sessionScope.account.isAdmin==1}">
                                <th style="text-align: center;display: table-cell;vertical-align: middle;">Actions</th>
                                </c:if>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listP}" var="o">
                            <tr>
                                <td style="text-align: center;display: table-cell;vertical-align: middle;">${o.id}</td>
                                <td style="text-align: center;display: table-cell;vertical-align: middle;">                                 
                                    <div class="ml-0 d-inline-block align-middle">
                                        <h6 class="mb-0"> <a href="detail?pid=${o.id}" style="font-size: 14px;" class="text-dark d-inline-block">${o.name}</a></h6>
                                    </div> 
                                    <a href="detail?pid=${o.id}"><img src="${o.image}"></a>
                                </td>
                                <td style="text-align: center;display: table-cell;vertical-align: middle;width: 65px;">${o.category.cname}</td>
                                <td style="text-align: center;display: table-cell;vertical-align: middle;width: 65px;">${o.rate}⭐</td>
                                <td style="text-align: center;display: table-cell;vertical-align: middle;width: 25px;">${o.quantity}</td>                               
                                <td style="text-align: center;display: table-cell;vertical-align: middle;width: 25px;">${o.sold}</td>
                                <td style="width: 130px; text-align: center;display: table-cell;vertical-align: middle;">${o.releaseDate}</td>
                                <td style="text-align: center;display: table-cell;vertical-align: middle;">${o.price}$</td>
                                <td style="width: 500px;display: table-cell;vertical-align: middle;text-align: center">${o.description}</td>
                                <c:if test="${sessionScope.account.isAdmin==1}">
                                    <td style="text-align: center;display: table-cell;vertical-align: middle;width: 120px;">
                                        <a href="load?pid=${o.id}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                        <a href="#" onclick="doDelete('${o.id}')" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                    </td>
                                </c:if>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>                  
            </div>                
        </div>               
        <!-- ADD -->
        <div id="addEmployeeModal" class="modal fade container" style="width: 1200px;">
            <div class="container">
                <div class="modal-content">
                    <form action="add" method="post" enctype="multipart/form-data">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" type="text" class="form-control"  value="${param.name} "required>
                            </div>  
                            <div class="form-group">
                                <label>Release Date</label>
                                <input name="releaseDate" type="date" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Description</label>                                
                                <textarea name="description" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Voted</label>
                                <input name="rate" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Quantity</label>
                                <input name="quantity" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Sold</label>
                                <input name="sold" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Image</label>                                
                                <input id="avatarInput" type="file" name="avatar" placeholder="Upload" style="width: 90%;">

                                Or: <input type="text" name="image" placeholder="Nhập đường dẫn URL" >

                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input name="price" type="text" class="form-control" required>
                            </div>  
                            <div class="form-group">
                                <label>Category</label>
                                <select name="category" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${listC}" var="o">
                                        <option value="${o.cid}">${o.cname}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <script src="js/manager.js" type="text/javascript"></script>
        <script type="text/javascript">
                                            function doDelete(id) {
                                                if (confirm("Bạn có chắc muốn xóa sản phẩm có id " + id + "?\n\nThao tác này không thể hoàn tác.")) {
                                                    window.location = "delete?pid=" + id;
                                                }
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
    </body>
</html>
