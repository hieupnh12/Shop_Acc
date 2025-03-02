<%-- 
    Document   : register.html
    Created on : Mar 1, 2025, 2:55:18 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop Acc - Đăng Nhập & Đăng Ký</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link href="../CSS/Register.css" rel="stylesheet">	
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">


</head>
<body >

    <div id="header">
        <div class="text">
             If you have the account 
        </div>
        <div class="text-center">
            <button type="button" class="btn btn-outline-light" >
               <a href="login.jsp"> Sign In </a>   
            </button>

        </div>
    </div>


    
    
        <div id="wrapper">
    
    
            <form id="form-heading">
                <p>THONG BAO </p>
                 <div class="form-tb">
                    <p>Đăng nhập để mua hàng và sử dụng các dịch vụ của chúng tôi</p>
                    <p> lần đầu tiên đăng kí tài khoản sẽ được nhận nhiều ưu đãi hấp dẫn</p>
                    <p> chi tiết ưu đãi : </p>
                    <p> - Giảm giá 10% cho lần mua hàng đầu tiên</p>
                    <p> - vé quay vòng quay miễn phí hấp dẫn </p>
                    <p> - nhận ngay 1000 điểm thưởng khi đăng kí tài khoản</p>
                    <p> - nhận ngay 500 điểm thưởng khi mua hàng</p>
                    <p> - nhận ngay 1000 điểm thưởng khi mời bạn bè mua hàng</p>    
                   <p></p>
                 </div>

            </form>




            <form action="" id="form-login">
    
                <h1 class="form-heading">REGISTER</h1>
    
                <div class="form-group">
                    <input type="text" class="form-control" id="email" placeholder="UserName">
                </div>
    
    
    
                <div class="form-group">
                    <input type="email" class="form-control" id="email" placeholder="Email">
    
                </div>
    
                <div class="form-group">
                    <input type="tel " class="form-control" id="text" placeholder="Phone Number">
                </div>
    
                <div id="pass">
                    <div class="form-group1">
    
                        <input type="password" class="form-control" id="password" placeholder="Password">
                        <div class="eye">
                            <i class="far fa-eye"></i>
    
                        </div>
                    </div>
    
                    <div class="form-group1">
                        <input type="password" class="form-control" id="password" placeholder="Confirm Password">
                        <div class="eye">
                            <i class="far fa-eye"></i>
    
                        </div>
                    </div>
    
                </div>
    
                <input type="submit" class="nnn " value="SIGN UP">
    


            <!-- Register buttons -->
            <div class="text-center  ">
                <p>or sign up with:</p>
                <button type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-link btn-floating mx-1 bt">
                    <i class="fab fa-facebook-f"></i>
                </button>
    
            </div>



            </form>

    
        </div>

</body>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="js/app.js"></script>

</html>
