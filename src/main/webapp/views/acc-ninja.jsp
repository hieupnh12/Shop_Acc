<%-- 
    Document   : acc-ninja
    Created on : Mar 1, 2025, 3:19:18 PM
    Author     : MSI2022
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section id="ninja" class="section">
    <h2 class="section-title text-center mb-5 mt-5">
        NINJA SCHOOL
    </h2>
    <div class="container">
        <div class="row">
            <c:forEach  begin="1" end="4" var="i" > 
                <div class="col-md-3"> 
                    <div class="card">
                        <a href="details.jsp">
                            <img src="https://res.cloudinary.com/dtzzljfzx/image/upload/v1737348284/nubagame/c3do3pnjp7uivnsgamvl.gif" class="card-img-top" alt="...">
                        </a>
                        <div class="card-body">
                            <h5 class="card-title">Nick NINJA VIP</h5>
                            <p class="card-text">Tài khoản FULL XU.</p>
                        </div>
                        <div class="card-body d-flex justify-content-center gap-5">
                            <a href="${pageContext.request.contextPath}/views/details.jsp" class="btn btn-pink">XEM NGAY</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
