<%-- 
    Document   : nick-lien-quan
    Created on : Mar 1, 2025, 2:56:17 PM
    Author     : MSI2022
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>shop acc uy tin</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="/CSS/menu.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="/common/menu.jsp"/>
        <section id="ninja" class="section">
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
                                    <a href="${pageContext.request.contextPath}/views/details.jsp" class="btn btn-pink">Mua Ngay</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>

        <jsp:include page="/common/footer.jsp"/>
    </script>
</body>
</html>

