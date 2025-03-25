<%-- 
    Document   : lsgiaodich
    Created on : Mar 17, 2025, 4:20:02 PM
    Author     : hieup
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/tablib.jsp" %>
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
            .table td {
                max-width: 150px; /* Giới hạn độ rộng cột */
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap; /* Không xuống dòng */
            }
            .table-responsive {
                overflow-x: auto;
                max-width: 100%;
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
                            <li class="list-group-item"><a href="<%= request.getContextPath()%>/user/historybuynick" class="active">Lịch sử mua nick</a></li>
                            <li class="list-group-item"><a href="<%= request.getContextPath()%>/user/historyservice">Lịch sử dịch vụ</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-8 col-12 mt-4">
                    <!-- Tiêu đề -->
                    <h2 class="fw-bold text-uppercase text-success">Nick Đã Mua</h2>

                    <!-- Thông báo -->
                    <div class="alert alert-info">
                        Sau khi mua nick ninja bạn khoan hãy đổi mật khẩu, đợi admin dùng mật khẩu để lấy mã chuyển sim rồi cập nhật tại đây sau đó bạn có thể đổi mật khẩu.
                        <br><br>
                        Đổi mật khẩu: <a href="#" class="fw-bold text-primary">Tại đây</a>
                        <br>
                        Hướng dẫn chuyển sim: <a href="<%= request.getContextPath()%>/views/user/huongdan.jsp" class="fw-bold text-primary">Xem hướng dẫn</a>
                    </div>

                    <!-- Lọc dữ liệu -->
                    <div class="row g-2 align-items-center mb-3">
                        <!-- Chọn hình thức -->
                        <div class="col-12 col-md-auto">
                            <label class="fw-bold">Chọn hình thức:</label>
                        </div>
                        <div class="col-12 col-sm-6 col-md-auto">
                            
                            <form id="filterForm" action="FilterNickServlet" method="get">
                                <select class="form-select" name="ls-type-nick" onchange="this.form.submit()">
                                    <option value="all">Tất cả nick</option>
                                    <option value="1">Ninja</option>
                                    <option value="2">Liên quân</option>
                                    <option value="3">Free fire</option>
                                </select>
                            </form>
                            
                        </div>


                    </div>


                    <!-- Bảng dữ liệu -->
                    <div class="table-responsive">
                        <table class="table table-striped text-center table-hover table-sm">
                            <thead class="table-success">
                                <tr>
                                    <th>Mã Số</th>
                                    <th>Tài Khoản</th>
                                    <th>Mật Khẩu</th>
                                    <th>MCS</th>
                                    <th>Server</th>
                                    <th>Giá</th>
                                    <th>Ngày mua</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach begin="1" end="4" var="i"> 
                                    <tr>
                                        <td class="text-truncate">
                                            <b style="color:red">${sessionScope.account.userId}</b>
                                        </td>
                                        <td class="text-truncate d-inline-block w-100">
                                            ${sessionScope.account.email}
                                        </td>
                                        <td>********</td>
                                        <td class="text-truncate d-inline-block w-100">
                                            123456
                                        </td>
                                        <td>VN01</td>
                                        <td>500,000 VND</td>
                                        <td class="text-truncate d-inline-block w-100">
                                            ${sessionScope.account.create_Date}
                                        </td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                    </div>


                </div>
            </div>
        </div>
        <%@include file="/common/scripts.jsp" %>
    </body>
</html>
