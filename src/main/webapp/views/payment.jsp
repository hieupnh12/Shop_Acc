
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<a class="btn btn-warning py-2 px-4 text-white" data-bs-toggle="modal" data-bs-target="#napTienModal">
    Nạp Tiền
</a>

<!-- Modal -->
<div class="modal fade mt-5" id="napTienModal" tabindex="-1" aria-labelledby="napTienLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header border-0">
                <h5 class="modal-title w-100 text-warning fw-bold text-center">Nạp tiền</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <!-- Tabs -->
                <ul class="nav nav-tabs justify-content-center mb-3">
                    <li class="nav-item">
                        <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#thecao">Nạp thẻ cào</button>
                    </li>
                    <li class="nav-item">
                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#atm" id="atmButton">ATM tự động</button>                    </li>
                </ul>

                <div class="tab-content">
                    <!-- Tab Nạp thẻ cào -->
                    <div class="tab-pane fade show active" id="thecao">
                        <div class="row g-3">
                            <!-- Chọn mệnh giá -->
                            <div class="col-12 col-md-6">
                                <label class="form-label">Chọn mệnh giá</label>
                                <div class="d-flex flex-wrap gap-2">
                                    <% int[] menhGia = {10000, 20000, 30000, 50000, 100000, 200000, 300000, 500000, 1000000}; %>
                                    <% for (int mg : menhGia) {%>
                                    <button type="button" class="btn btn-outline-secondary"><%= mg%><br><small>Nhận 100%</small></button>
                                            <% }%>
                                </div>
                            </div>
                            <!-- Nhập thông tin thẻ -->
                            <div class="col-12 col-md-6">
                                <form>
                                    <div class="mb-3">
                                        <label class="form-label">Nhà cung cấp</label>
                                        <select class="form-select">
                                            <option>VIETTEL</option>
                                            <option>MOBIFONE</option>
                                            <option>VINAPHONE</option>
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Mã số thẻ</label>
                                        <input type="text" class="form-control" placeholder="Nhập mã số thẻ">
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Số sê-ri</label>
                                        <input type="text" class="form-control" placeholder="Nhập số sê-ri">
                                    </div>
                                    <div class="mb-3 d-flex align-items-center">
                                        <input type="text" class="form-control me-2" placeholder="Mã bảo vệ">
                                        <span class="text-danger fw-bold fs-4">371</span>
                                    </div>
                                    <p class="text-danger small">* Nạp sai mệnh giá mất 100% giá trị thẻ.</p>
                                    <button type="submit" class="btn btn-warning w-100 fw-bold text-white">Đăng Nhập</button>
                                </form>
                            </div>
                        </div>
                    </div>

                    <!-- Tab ATM -->
                    <div class="tab-pane fade" id="atm">
                        <div class="row">
                            <!-- Thông tin tài khoản -->
                            <div class="col-12 col-md-6">
                                <h6>Thông tin tài khoản ngân hàng</h6>
                                <p><strong>Chủ tài khoản:</strong> NGUYEN MINH HIEU</p>
                                <ul class="list-group">
                                    <li class="list-group-item d-flex justify-content-between">
                                        <span>MB Bank</span> <span class="fw-bold">0395710052</span>
                                    </li>
                                </ul>
                                <c:choose>
                                    <c:when test="${not empty account and not empty account.userId}">
                                        <p class="mt-3"><strong>Nội dung chuyển tiền:</strong> 
                                            <span class="text-danger">nap${account.userId}</span>
                                        </p>
                                    </c:when>
                                    <c:otherwise>
                                        <p class="text-danger">Lỗi: Không tìm thấy thông tin tài khoản hoặc userId!</p>
                                    </c:otherwise>
                                </c:choose>

                                <p class="text-muted">Sẽ được cộng trong 30s</p>
                            </div>

                            <!-- Phần hiển thị QR -->
                            <div class="col-12 col-md-6 text-center">
                                <c:choose>

                                    <c:when test="${not empty account and not empty account.userId}">
                                        <h6>Chuyển khoản hoặc quét mã QR</h6>
                                        <form action="${pageContext.request.contextPath}/CreateQRPayment" method="POST">
                                            <input type="hidden" name="userId" value="${account.userId}">
                                            <button type="submit" id="atmButton" class="btn btn-primary">Tạo Link thanh toán</button>
                                        </form>
                                        <p id="qrLoading" style="display: none;">Đang tạo mã QR...</p>
                                    </c:when>
                                    <c:otherwise>
                                        <p class="text-danger">Lỗi: Không tìm thấy thông tin tài khoản hoặc userId!</p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div> <!-- End ATM -->
                </div>
            </div>
        </div>
    </div>
</div>



<!-- Fix lỗi modal không thao tác được -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        var modalElement = document.getElementById("napTienModal");
        var modalInstance = new bootstrap.Modal(modalElement);

        // Mở modal bằng JavaScript khi nhấn nút
        document.getElementById("openModalBtn")?.addEventListener("click", function () {
            modalInstance.show();
        });

        // Khi modal ẩn, đảm bảo backdrop được xóa
        modalElement.addEventListener("hidden.bs.modal", function () {
            document.querySelectorAll(".modal-backdrop").forEach(function (backdrop) {
                backdrop.remove();
            });
            document.body.classList.remove("modal-open"); // Loại bỏ class modal-open nếu còn sót
            document.body.style.overflow = "auto"; // Tránh khóa cuộn trang
        });
    });

    document.querySelector("form").addEventListener("submit", () => {
        document.getElementById("qrLoading").style.display = "block";
    });



</script>

<style>
    /* Đảm bảo modal hiển thị trên nền */
    .modal-backdrop {
        display: none !important;
    }
</style>
