<%-- 
    Document   : acc-lien-quan
    Created on : Mar 1, 2025, 3:18:40 PM
    Author     : MSI2022
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section id="lien-quan" class="section" >
    <h2 class="section-title text-center">
        LIEN QUAN Mobile
    </h2>
    <div class="container">
        <div class="row">                   
            <c:forEach  begin="1" end="4" var="i" > 
                <div class="card col-md-3">
                    <a href="details.jsp" >
                        <img src="//cdn3.upanh.info/upload/server-sw3/images/Qu%E1%BB%91c%20t%E1%BA%BF%20ph%E1%BB%A5%20n%E1%BB%AF/Nick/Nick%20Lien%20Quan%20Vip.png" class="card-img-top" alt="...">
                    </a>
                    <div class="card-body">
                        <h5 class="card-title">Nick LQ Pro</h5>
                        <p class="card-text">Tài khoản Liên Quân mạnh mẽ với nhiều tướng hiếm.</p>
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">Tướng</li>
                        <li class="list-group-item">Skin</li>
                        <li class="list-group-item">Rank Cao</li>
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
