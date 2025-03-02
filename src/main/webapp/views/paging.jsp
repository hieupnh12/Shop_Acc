

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container mt-5">
    <nav>
        <ul class="pagination justify-content-center">
            <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">‹</a>
            </li>
            <c:forEach  begin="1" end="6" var="i" > 
                <li class="page-item ${i == 3?"active":""}">    
                    <a class="page-link" href="#">${i}</a>
                </li> 
            </c:forEach>
            <li class="page-item disabled"><a class="page-link" href="#">...</a></li>

            <li class="page-item">
                <a class="page-link" href="#">›</a>
            </li>
        </ul>
    </nav>
</div>
