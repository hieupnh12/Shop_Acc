<%@page contentType="text/html" pageEncoding="UTF-8"%>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/CSS/Register.css" rel="stylesheet" type="text/css"/>

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
            width: 100%;
            flex: 1;
            margin-bottom: 100px;
        }
    </style>
    <body id="page-top">
        <jsp:include page="/common/menu.jsp"></jsp:include>
            <section >
                <div id="wrapper">
                    <form action="<%= request.getContextPath()%>/register" method="post" id="form-register">
                    <h1 class="form-heading">REGISTER</h1>
                    <div class="form-group">
                        <input type="email" class="form-control" name="username" id="email" placeholder="Email">
                    </div>
                    <div class="form-group">
                        <input type="tel" class="form-control" name="numPhone" id="phone" placeholder="Phone Number">
                    </div>

                    <div id="pass">
                        <div class="form-group1">
                            <input type="password" name="password" class="form-control" id="password" placeholder="Password">
                            <div class="eye">
                                <i class="far fa-eye"></i>
                            </div>
                        </div>
                        <div class="form-group1">
                            <input type="password" name="repeat-password" class="form-control" id="repeat-password" placeholder="Confirm Password">
                            <div class="eye">
                                <i class="far fa-eye"></i>
                            </div>
                        </div>
                    </div>
                    <input type="submit" class="nnn" value="SIGN UP">
                </form>
            </div>
        </section>
        <jsp:include page="/common/footer.jsp"></jsp:include>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

        <script>
            $(document).ready(function () {
                $(".eye").click(function () {
                    let passwordField = $(this).prev("input"); // Chọn input phía trước icon
                    let icon = $(this).find("i");

                    if (passwordField.attr("type") === "password") {
                        passwordField.attr("type", "text");
                        icon.removeClass("fa-eye").addClass("fa-eye-slash");
                    } else {
                        passwordField.attr("type", "password");
                        icon.removeClass("fa-eye-slash").addClass("fa-eye");
                    }
                });
            });
        </script>
    </body>
</html>


