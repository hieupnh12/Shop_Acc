<%-- 
    Document   : acc-ninja
    Created on : Mar 1, 2025, 3:19:18 PM
    Author     : MSI2022
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section id="ninja" class="section">
    <h2 class="section-title text-center">
        NINJA SCHOOL
    </h2>
    <div class="container">
        <div class="row">
            <c:forEach  begin="1" end="4" var="i" > 
                <div class="card col-md-3">
                    <a href="details.jsp" >
                    <img src="https://res.cloudinary.com/dtzzljfzx/image/upload/v1737348284/nubagame/c3do3pnjp7uivnsgamvl.gif" class="card-img-top" alt="...">
                    </a>
                 <div class="card-body">
                        <h5 class="card-title">Nick NINJA VIP</h5>
                        <p class="card-text">Tài khoản FULL XU.</p>
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">Máy chủ</li>
                        <li class="list-group-item">Lớp</li>
                        <li class="list-group-item">Cấp độ</li>
                    </ul>
                    <div class="price text-center">18.000 </div>
                    <div class="card-body d-flex justify-content-center gap-5">
                        <a href="details.jsp" class="btn btn-pink">Mua</a>
                        <a href="#" class="btn btn-pink">Thêm</a>
                    </div>
                </div>  
            </c:forEach>
        </div>
    </div>
</section>
