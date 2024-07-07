<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <style>
            body {
                color: #566787;
                background: #f5f5f5;
                font-family: 'Varela Round', sans-serif;
                font-size: 18px;
            }
            .form-control{
                font-size: 18px;
            }
            input{
                height: 40px;
            }
        </style>
    </head>

    <body>
        <div id="editEmployeeModal" class="modalfade" style="margin-top: 50px;">
            <div class="modal-dialog">
                <div class="modal-content" style="margin-top: 20px;">
                    <form action="editcomment" enctype="multipart/form-data">
                        <div class="modal-header">						
                            <h1 class="modal-title">Edit Comment</h1>
                            <a href="#" onclick="doDelete('${c.id}')" class="delete" data-toggle="modal" style="color: black"><input style="width: 50px;margin-left: 125px;"  class="btn btn-danger" value="Xóa"></a>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Người đánh giá</label>
                                <input value="${c.account.user}" type="text" class="form-control"  readonly>
                            </div>
                            <div class="form-group">
                                <label>Tên sản phẩm</label>
                                <input value="${c.product.name}" type="text" class="form-control" readonly>
                            </div>                           
                            <input value="${c.id}" type="hidden" name="id" class="form-control" readonly>
                            <div class="form-group">
                                <label>Số sao</label>
                                <select name="voted">
                                    <option ${c.voted==5?'selected':''}  value="5" style="text-align: center">⭐⭐⭐⭐⭐</option>
                                    <option ${c.voted==4?'selected':''}  value="4" style="text-align: center">⭐⭐⭐⭐</option> 
                                    <option ${c.voted==3?'selected':''}  value="3" style="text-align: center">⭐⭐⭐</option>
                                    <option ${c.voted==2?'selected':''}  value="2" style="text-align: center">⭐⭐</option>
                                    <option ${c.voted==1?'selected':''}  value="1" style="text-align: center">⭐</option>                                                                     
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Content</label>
                                <textarea name="content" class="form-control" required>${c.content}</textarea>                           
                            </div>
                        </div>
                        <div class="modal-footer">
                            <a href="crud" style="color: black"><input style="width: 50px;"  class="btn btn-outline-dark" value="Cancel"></a>
                            <input type="submit" style="width: 50px" class="btn btn-info" value="Save">                            
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="//cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>
    <script>
        CKEDITOR.replace('content');
    </script>
    <script type="text/javascript">
        function doDelete(id) {
            if (confirm("Bạn có chắc muốn xóa comment này? \n\nThao tác này không thể hoàn tác.")) {
                window.location = "deletecmt?id=" + id;
            }
        }
    </script>
</html>
