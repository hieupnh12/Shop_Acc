<%-- 
    Document   : lsgiaodich
    Created on : Mar 17, 2025, 4:20:02 PM
    Author     : hieup
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .sidebar-menu {
                padding: 15px;
                border-right: 2px solid #00a5b5;
            }
            .sidebar-title {
                font-size: 18px;
                font-weight: bold;
                color: #333;
                margin: 10px 0;
                border-left: 3px solid #00a5b5;
                padding-left: 10px;
            }
            .side-m a {
                text-decoration: none;
                color: #333;
                font-size: 16px;
                padding: 5px 10px;
                display: block;
                border-radius: 5px;
                transition: 0.3s;
            }
            .side-m a:hover {
                background-color: #00a5b5;
                color: white;
            }
            .side-m .active {
                font-weight: bold;
                color: #00a5b5;
            }
            @media (max-width: 768px) {
                .sidebar-menu {
                    border-right: none;
                    border-bottom: 2px solid #00a5b5;
                    padding-bottom: 15px;
                }
            }
        </style>
    </head>
    <body>
        <jsp:include page="/common/menu.jsp"/>
        <!-- Sidebar -->
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-12">
                    <div class="sidebar-menu">
                        <div class="sidebar-title">Menu tài khoản</div>
                        <ul class="list-group side-m">
                            <li class="list-group-item"><a href="<%= request.getContextPath()%>/user/home">Thông tin tài khoản</a></li>
                        </ul>
                        <div class="sidebar-title">Hướng dẫn</div>
                        <ul class="list-group side-m">
                            <li class="list-group-item"><a href="<%= request.getContextPath()%>/views/user/huongdan.jsp">Cú pháp</a></li>
                        </ul>
                        <div class="sidebar-title">Lịch sử</div>
                        <ul class="list-group side-m">
                            <li class="list-group-item"><a href="<%= request.getContextPath()%>/user/historytrans">Lịch sử giao dịch</a></li>
                            <li class="list-group-item"><a href="<%= request.getContextPath()%>/user/historybuynick" >Lịch sử mua nick</a></li>
                            <li class="list-group-item"><a href="<%= request.getContextPath()%>/user/historyservice" class="active">Lịch sử dịch vụ</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-8 col-12 mt-4">
                    <!-- Tiêu đề -->
                    <h2 class="fw-bold text-uppercase text-success">DỊCH VỤ ĐÃ MUA</h2>
                    
                    <!-- Bảng dữ liệu -->
                    <div class="table-responsive">
                        <table class="table table-striped text-center table-hover table-sm">
                            <thead class="table-success">
                                <tr>
                                    <th>Mã Số</th>
                                    <th>Tên Dịch Vụ</th>
                                    <th>Giá</th>
                                    <th>Ngày mua</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <b style="color:red">${sessionScope.account.userId}</b>
                                    </td>
                                    <td>
                                        ${sessionScope.account.email}
                                    </td>
                                    <td>500,000 VND</td>
                                    <td>
                                        ${sessionScope.account.create_Date}
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>


                </div>
            </div>
        </div>
        <%@include file="/common/scripts.jsp" %>
    </body>
</html>
