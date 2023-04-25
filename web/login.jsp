<%@ page contentType="text/html; charsetUTF-8" language="java" pageEncoding="UTF-8" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
    <link rel="stylesheet" href="css/reset.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" href="css/login.css">

</head>
<body>

<div class="form-login">
    <div class="background"></div>
    <form action="/doLogin" method="post">
        <img src="images/logo/logo-rmbg1.png" alt="">
        <h2> Đăng nhập</h2>
        <div class="user">
            <p class="error">
            </p>
            <input type="text" name="user" class="name input" placeholder="Email hoặc số điện thoại">
            <input type="password" name="password" class="pass input" placeholder="Mật khẩu">
            <a href="http://localhost:8080/forgotPass" class="forget"> Bạn quên mật khẩu?</a>

            <input type="submit" name="submit" class="submit" value="Đăng nhập">
            <div id="status"></div>
            <p class="sign-up">Tạo tài khoản mới miễn phí <a href="http://localhost:8080/doSignUp">tại đây</a></p>
        </div>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.1.1.min.js">
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"
        integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+"
        crossorigin="anonymous"></script>
<script src="js/general.js"></script>

</body>

</html>