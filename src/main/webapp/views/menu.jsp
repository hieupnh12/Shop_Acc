<%-- 
    Document   : header
    Created on : Feb 23, 2025, 12:57:06 PM
    Author     : MSI2022
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg bg-body-tertiary fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <img src="https://s3.hcm-1.cloud.cmctelecom.vn/bannick/photos/shares/ban-nick-game/logo-shop-hong-an/logo-shop-game-hong-an.gif" alt="Logo" height="40">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="home.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">contact us</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Danh muc
                    </a>

                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="nick-lien-quan.jsp">Nick Liên Quân</a></li>
                        <li><a class="dropdown-item" href="nick-pubg.jsp">Nick pubg</a></li>          
                        <li><a class="dropdown-item" href="nick-freefire.jsp">Nick frefire</a></li>          
                        <li><a class="dropdown-item" href="nick-ninja.jsp">Nick ninja  </a></li>
                        <li><a class="dropdown-item" href="#">Dịch vụ game </a></li>

                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="product_manager.jsp">Product Manger</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Admin</a>
                </li>
            </ul>
            <form class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
            <a href="#" class="btn btn-light fw-bold" style="color: orange;" data-bs-toggle="modal" data-bs-target="#napTienModal">
                Nạp Tiền
            </a>
            <jsp:include page="payment.jsp"></jsp:include>
            <a class="navbar-brand" href="login.jsp">
                <img src="../IMAGE/profile.svg" alt="Logo" height="40">
            </a>
            <a href="cart.html" class="btn btn-light ms-2">🛒 <span class="badge bg-danger">0</span></a>
        </div>
    </div>
</nav>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        let dropdown = document.querySelector(".nav-item.dropdown");

        dropdown.addEventListener("mouseenter", function () {
            let menu = this.querySelector(".dropdown-menu");
            menu.classList.add("show");
        });

        dropdown.addEventListener("mouseleave", function () {
            let menu = this.querySelector(".dropdown-menu");
            menu.classList.remove("show");
        });
    });
</script>



