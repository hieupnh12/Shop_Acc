<%@page contentType="text/html" pageEncoding="UTF-8"%>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/CSS/login.css" rel="stylesheet" type="text/css"/>

<html lang="vi">
    <style>
        html, body {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
            background-color: white;
        }
        section{
            flex: 1;
            margin-bottom: 100px;
        }
    </style>
    <body id="page-top">
        <jsp:include page="/common/menu.jsp"></jsp:include>
            <section >
                <div id="wrapper" >
                    <form action="<%= request.getContextPath()%>/login?status=typed" method="post" id="form-login">
                    <h1 class="form-heading">LOGIN</h1>
                    <div class="form-group">
                        <i class="fa-regular fa-circle-user"></i>
                        <input type="text" class="form-control" name="username" id="username" placeholder="UserName">
                    </div>
                    <div class="form-group">
                        <i class="fa-solid fa-key"></i>
                        <input type="password" class="form-control" name="password" id="password" placeholder="Password">
                        <div id="eye">
                            <i class="far fa-eye"></i>
                        </div>
                    </div>

                    <input type="submit" class="nnn" value="SIGN IN">

                </form>
                <div>
                    ${alert}
                </div>
                <div class="d-flex justify-content-between align-items-center">
                    <!-- Checkbox -->
                    <div class="form-check mb-0">
                        <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3" />
                        <label class="form-check-label" for="form2Example3">
                            Remember password
                        </label>
                    </div>
                    <a href="<%= request.getContextPath()%>/forgot-password" class="forgot">Forgot password?</a>
                </div>


                <!-- Register buttons -->
                <div class="text-center col-md-12 " >
                    <p>Or sign in with:</p>
                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8080/Shop_Acc/login&response_type=code&client_id=891069491380-qg4bhmga9kungcjqqjlkn1n3h9tmgo7i.apps.googleusercontent.com&approval_prompt=force" class="btn btn-primary btn-lg">
                        <i class="fab fa-google"></i> Sign in with Google
                    </a>
                </div>
                <div id="tb">
                    <p>Don't have an account?</p>
                    <a href="<%= request.getContextPath()%>/register" class="btn-link">Register</a>                
                </div>
            </div>
        </section>

        <jsp:include page="/common/footer.jsp"></jsp:include>
    </body>
</html>


<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<script>
    document.getElementById("eye").addEventListener("click", function () {
        let passwordField = document.getElementById("password");
        let icon = this.querySelector("i");

        if (passwordField.type === "password") {
            passwordField.type = "text";
            icon.classList.replace("fa-eye", "fa-eye-slash");
        } else {
            passwordField.type = "password";
            icon.classList.replace("fa-eye-slash", "fa-eye");
        }
    });
</script>