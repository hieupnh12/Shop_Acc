<%-- 
    Document   : Detail_DanhMuc
    Created on : Mar 9, 2025, 8:52:56 PM
    Author     : Admin
--%>




    <%@page contentType="text/html" pageEncoding="UTF-8"%>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<div class="container pt-2" style=" background-color:#F7F8FD;   " >
        <h2 class="mb-3">Quản lý danh mục</h2>
        <div class="d-flex justify-content-end">
            <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#createCategoryModal">+ Tạo mới</button>
        </div>


    <table class="table table-bordered">
        <thead class="table-light">
            <tr>
                <th>STT</th>
                <th>Tên danh mục</th>
                <th>Danh mục cha</th>
                <th>Kiểu danh mục</th>
                <th>Số lượng</th>
                <th>Trạng thái</th>
                <th>Hành động</th>
            </tr>
            
        </thead>
        <tbody >
            <tr>
                <td>1</td>
                <td>liên quân</td>
                <td>Account</td>
                <td>không biết</td>
                <td>300</td>
                <td>hiển thị </td>
                <td>
                    <button class="btn btn-sm btn-primary">✏️</button>
                    <button class="btn btn-sm btn-danger">🗑️</button>
                </td>
            </tr>
        </tbody>
    </table>
</div>

<!-- Form tạo mới danh mục -->
<div id="createForm" class="d-none container mt-3">
    <h3>Thêm danh mục mới</h3>
    <div class="mb-2">
        <label>Tên danh mục:</label>
        <input type="text" id="NameDanhMuc" class="form-control">
    </div>
    <div class="mb-2">
        <label>Danh mục cha:</label>
        <input type="text" id="parentDanhMuc" class="form-control">
    </div>
    <div class="mb-2">
        <label>Kiểu danh mục:</label>
        <select id="typeDanhMuc" class="form-control">
            <option>Sản phẩm</option>
            <option>Dịch vụ</option>
        </select>
    </div>
    <div class="mb-2">
        <label>Trạng thái:</label>
        <select id="statusDanhMuc" class="form-control">
            <option>Hiển thị</option>
            <option>Ẩn</option>
        </select>
    </div>
    <button class="btn btn-primary" onclick="addCategory()">Thêm</button>
    <button class="btn btn-secondary" onclick="closeCreateForm()">Hủy</button>
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
                <h5 class="modal-title" id="modalTitle">Thêm danh mục mới</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3">
                    <label class="form-label">Tên danh mục <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="nameInput" placeholder="Tên danh mục">
                </div>
                <div class="mb-3">
                    <label class="form-label">Danh mục cha</label>
                     <input type="text" class="form-control" id=" " placeholder="Tên danh mục">
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
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" name="close">Đóng</button>
                <button type="button" class="btn btn-primary" onclick="addCategory()" name="save">Lưu</button>
            </div>
        </div>
    </div>
</div>

<script src="script.js"></script>
<script>

</script>












