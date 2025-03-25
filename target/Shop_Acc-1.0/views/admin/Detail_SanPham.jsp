<%-- 
    Document   : Detail_SanPham
    Created on : Mar 9, 2025, 9:52:52 PM
    Author     : Admin
--%>

<%-- 
    Document   : Detail_DanhMuc
    Created on : Mar 9, 2025, 8:52:56 PM
    Author     : Admin
--%>






    <%@page contentType="text/html" pageEncoding="UTF-8"%>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>



<div class="container pt-2"  style=" background-color:#F7F8FD;  ">
        <h2 class="mb-3">Quản lý danh mục</h2>
        <div class="d-flex justify-content-end">
            <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#createCategoryModal">+ Tạo mới</button>
        </div>


    <table class="table table-bordered">
        <thead class="table-light">
            <tr>
                <th>STT</th>
                <th>ảnh chính</th>
                <th>tên sản phẩm </th>
                <th>danh mục</th>
                <th>giá tiền</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody id="categoryTable">
            <tr>
                <td>1</td>
                <td>liên quân</td>
                <td>Account</td>
                <td>không biết</td>
                <td>hiển thị </td>
                <td>
                    <button class="btn btn-sm btn-primary">✏️</button>
                    <button class="btn btn-sm btn-danger">🗑️</button>
                </td>
            </tr>       
        </tbody>
    </table>
</div>



<nav aria-label="Page navigation example">
  <ul class="pagination d-flex justify-content-center">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>



<!-- Modal tạo danh mục -->
<div class="modal fade" id="createCategoryModal" tabindex="-1" aria-labelledby="modalTitle" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalTitle">Thêm sản phẩm mới</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3">
                    <label class="form-label">Tên sản phẩm <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="nameProduct" placeholder="Tên sản phẩm ">
                </div>
                <div class="mb-3">
                    <label class="form-label">hình ảnh chính</label>
                     <input type="text" class="form-control" id=" " placeholder="url hình ảnh">
                </div>
                <div class="mb-3">
                    <label class="form-label">hình ảnh phụ</label>
                     <input type="text" class="form-control" id="imagePhu" placeholder="url hình ảnh">
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label class="form-label">Trạng thái</label>
                        <select class="form-control" id="statusInput">
                            <option>Hiển thị</option>
                            <option>Ẩn</option>
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Danh mục hot</label>
                        <select class="form-control">
                            <option>Chọn danh mục hot</option>
                        </select>
                    </div>
                </div>
                <div class="mb-3">
                    <label class="form-label">giá tiền </label>
                     <input type="text" class="form-control" id="priceProduct" placeholder="VND">
                </div>
                <div class="mb-3">
                    <label class="form-label">Kiểu danh mục</label>
                    <select class="form-control" id="typeInput">
                        <option>Sản phẩm</option>
                        <option>Dịch vụ</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label class="form-label">Mô tả</label>
                    <textarea class="form-control" id="descriptionInput" placeholder="Mô tả ..."></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-primary" onclick="addCategory()">Lưu</button>
            </div>
        </div>
    </div>
</div>

<script src="script.js"></script>
<script>
document.addEventListener("DOMContentLoaded", function () {
    // Dữ liệu mẫu
    const sampleData = [
        { id: 1, name: "Badge", parent: "Phụ Kiện", type: "Sản phẩm", status: "Hiển thị" },
        { id: 2, name: "Áo thun", parent: "Thời Trang", type: "Sản phẩm", status: "Hiển thị" },
        { id: 3, name: "Dịch vụ sửa chữa", parent: "Dịch Vụ", type: "Dịch vụ", status: "Ẩn" }
    ];

    const tableBody = document.getElementById("categoryTable");

    sampleData.forEach((item) => {
        const row = document.createElement("tr");
        row.innerHTML = `
            <td>${item.id}</td>
            <td>${item.name}</td>
            <td>${item.parent}</td>
            <td>${item.type}</td>
            <td>${item.status}</td>
            <td>
                <button class="btn btn-sm btn-primary">✏️</button>
                <button class="btn btn-sm btn-danger">🗑️</button>
            </td>
        `;
        tableBody.appendChild(row);
    });
});
</script>











