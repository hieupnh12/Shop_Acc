<%-- 
    Document   : acc-freefire
    Created on : Mar 1, 2025, 3:18:56 PM
    Author     : MSI2022
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section id="free-fire" class="section">
    <h2 class="section-title text-center">
        FREE FIRE
    </h2>
    <div class="container">
        <div class="row">         
            <c:forEach  begin="1" end="4" var="i" > 
                <div class="card col-md-3">
                    <a href="details.jsp" >
                    <img src="https://shopnamblue.com/tep-tin/22447907842.gif" class="card-img-top" alt="...">
                    </a>
                    <div class="card-body">
                        <h5 class="card-title">Nick FF Pro</h5>
                        <p class="card-text">Tài khoản Free Fire với nhiều vật phẩm cực hiếm.</p>
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">Trang phục</li>
                        <li class="list-group-item">Skin Súng</li>
                        <li class="list-group-item">Rank Huyền Thoại</li>
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
