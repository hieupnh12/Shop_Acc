<%-- 
    Document   : index
    Created on : Mar 2, 2025, 4:02:57 PM
    Author     : hieup
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="common/tablib.jsp" %>
<!DOCTYPE html>
<html>
    <%@include file="common/headlib.jsp" %>
    <body style="background-color: #ECECEC;">
        <%@include file="common/menu.jsp" %>
        
        <%@include file="views/banner.jsp" %>
        
        <%@include file="views/body-dichvu.jsp" %>
        
        <jsp:include page="/common/chatbot_component.jsp"/>

        <%@include file="common/footer.jsp" %>
        
        <%@include file="common/scripts.jsp" %>
    </body>
</html>
