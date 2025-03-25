<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Forgot Password</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    </head>
    <body class="bg-light d-flex flex-column min-vh-100">
                <%@include file="/common/menu.jsp"%>
        <div class="container flex-grow-1">
            <div class="row w-100 justify-content-center">
                <div class="col-md-6 col-lg-4">
                    <div class="card">
                        <div class="card-body p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-2">Forgot Your Password?</h1>
                                <p class="mb-4 text-muted">Just enter your email address below and we'll send you a link to reset your password!</p>
                            </div>
                            <form action="<%= request.getContextPath()%>/forgot-password" method="post" class="needs-validation" novalidate>
                                <div class="mb-3">
                                    <input type="email" class="form-control" id="email" name="email" placeholder="Enter Email Address..." required>
                                    <div class="invalid-feedback">
                                        Please enter a valid email address.
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary w-100">Reset Password</button>
                            </form>
                                ${alert}
                            <hr class="my-4">
                            <div class="text-center">
                                <a href="<%= request.getContextPath()%>/register" class="small">Create an Account!</a>
                            </div>
                            <div class="text-center">
                                <a href="<%= request.getContextPath()%>/login" class="small">Already have an account? Login!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/common/footer.jsp" %>

        <!-- jQuery và Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
        <!-- Validation Script -->
        <script>
            $(document).ready(function () {
                $('form.needs-validation').on('submit', function (event) {
                    let form = this;
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                });
            });
        </script>
    </body>
</html>
