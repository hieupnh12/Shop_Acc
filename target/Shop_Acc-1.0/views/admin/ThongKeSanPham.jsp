<%-- 
    Document   : ThongKeSoTien
    Created on : Mar 10, 2025, 9:24:34 AM
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
         #content-wrapper{
             background-color:#F7F8FD;
             padding-top: 20px;
             width: 85%;
         }
         .col-auto i{
             color: #DDDDDD;
         }

         .badge {
             border-radius: 10px;
             font-size: 12px;
             width: 16%;
         }

     </style>
    <body id="page-top">
        <jsp:include page="/common/menu.jsp"></jsp:include>
        <div id="wrapper"> 
                 <div style="width: 15%" class=" h-100">
                 <jsp:include page="/views/admin/sidebar.jsp"></jsp:include>
                 </div>
        <!-- Content Wrapper -->
        <div id="content-wrapper" >

            <!-- Main Content -->
            <div id="content">

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-muted">Dashboard</h1>
                        <a href="#" class="btn btn-primary btn-sm shadow-sm">
                            <i class="fas fa-download fa-sm text-white-50"></i> Generate Report
                        </a>
                    </div>

                    <!-- Content Row -->
                    <div class="row">

                        <!-- Danh Mục Sản Phẩm  -->
                        <div class="col-xl-4 col-md-6 mb-4">
                            <div class="card border-start border-primary shadow h-100 py-2" style="border-width: 4px !important; border-right: none !important; border-top: none !important; border-bottom: none !important;">
                                <div class="card-body">
                                    <div class="row g-0 align-items-center">
                                        <div class="col me-2">
                                            <div class="text-xs text-primary text-uppercase mb-1" name="DanhMucSanPham">
                                                Danh Mục Sản Phẩm
                                            </div>
                                            <div class="h5 mb-0 text-gray-800" id="SoluongDanhMuc">thêm số lượng ở đây</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar fa-2x text-gray-400"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>



                        <!-- Số lượng tài khoản game  -->
                        <div class="col-xl-4 col-md-6 mb-4">
                            <div class="card border-start border-success  h-100 py-2" style="border-width: 4px !important; border-right: none !important; border-top: none !important; border-bottom: none !important;">
                                <div class="card-body">
                                    <div class="row g-0 align-items-center">
                                        <div class="col me-2">
                                            <div class="text-xs text-success text-uppercase mb-1">
                                                Sản Phẩm 
                                            </div>
                                            <div class="h5 mb-0 text-gray-800" id="SoluongSanPham">thêm số lượng ở đây</div>
                                        </div>

                                        <div class="col-auto">
                                            <i class="fas fa-gamepad fa-2x text-gray-400"></i> <!-- Đổi text-gray-300 thành text-gray-400 -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>





                        <!-- Số Lượng người dùng trong tất cả các năm -->
                        <div class="col-xl-4 col-md-6 mb-4">
                            <div class="card border-start border-warning  h-100 py-2" style="border-width: 4px !important; border-right: none !important; border-top: none !important; border-bottom: none !important;">
                                <div class="card-body">
                                    <div class="row g-0 align-items-center">
                                        <div class="col me-2">
                                            <div class="text-xs text-warning  text-uppercase mb-1">
                                                Customers
                                            </div>
                                            <div class="h5 mb-0 text-gray-800" id="SoluongSanPham">thêm số lượng ở đây</div>
                                            <span id="Percent" class="badge bg-success bg-opacity-25 text-success fw-bold px-2 py-1 small">
                                                +0.0%
                                            </span>    
                                        </div>

                                        <div class="col-auto">
                                            <i class="fas fa-users fa-2x text-gray-400"></i> <!-- Đổi text-gray-300 thành text-gray-400 -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>












                        <!-- Content Row -->

                        <!-- biểu đồ người dùng đăng kí tài khoản trong 1 tháng -->
                        <div >
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">Earnings Overview</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                             aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="myAreaChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>      
                    </div>

                </div>
                <!-- End of Main Content -->

            </div>
            <!-- End of Content Wrapper -->
        </div>
        </div>
        <jsp:include page="/common/footer.jsp"></jsp:include>

    </body>

</html>
