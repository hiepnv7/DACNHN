<!-- sử dụng tiếng việt -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Đăng ký</title>

    <!-- Custom fonts for this template-->
    <link href="${base}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${base}/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <!-- <div class="col-lg-5 d-none d-lg-block bg-register-image"></div> -->
                    <div class="col-lg-5 d-none d-lg-block" style="background-image: url('https://s1.1zoom.me/b6258/556/Cats_Ginger_color_Bokeh_Sitting_572594_600x800.jpg');"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Đăng ký tài khoản!</h1>
                                <c:if test="${not empty error}">
                                	<h3 class="h4 text-danger">Email đã tồn tại!</h3>
                                </c:if>
                                <c:if test="${not empty error}">
                               		<h3 class="h4 text-primary">${registerSuccess}</h3>
                               	</c:if>
                            </div>
                            <form class="user" action="${base}/register" method="POST" enctype="multipart/form-data" id="regForm">
                                <div class="form-group">
                                    <input name="fullName" type="text" class="form-control form-control-user" id="exampleInputEmail"
                                        placeholder="Họ và tên" required="required" oninvalid="this.setCustomValidity('Nhập họ và tên!')"
                                           oninput="this.setCustomValidity('')">
                                </div>
                                <div class="form-group">
                                    <input name="email" type="email" class="form-control form-control-user" id="exampleInputEmail"
                                        placeholder="Địa chỉ email" required="required" oninvalid="this.setCustomValidity('Nhập địa chỉ email!')"
                                           oninput="this.setCustomValidity('')">
                                </div>
                                <div class="form-group">
                                    <input name="userName" type="text" class="form-control form-control-user" id="exampleInputEmail"
                                        placeholder="Username" required="required" oninvalid="this.setCustomValidity('Nhập tên người dùng!')"
                                           oninput="this.setCustomValidity('')">
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input name="password" type="password" class="form-control form-control-user"
                                            id="exampleInputPassword" placeholder="Mật khẩu" required="required" oninvalid="this.setCustomValidity('Nhập mật khẩu của bạn!')"
                                               oninput="this.setCustomValidity('')">
                                    </div>
                                    <div class="col-sm-6">
                                        <input name="confirmPassword" type="password" class="form-control form-control-user"
                                            id="exampleRepeatPassword" placeholder="Xác nhận mật khẩu" required="required" oninvalid="this.setCustomValidity('Nhập lại mật khẩu!')"
                                               oninput="this.setCustomValidity('')">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
	                                    <label for="userAvatar" class="control-label">Chọn ảnh đại diện</label>
                                        <input name="userAvatar" type="file">
                                    </div>
                                </div>
                                <input type="submit" id="submit" class="btn btn-primary btn-user btn-block" value="Đăng ký">
                                <!-- <hr>
                                <a href="index.html" class="btn btn-google btn-user btn-block">
                                    <i class="fab fa-google fa-fw"></i> Register with Google
                                </a>
                                <a href="index.html" class="btn btn-facebook btn-user btn-block">
                                    <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
                                </a> -->
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="${base}/password/forgot">Quên mật khẩu?</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="${base}/login">Đăng nhập</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="${base}/vendor/jquery/jquery.min.js"></script>
    <script src="${base}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${base}/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${base}/js/sb-admin-2.min.js"></script>

    <!-- main js -->
    <jsp:include page="/WEB-INF/views/front-end/common/js.jsp"></jsp:include>
    <%--<script type="text/javascript">
        $(document).ready(function () {

            $("#submit").click(function () {
                successRegitry();

            });

        });
        function successRegitry() {
            $.ajax({
                url: "${base}/register",
                data: $('#regForm').serialize(),
                type: "POST",
                success: function(data) {
                    swal("Thành công", "Đăng ký thành công","success");
                    /*setTimeout(function() {
                        swal({
                            title: "Thành công!",
                            text: "Đăng ký thành công!",
                            type: "success"
                        }, function() {
                            window.location = "back-end/user/login";
                        });
                    }, 1000);*/
                },
                error: function(XMLHttpRequest, textStatus, errorThrown){}
            });
        }
    </script>--%>


</body>

</html>