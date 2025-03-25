<%-- 
    Document   : sidebar
    Created on : Mar 10, 2025, 8:31:15 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    /* phần accordion Sidebar    */
#accordionSidebar{
   background-color:#4E73DF; 
   color: white;
   padding: 10px 5% 0 5%;
   height: 100%;
}
    

#firstBar i{
         clip-path: inset(0 0 20% 0) ; /*Cắt một phần bên phải */
}

/* Khi active (truy cập vào trang) */
.nav-item.active .nav-link i {
     color: white !important;/* Khi active, icon sẽ có màu trắng */
}

.nav-item.active span {
   color: white !important;  /* Khi active, chữ sẽ trắng */
}

/* Khi không active */
.nav-item .nav-link i {
    
    color: #839DE9;
}




.item i{
     font-size: 90%;
    color: #839DE9;
}

.item span,.font{
    padding: 0.5rem ;
    font-size: 85%;
    color:#DDDDDD ;
}


.nav-item:hover .nav-link,
.nav-item:hover .nav-link i,
.nav-item:hover .nav-link span {
    color: white !important;

}
.collapse {
    transition: height 0.3s ease-in-out !important;
}

 .collapse-header{
    color:#BBBBBB ;
 }

/* Khi có class toggled, thu gọn sidebar */
#wrapper.toggled #accordionSidebar {
    width: 80px; /* Điều chỉnh kích thước mong muốn */
    overflow: hidden;
}

#wrapper.toggled .nav-item span {
    display: none; /* Ẩn chữ trong menu */
}

#wrapper.toggled .collapse {
    display: none !important;
}


#sidebarToggle{
    background-color: #839DE9;
    width: 20%;
}


</style>
<!-- Sidebar -->
    <ul class="navbar-nav "  id="accordionSidebar">

        <!-- Nav Item - Dashboard -->
        <li class="nav-item active " id="firstBar">
            <a class="nav-link" href="../admin/adminPage.jsp">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Dashboard</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading">
            The Product
        </div>

        <!-- Nav Item - chi tiết phần Danh Mục -->
        <li class="nav-item item">
            <a class="nav-link d-flex align-items-center justify-content-between rounded " 
               href="#" data-bs-toggle="collapse" data-bs-target="#collapseTwo"
               aria-expanded="false" aria-controls="collapseTwo">
                <div>
                    <i class="fas fa-book me-2"></i>
                    <span>Category</span>
                </div>
                <i class="fas fa-angle-right collapse-icon" id="iconCollapse"></i>
            </a>
            <div id="collapseTwo" class="collapse">
                <div class=" py-2 rounded shadow-sm px-3">
                    <a class="d-block px-3 py-2 text-decoration-none fs-6 font" href="../admin/Danh_Muc.jsp">Danh Mục</a>
                    <a class="d-block px-3 py-2 text-decoration-none fs-6 font" href="../admin/Product.jsp">Sản Phẩm </a>
                </div>
            </div>
        </li>

        <!-- Nav Item - chi tiết phần Sản Phẩm -->
        <li class="nav-item item">
            <a class="nav-link d-flex align-items-center justify-content-between rounded" 
               href="#" data-bs-toggle="collapse" data-bs-target="#collapseUtilities"
               aria-expanded="false" aria-controls="collapseUtilities">
                <div>
                    <i class="fas fa-wrench me-2"></i>
                    <span>Thống kê </span>
                </div>
                <i class="fas fa-angle-right collapse-icon"></i>
            </a>
            <div id="collapseUtilities" class="collapse">
                <div class="py-2 rounded shadow-sm px-3">
                    <a class="d-block px-3 py-2 text-decoration-none fs-6 font" href="../admin/ThongKeSoTien.jsp">Số Tiền </a>
                    <a class="d-block px-3 py-2 text-decoration-none fs-6 font" href="../admin/ThongKeSanPham.jsp">Sản Phẩm</a>
                </div>
            </div>
        </li>



        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading">
            User
        </div>

        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item item">
            <a class="nav-link d-flex align-items-center justify-content-between rounded" 
               href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages"
               aria-expanded="false" aria-controls="collapsePages">
                <div>
                    <i class="fas fa-folder me-2"></i>
                    <span>Người dùng </span>
                </div>
                <i class="fas fa-angle-right collapse-icon"></i>
            </a>
            <div id="collapsePages" class="collapse">
                <div class="py-2 rounded shadow-sm px-3">
                    <a class="d-block px-3 py-2 text-decoration-none fs-6 font" href="../admin/ThongKeNguoiDung.jsp">Biểu đồ</a>
                    <a class="d-block px-3 py-2 text-decoration-none fs-6 font" href="../admin/DanhSachNguoiDung.jsp">Danh Sách</a>
                </div>
            </div>
        </li>




        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">

        <!-- Sidebar Toggler (Sidebar) -->
        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0 text-white p-2" id="sidebarToggle">
                <i class="fas fa-angle-left"></i>
            </button>
        </div>



    </ul>
    <!-- End of Sidebar -->
    
    
    
    
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> <!-- Dùng bản đầy đủ -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>

//dùng để khi ấn vào sẽ sáng lên (tức là màu trắng )

  document.addEventListener("DOMContentLoaded", function () {
    // Lấy tất cả các nav-item
    const navItems = document.querySelectorAll(".nav-item");

    // Lấy URL hiện tại (chỉ lấy phần pathname để so sánh)
    const currentPath = window.location.pathname;

    // Lặp qua từng nav-item để kiểm tra
    navItems.forEach(item => {
        const link = item.querySelector(".nav-link");
        if (link) {
            const href = link.getAttribute("href");

            // Kiểm tra nếu href của link trùng với trang hiện tại
            if (currentPath.includes(href)) {
                item.classList.add("active");
            }

            // Sự kiện click để loại bỏ active khỏi các mục khác
            link.addEventListener("click", function () {
                navItems.forEach(i => i.classList.remove("active"));
                item.classList.add("active");
            });
        }
    });
});





// dùng để ấn vào thì nó sẽ đổi hướng mũi tên của các list 
document.addEventListener("DOMContentLoaded", function () {
    let toggleButtons = document.querySelectorAll('[data-bs-toggle="collapse"]');

    toggleButtons.forEach(button => {
        button.addEventListener("click", function () {
            let collapseIcon = this.querySelector("#iconCollapse"); // Chọn theo class thay vì id

            if (collapseIcon.classList.contains("fa-angle-right")) {
                collapseIcon.classList.replace("fa-angle-right", "fa-angle-down");
            } else {
                collapseIcon.classList.replace("fa-angle-down", "fa-angle-right");
            }
        });
    });
});



//phần cuộn nội dung 
    document.getElementById("sidebarToggle").addEventListener("click", function () {
        document.getElementById("wrapper").classList.toggle("toggled");

        // Đổi icon khi sidebar mở hoặc đóng
        let icon = this.querySelector("i");
        if (document.getElementById("wrapper").classList.contains("toggled")) {
            icon.classList.remove("fa-angle-left");
            icon.classList.add("fa-angle-right");
        } else {
            icon.classList.remove("fa-angle-right");
            icon.classList.add("fa-angle-left");
        }
    });



</script>