<%-- 
    Document   : lsgiaodich
    Created on : Mar 17, 2025, 4:20:02 PM
    Author     : hieup
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                            <li class="list-group-item"><a href="<%= request.getContextPath()%>/user/historytrans" class="active">Lịch sử giao dịch</a></li>
                            <li class="list-group-item"><a href="<%= request.getContextPath()%>/user/historybuynick">Lịch sử mua nick</a></li>
                            <li class="list-group-item"><a href="<%= request.getContextPath()%>/user/historyservice">Lịch sử dịch vụ</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-8 col-12 mt-4">
                    <div class="sidebar-center">
                        <h2 class="fw-bold text-uppercase text-success">LỊCH SỬ GIAO DỊCH</h2>
                        <table class="table table-striped text-center table-hover table-sm">
                            <thead class="table-success">
                                <tr class="border border-3 border-danger">
                                    <th>Số tiền trước</th>
                                    <th>Số tiền thay đổi</th>
                                    <th>Số tiền sau</th>
                                    <th>Lý do</th>
                                    <th>Thời gian</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="log" items="${logs}">
                                    <tr>
                                        <td>${log.soTienTruoc}</td>
                                        <td>${log.soTienThayDoi}</td>
                                        <td>${log.soTienSau}</td>
                                        <td>${log.reason}</td>
                                        <td>${log.createDate}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
                        
                        
        <c:if test="${not empty sessionScope.notification}">
            <!-- Lớp phủ làm mờ nền -->
            <div id="overlay"></div>
            <!-- Hộp thông báo hiển thị ở giữa màn hình -->
            <div id="notification-container">
                <div class="notification-box">
                    <h4>Thông báo</h4>
                    <p><c:out value="${sessionScope.notification}" /></p>
                    <button id="close-btn" class="btn btn-primary">Đóng</button>
                </div>
            </div>

            <c:remove var="notification" scope="session" />

            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    let notificationBox = document.getElementById("notification-container");
                    let overlay = document.getElementById("overlay");
                    let closeBtn = document.getElementById("close-btn");

                    // Tự động ẩn sau 5 giây
                    setTimeout(() => {
                        notificationBox.style.display = "none";
                        overlay.style.display = "none";
                    }, 5000);

                    // Ẩn khi bấm nút Đóng
                    closeBtn.addEventListener("click", function () {
                        notificationBox.style.display = "none";
                        overlay.style.display = "none";
                    });
                });
            </script>

            <style>
                /* Lớp phủ mờ nền */
                #overlay {
                    position: fixed;
                    top: 0;
                    left: 0;
                    width: 100%;
                    height: 100%;
                    background: rgba(0, 0, 0, 0.5); /* Màu nền mờ */
                    z-index: 998;
                }

                /* Hộp thông báo */
                #notification-container {
                    position: fixed;
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%, -50%);
                    background: white;
                    padding: 20px;
                    border-radius: 8px;
                    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
                    text-align: center;
                    z-index: 999;
                    width: 300px;
                }

                .notification-box h4 {
                    margin-bottom: 10px;
                }

                .notification-box p {
                    margin-bottom: 15px;
                }
            </style>
        </c:if>

        <%@include file="/common/scripts.jsp" %>
    </body>
</html>
