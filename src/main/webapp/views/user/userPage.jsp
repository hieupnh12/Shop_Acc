
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/tablib.jsp" %>
<!DOCTYPE html>
<html>
    <%@include file="/common/headlib.jsp" %>
    <body>
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
        <jsp:include page="/common/menu.jsp"/>
        <!-- Sidebar -->
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-12">
                    <div class="sidebar-menu">
                        <div class="sidebar-title">Menu tài khoản</div>
                        <ul class="list-group side-m">
                            <li class="list-group-item"><a href="<%= request.getContextPath()%>/user/home" class="active">Thông tin tài khoản</a></li>
                        </ul>
                        <div class="sidebar-title">Hướng dẫn</div>
                        <ul class="list-group side-m">
                            <li class="list-group-item"><a href="<%= request.getContextPath()%>/views/user/huongdan.jsp">Cú pháp</a></li>
                        </ul>
                        <div class="sidebar-title">Lịch sử</div>
                        <ul class="list-group side-m">
                            <li class="list-group-item"><a href="<%= request.getContextPath()%>/user/historytrans">Lịch sử giao dịch</a></li>
                            <li class="list-group-item"><a href="<%= request.getContextPath()%>/user/historybuynick">Lịch sử mua nick</a></li>
                            <li class="list-group-item"><a href="<%= request.getContextPath()%>/user/historyservice">Lịch sử dịch vụ</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-8 col-12 mt-4">
                    <div class="sidebar-center">
                        <h2 class="fw-bold text-uppercase text-success">THÔNG TIN TÀI KHOẢN</h2>
                        <table class="table table-striped">
                            <tbody>
                                <tr>
                                    <td><b>ID của bạn:</b></td>
                                    <td><b style="color:red">${sessionScope.account.userId}</b></td>
                                </tr>
                                <tr>
                                    <td><b>Tên tài khoản:</b></td>
                                    <td>${sessionScope.account.email}</td>
                                </tr>
                                <tr>
                                    <td><b>Số dư tài khoản:</b></td>
                                    <td>${sessionScope.account.balance}</td>
                                </tr>
                                <tr>
                                    <td><b>Số điện thoại:</b></td>
                                    <td>
                                        <b>${sessionScope.account.phone}</b>
                                        <a style="cursor:pointer; color: #20c6c6;" class="text-primary" data-bs-toggle="modal" data-bs-target="#updatePhoneModal">
                                            <b> Cập nhật</b>
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>Ngày tham gia:</b></td>
                                    <td>${sessionScope.account.create_Date}</td>
                                </tr>
                                <tr>
                                    <td><b>Mật khẩu:</b></td>
                                    <td>
                                        <a style="cursor:pointer; color: #20c6c6;" class="text-primary" data-bs-toggle="modal" data-bs-target="#changePasswordModal">
                                            <b>Đổi mật khẩu</b>
                                        </a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="changePasswordModal" tabindex="-1" aria-labelledby="changePasswordModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <!-- Tiêu đề có màu nền -->
                    <div class="modal-header text-white" style="background-color: #20c6c6;">
                        <h5 class="modal-title" id="changePasswordModalLabel">Đổi mật khẩu</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <!-- Nội dung form -->
                    <div class="modal-body">
                        <form action="<%= request.getContextPath()%>/user/home?type=1" method="POST">
                            <div class="mb-3">
                                <label for="oldPassword" class="form-label">Mật khẩu cũ</label>
                                <input type="password" class="form-control" id="oldPassword" name="oldPassword">
                            </div>
                            <div class="mb-3">
                                <label for="newPassword" class="form-label">Mật khẩu mới</label>
                                <input type="password" class="form-control" id="newPassword" name="newPassword">
                            </div>
                            <div class="mb-3">
                                <label for="confirmPassword" class="form-label">Nhập lại mật khẩu mới</label>
                                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword">
                            </div>
                            <button type="submit" class="btn btn-primary w-100" style="background-color: #20c6c6;">Xác nhận</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <!-- Modal thông báo -->
        <div class="modal fade" id="updatePhoneModalLabel" tabindex="-1" aria-labelledby="updatePhoneModalMessLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="updatePhoneModalMessLabel">${messagePhone}</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal for Updating Phone Number -->
        <div class="modal fade" id="updatePhoneModal" tabindex="-1" aria-labelledby="updatePhoneModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header text-white" style="background-color: #20c6c6;">
                        <h5 class="modal-title" id="updatePhoneModalLabel">Cập nhật số điện thoại</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <!-- Modal Body (Form) -->
                    <div class="modal-body">
                        <form id="updatePhoneForm" action="<%= request.getContextPath()%>/user/home?type=2" method="POST">
                            <div class="mb-3">
                                <label for="newPhoneNumber" class="form-label">Số điện thoại mới</label>
                                <input type="text" class="form-control" id="newPhoneNumber" name="newPhoneNumber" placeholder="Nhập số điện thoại" required>
                                <small id="phoneError" class="text-danger"></small>
                            </div>
                            <button type="submit" class="btn btn-primary w-100" style="background-color: #20c6c6;">Xác nhận</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script>
            document.getElementById("updatePhoneForm").addEventListener("submit", function (event) {
                event.preventDefault(); // Ngăn chặn form gửi ngay lập tức

                var phoneInput = document.getElementById("newPhoneNumber").value.trim();
                var phoneError = document.getElementById("phoneError");

                // Kiểm tra xem phần tử lỗi có tồn tại không
                if (phoneError)
                    phoneError.innerHTML = "";

                // Kiểm tra định dạng số điện thoại Việt Nam (bắt đầu bằng 0 hoặc +84, có 10 số)
                var phoneRegex = /^(0|\+84)[3-9][0-9]{8}$/;
                if (!phoneRegex.test(phoneInput)) {
                    if (phoneError)
                        phoneError.innerHTML = "Vui lòng nhập số điện thoại hợp lệ (VD: 0987654321 hoặc +84987654321)";
                    return;
                }

                // Hiển thị thông báo thành công


                // Đóng modal (chắc chắn rằng Bootstrap đã được tải đúng)
                var updatePhoneModal = document.getElementById('updatePhoneModal');
                if (updatePhoneModal) {
                    var modalInstance = bootstrap.Modal.getInstance(updatePhoneModal);
                    if (modalInstance) {
                        modalInstance.hide();
                    }
                }


                // Gửi form về server
                this.submit();

                // Reset form
                this.reset();

                setTimeout(function () {
                    updatePhoneModalLabel.hide();
                    location.reload();
                }, 500);
            });


            document.addEventListener("DOMContentLoaded", function () {
                var messageElement = document.getElementById("updatePhoneModalMessLabel");
                var messageText = messageElement.innerText.trim();
                var modal = new bootstrap.Modal(document.getElementById("updatePhoneModalLabel"));

                // Kiểm tra nếu có nội dung thì hiển thị modal, nếu không thì ẩn đi
                if (messageText) {
                    modal.show();
                    setTimeout(() => {
                        modal.hide();
                    }, 5000);
                } else {
                    // Nếu không có nội dung, đảm bảo modal luôn ẩn
                    document.getElementById("updatePhoneModalLabel").classList.remove("show");
                    document.getElementById("updatePhoneModalLabel").setAttribute("aria-hidden", "true");
                    document.getElementById("updatePhoneModalLabel").style.display = "none";
                }
            });

        </script>

        <%@include file="/common/scripts.jsp" %>
    </body>
</html>
