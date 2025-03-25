<%-- 
    Document   : Dashboard
    Created on : Mar 8, 2025, 3:33:09 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="vi">
     <style>
         html, body {
             height: 100%;
             margin: 0;
             display: flex;
             flex-direction: column;
         }
         #wrapper{
             display: flex;
             width: 100%;
             margin-top: 85px;
             flex: 1; /* Đẩy phần còn lại của nội dung lên trên */
         }
     </style>
    <body id="page-top">
        <jsp:include page="/common/menu.jsp"></jsp:include>
        <div id="wrapper"> 
                 <div style="width: 15%" class=" h-100">
                 <jsp:include page="/views/admin/sidebar.jsp"></jsp:include>
                </div>
                <div style="width: 85%">
                    <jsp:include page="/views/admin/Detail_SanPham.jsp"></jsp:include>
                </div>
            </div>
         <jsp:include page="/common/footer.jsp"></jsp:include>
    </body>
</html>
