
<%@ page language="java" contentType="text/html; charset=ISO-8859-9"
         pageEncoding="ISO-8859-9"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>TMO Kullanýcý Giriþi</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
    <!-- Fontastic Custom icon font-->
    <link rel="stylesheet" href="css/fontastic.css">
    <!-- Google fonts - Poppins -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/favicon.ico">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <link rel="stylesheet" href="dist/sweetalert2.css">
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->

</head>
<body>
<div class="page login-page">
    <div class="container d-flex align-items-center">
        <div class="form-holder has-shadow">
            <div class="row">
                <!-- Logo & Information Panel-->
                <div class="col-lg-6">
                    <div class="info d-flex align-items-center">
                        <div class="content">
                            <div class="logo">
                                <h1>Kullanýcý Giriþi</h1>
                            </div>
                            <p>Kullanýcý bilgilerinizi girerek giriþ yapýnýz.</p>
                        </div>
                    </div>
                </div>
                <!-- Form Panel    -->
                <div class="col-lg-6 bg-white">

                    <div class="form d-flex align-items-center">
                        <div class="content">
                            <form method="post" action="/login" class="form-validate">
                                <div class="form-group">
                                    <input id="sicilNo" type="text" name="sicilNo" required data-msg="Lütfen kullanýcý adýnýzý giriniz." class="input-material" size="5">
                                    <label for="sicilNo" class="label-material">Kullanýcý Adý</label>
                                </div>
                                <div class="form-group">
                                    <input id="password" type="password" name="password" required data-msg="Lütfen kullanýcý þifrenizi giriniz."  class="input-material">
                                    <label for="password" class="label-material">Parola</label>
                                </div>
                                <div class="form-group">
                                    <button id="regidter" type="submit" name="registerSubmit" class="btn btn-primary">Giriþ Yap</button>
                                </div>
                                <!-- This should be submit button but I replaced it with <a> for demo purposes-->
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- JavaScript files-->

<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/popper.js/umd/popper.min.js"> </script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
<script src="vendor/chart.js/Chart.min.js"></script>
<script src="vendor/jquery-validation/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
<!-- Main File-->
<script src="js/front.js"></script>


<!-- Optional: include a polyfill for ES6 Promises for IE11 -->
<script src="dist/sweetalert2.all.min.js"></script>
<script src="dist/sweetalert2.min.js"></script>

<script>

    $(document).ready(function () {
        if ('${login}'==2)
        Swal.fire({
            icon: 'error',
            title: 'Giriþ Baþarýsýz...',
            text: 'Kullanýcý Adý veya Þifre Hatalý'
        })
    });
</script>
</body>
</html>