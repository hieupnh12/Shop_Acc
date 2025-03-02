<%-- 
    Document   : login
    Created on : Mar 1, 2025, 2:55:09 PM
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
    <link href="../CSS/login.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

   
</head>
<body >
    
 <section >
    

    <div id="wrapper" >
       
        <form action="" id="form-login">
        
            <h1 class="form-heading">LOGIN</h1>
        
            <div class="form-group">

                <i class="	fa-regular fa-circle-user"></i>
                <input type="text" class="form-control" id="email" placeholder="UserName">
            </div>
        
            <div class="form-group">

                <i class="fa-solid fa-key"></i>
                <input type="password" class="form-control" id="password" placeholder="Password">
                <div id="eye">
                    <i class="far fa-eye"></i>
        
                </div>
            </div>
        
            <input type="submit" class="nnn " value="SIGN IN">
        
        </form>

        <div class="d-flex justify-content-between align-items-center">
            <!-- Checkbox -->
            <div class="form-check mb-0">
              <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3" />
              <label class="form-check-label" for="form2Example3">
                Remember password
              </label>
            </div>
            <a href="#!" class="forgot">Forgot password?</a>
          </div>


      <!-- Register buttons -->
      <div class="text-center col-md-12 " >
        <p>or sign up with:</p>
        <button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-link btn-floating mx-1 col-md-2">
          <i class="fab fa-facebook-f"></i>
        </button>

        <button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-link btn-floating mx-1 col-md-2">
          <i class="fab fa-google"></i>
        </button>

        <button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-link btn-floating mx-1 col-md-2">
          <i class="fab fa-twitter"></i>
        </button>

        <button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-link btn-floating mx-1 col-md-2">
          <i class="fab fa-github"></i>
        </button>
      </div>

    



       <div id="tb">
        <p>Don't have an account?</p>
        <a href="register.jsp" class=" btn-link">Register</a>
       </div>


    </div>
  </section>

</body>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<script>
    $(document).ready(function(){
        $("#eye").click(function(){
            let passwordField = $("#password");
            let icon = $(this).find("i");

            if (passwordField.attr("type") === "password") {
                passwordField.attr("type", "text");
                icon.removeClass("far fa-eye").addClass("far fa-eye-slash");
            } else {
                passwordField.attr("type", "password");
                icon.removeClass("far fa-eye-slash").addClass("far fa-eye");
            }
        });
    });
</script>

</html>
