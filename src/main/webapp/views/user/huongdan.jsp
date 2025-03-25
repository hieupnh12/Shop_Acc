<%-- 
    Document   : lsgiaodich
    Created on : Mar 17, 2025, 4:20:02 PM
    Author     : hieup
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                            <li class="list-group-item"><a href="<%= request.getContextPath()%>/views/user/huongdan.jsp" class="active">Cú pháp</a></li>
                        </ul>
                        <div class="sidebar-title">Lịch sử</div>
                        <ul class="list-group side-m">
                            <li class="list-group-item"><a href="<%= request.getContextPath()%>/user/historytrans">Lịch sử giao dịch</a></li>
                            <li class="list-group-item"><a href="<%= request.getContextPath()%>/user/historybuynick" >Lịch sử mua nick</a></li>
                            <li class="list-group-item"><a href="<%= request.getContextPath()%>/user/historyservice" >Lịch sử dịch vụ</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-8 col-12 mt-4">

                    <!--<div class="sidebar-center">-->
                        <h2 class="fw-bold text-uppercase text-success">CÚ PHÁP TIN NHẮN NINJA</h2>
                        <h3 class="sidebar-title" style="padding-left:15px;">Hướng Dẫn Chuyển Sim Đăng Ký</h3>
                        <p><b>• Lấy mã số chuyển sim:</b></p>
                        <p>- Dùng sim đăng ký soạn: <b style="color:red">GO SIMCU TK MK</b> gửi <b style="color:#09F">6020</b></p>
                        <p><b>• Chuyển sim đăng ký.</b></p>
                        <p>- Dùng sim  mới soạn: <b style="color:red">GO SIMMOI TK MCS</b> gửi <b style="color:#09F">6020</b></p>
                        <p><b>Ví dụ:</b> GO SIMMOI voheer 4119 gửi <span style="color:#09F"><b>6020</b></span> (voheer là tài khoản 4119 là mcs)</p>
                        <p>+ Trong đó MCS là mã PIN gồm 4 số mà hệ thống gửi về.</p>
                        <p>+ Mã MCS có thời hạn sử dụng trong 48h, sau 48h mã không có tác dụng.</p>
                        <p>+ SIMCU SIMMOI là chữ không phải sđt nhiều bạn nhầm.</p>
                        <center><img src="https://shopnick.vn/img/chuyen-sim.jpg"></center><p></p>
                        <h3 class="sidebar-title" style="padding-left:15px;">Hướng Dẫn Lấy Lại Mã Bảo Vệ</h3>
                        <p>- Dùng sim đăng ký soạn: <b style="color:red">GO MR TK</b> gửi <b style="color:#09F">6020</b></p>
                        <p>- Hệ thống sẽ trả về cho bạn mã bảo vệ của cả 5 server(mã bảo vệ của sv tessen có thế dùng cho sv katana).</p>
                        <h3 class="sidebar-title" style="padding-left:15px;">Hướng Dẫn Lấy Lại Mật Khẩu</h3>
                        <p>- Dùng sim đăng ký soạn: <b style="color:red">GO LMK TK</b> gửi <b style="color:#09F">6020</b></p>
                        <p>- Hệ thống sẽ trả về  mật khẩu mới cho bạn.</p>
                    <!--</div>-->


                </div>
            </div>
        </div>
        <%@include file="/common/scripts.jsp" %>
    </body>
</html>
