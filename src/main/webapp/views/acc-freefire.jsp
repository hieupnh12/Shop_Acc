<%-- 
    Document   : acc-freefire
    Created on : Mar 1, 2025, 3:18:56 PM
    Author     : MSI2022
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section id="free-fire" class="section">
    <h2 class="section-title text-center mb-5 mt-5">
        FREE FIRE
    </h2>
    <div class="container">
        <div class="row">         
            <c:forEach  begin="1" end="4" var="i" > 
                <div class="col-md-3"> 
                    <div class="card">
                        <a href="details.jsp">
                            <img src="https://shopnamblue.com/tep-tin/22447907842.gif" class="card-img-top" alt="...">
                        </a>
                        <div class="card-body">
                            <h5 class="card-title">Nick FF Pro</h5>
                            <p class="card-text">Tài khoản Free Fire với nhiều vật phẩm cực hiếm.</p>
                        </div>
                        <div class="card-body d-flex justify-content-center gap-5">
                        <a href="details.jsp" class="btn btn-danger">XEM NGAY</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
