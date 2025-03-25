<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/tablib.jsp" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">


<style>
    .custom-border-radius {
        border-radius: 5px; /* Làm tròn góc */
        padding: 5px 10px; /* Tạo khoảng cách nội dung với viền */
        background-color: #f8f9fa; /* Màu nền nhẹ để nhìn rõ hơn */
        border: 1px solid #777777; /* Viền nhẹ */
        width: 160PX;
    }
    .dropdown-menu {
        left: auto !important;
        right: 0 !important;
    }
</style>
<nav class="navbar navbar-expand-lg bg-body-tertiary fixed-top sticky-top mb-3">
    <div class="container px-3">
        <a class="navbar-brand" href="#">
            <img src="https://s3.hcm-1.cloud.cmctelecom.vn/bannick/photos/shares/ban-nick-game/logo-shop-hong-an/logo-shop-game-hong-an.gif" alt="Logo" height="40">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="<%= request.getContextPath()%>/">Home</a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Danh mục
                    </a>

                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="nick-lien-quan.jsp">Nick Liên Quân</a></li>
                        <li><a class="dropdown-item" href="nick-pubg.jsp">Nick pubg</a></li>          
                        <li><a class="dropdown-item" href="nick-freefire.jsp">Nick frefire</a></li>          
                        <li><a class="dropdown-item" href="nick-ninja.jsp">Nick ninja  </a></li>
                        <li><a class="dropdown-item" href="#">Dịch vụ game </a></li>

                    </ul>
                <li class="nav-item">
                    <a class="nav-link" href="#">Lịch sử giao dịch</a>
                </li>
            </ul>

            <div class="me-3"><jsp:include page="/views/payment.jsp"/></div>
            <c:if test="${sessionScope.account == null}">
                <a class="navbar-brand" href="login">
                    <img src="IMAGE/profile.svg" alt="Logo" height="40">
                </a>                            
            </c:if>
            <c:if test="${sessionScope.account != null}">
                <nav class="navbar navbar-expand navbar-light bg-light "  >
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle  custom-border-radius" href="#" id="userDropdown" role="button"
                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">ID:${sessionScope.account.userId}</span>  
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionScope.account.balance} VND</span>
                                <!--                                <img class="img-profile rounded-circle" src="IMAGE/profile.svg">-->
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                 aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="<%=request.getContextPath()%>/waiting">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Settings
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="<%=request.getContextPath()%>/logout">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>
                    </ul>
                </nav>
            </c:if>


            <a href="cart.html" class="fa-regular fa-heart btn btn-light ms-2 border border-danger position-relative "
               style="transition: 0.5s; color: #FF9999;"
               onmouseover="this.style.color = '#FFE6EB'; this.style.backgroundColor = '#FF3333';"
               onmouseout="this.style.color = '#FF9999'; this.style.backgroundColor = 'white';">
                <span class="badge bg-danger position-absolute top-0 start-100 translate-middle rounded-pill">0</span>
            </a>


        </div>
    </div>
</nav>



<script>
//    document.addEventListener("DOMContentLoaded", function () {
//        let dropdown = document.querySelector(".nav-item.dropdown");
//
//        dropdown.addEventListener("mouseenter", function () {
//            let menu = this.querySelector(".dropdown-menu");
//            menu.classList.add("show");
//        });
//
//        dropdown.addEventListener("mouseleave", function () {
//            let menu = this.querySelector(".dropdown-menu");
//            menu.classList.remove("show");
//        });
//    });
</script>
<!-- Include jQuery and Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>

