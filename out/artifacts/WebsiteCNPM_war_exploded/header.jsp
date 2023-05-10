<%@ page import="bean.*" %>
<%@ page import="services.*" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<ul class="nav nav-page">
    <li class=" left">
        <a href="/homepage"><img src="images/logo/logo-rmbg1.png" alt=""></a>
    </li>


    <li class="nav-item center" id="nav-items">

        <a class="nav-link  " id="sanpham"
           href="http://localhost:8080/listProduct">Sản
            Phẩm</a>
        <a class="nav-link  " id="go"
           href="http://localhost:8080/listProduct">Gỗ</a>
        <a class="nav-link  " id="gom"
           href="http://localhost:8080/listProduct">Gốm</a>
        <a class="nav-link "
           href="http://localhost:8080/listProduct">Tranh</a>
        <a class="nav-link  "
           href="http://localhost:8080/listProduct">Giảm
            giá</a>

    </li>
    <li class=" right">
        <div class="item-right search-item">

            <input type="text" class="search-input" placeholder="Tìm kiếm..."
                   name="txName" value=""/>
            <span class="icon" id="search">
                <i class=" fa fa-search" name="action"></i>
            </span>
        </div>


        <% User user = UserService.getInstance().getUserById(1);
        request.getSession().setAttribute("user", user);
            List<Detail> cart = CartService.getInstance().getCartOfUser(user.getId());
//            if (user != null) {

        %>
        <a href="/cart" class="item-right"><i
                class="fa-solid fa-cart-shopping"></i>
            <p>Giỏ hàng </p>
        </a>
        <a href="/userProfile" class="item-right">
            <img src="images/userNull.png" alt="">
            <a href="http://localhost:8080/homepage" class="item-right">
                <p><%=user.getName()%>
                </p>
            </a>
        </a>
        <%--        <%} else {%>--%>
        <%--        <a href="/http://localhost:8080/doLogin" class="item-right"><i--%>
        <%--                class="fa-solid fa-cart-shopping"></i>--%>
        <%--            <p>Giỏ hàng</p>--%>
        <%--        </a>--%>
        <%--        <a href="http://localhost:8080/doLogin" class="item-right">--%>
        <%--            <i class="fa-solid fa-user"></i>--%>
        <%--            <p>Đăng nhập</p>--%>
        <%--        </a>--%>
        <%--        <%}%>--%>


    </li>
</ul>