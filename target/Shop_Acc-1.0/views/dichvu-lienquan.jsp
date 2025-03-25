<%-- 
    Document   : acc-lien-quan
    Created on : Mar 1, 2025, 3:18:40 PM
    Author     : MSI2022
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section id="lien-quan" class="container section bg-white py-5 content-body-each-part mt-5">
    <h2 class="section-title text-center mb-5">
        LIÊN QUÂN MOBILE
    </h2>
    <div class="container">
        <div class="row">                   
            <c:forEach begin="1" end="4" var="i"> 
                <div class="col-md-3 mb-4"> 
                    <div class="card card-hover shadow-sm">
                        <a href="details.jsp">
                            <img src="//cdn3.upanh.info/upload/server-sw3/images/Qu%E1%BB%91c%20t%E1%BA%BF%20ph%E1%BB%A5%20n%E1%BB%AF/Nick/Nick%20Lien%20Quan%20Vip.png" class="card-img-top" alt="...">
                        </a>
                        <div class="card-body text-center">
                            <h5 class="card-title">Nick FF Pro</h5>
                            <p class="card-text">Tài khoản Free Fire với nhiều vật phẩm cực hiếm.</p>
                        </div>
                        <div class="card-body d-flex justify-content-center">
                            <a href="details.jsp" class="btn btn-gradient">XEM NGAY</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
