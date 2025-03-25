<%-- 
    Document   : adminPage
    Created on : Mar 8, 2025, 6:14:40 AM
    Author     : Admin
--%>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html lang="vi">
    <%@include file="/common/headlib.jsp" %>
  <body id="page-top" class="d-flex flex-column min-vh-100">
        <jsp:include page="/common/menu.jsp"></jsp:include>
        <div>
             <jsp:include page="/views/admin/BodyAdmin.jsp"></jsp:include>   
        </div>
        <jsp:include page="/common/footer.jsp"></jsp:include>
        <%@include file="/common/scripts.jsp" %>
    </body>
</html>


