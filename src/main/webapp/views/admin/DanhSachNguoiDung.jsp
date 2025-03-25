<%-- 
    Document   : DanhSachNguoiDung
    Created on : Mar 10, 2025, 10:06:24 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
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
                 <div class="container pt-2" style=" background-color:#F7F8FD; width: 85% " >
                     <div>
                         <h2 class="mb-3">Quản lý Người Dùng</h2>

                         <table class="table table-bordered">
                             <thead class="table-light">
                                 <tr>
                                     <th>STT</th>
                                     <th>Tên người dùng</th>
                                     <th>Email</th>
                                     <th>Vai trò</th>
                                     <th>Trạng thái</th>
                                     <th>Hành động</th>
                                 </tr>
                             </thead>
                             <tbody>
                                 <tr>
                                     <td>1</td>
                                     <td>Nguyen Van A</td>
                                     <td>nguyenvana@example.com</td>
                                     <td>Admin</td>
                                     <td>Hoạt động</td>
                                     <td>
                                         <button class="btn btn-sm btn-primary">✏️</button>
                                         <button class="btn btn-sm btn-danger">🗑️</button>
                                     </td>
                                 </tr>
                                 <!-- Thêm các dòng dữ liệu người dùng tại đây -->
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

                 </div>
        </div>
        <jsp:include page="/common/footer.jsp"></jsp:include>

    </body>
<script src="script.js"></script>

</html>
