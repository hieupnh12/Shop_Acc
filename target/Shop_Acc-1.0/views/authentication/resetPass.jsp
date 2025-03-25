<%-- 
    Document   : resetPass
    Created on : Mar 15, 2025, 2:42:13 PM
    Author     : hieup
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/tablib.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reset Password</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
                        <%@include file="/common/menu.jsp" %>
        <div class="d-flex justify-content-center align-items-center min-vh-100">
            <div class="card w-50" style="max-width: 400px;">
                <div class="card-header bg-primary text-white">
                    <h3 class="mb-0">Reset Password</h3>
                </div>
                <div class="card-body">
                    <form id="resetPasswordForm" action="<%= request.getContextPath()%>/resetPassword" method="POST">
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email" value="${email}" readonly="true"
                                   placeholder="Enter your email" required>
                        </div>

                        <div class="mb-3">
                            <label for="password" class="form-label">New Password</label>
                            <input type="password" class="form-control" id="password" name="password" 
                                   placeholder="Enter new password" required>
                            <div id="passwordError" class="text-danger mt-1" style="display: none;">
                                Password must be at least 6 characters
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="confirmPassword" class="form-label">Confirm Password</label>
                            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" 
                                   placeholder="Confirm new password" required>
                            <div id="confirmError" class="text-danger mt-1" style="display: none;">
                                Passwords do not match
                            </div>
                        </div>

                        <button type="submit" class="btn btn-primary w-100">Reset Password</button>
                    </form>
                </div>
            </div>
        </div>
        
        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            $(document).ready(function () {
                $('#resetPasswordForm').submit(function (e) {
                    e.preventDefault();

                    // Reset error messages
                    $('.text-danger').hide();
                    let isValid = true;

                    // Email validation
                    const email = $('#email').val();
                    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                    if (!emailRegex.test(email)) {
                        $('#emailError').show();
                        isValid = false;
                    }

                    // Password validation
                    const password = $('#password').val();
                    if (password.length < 6) {
                        $('#passwordError').show();
                        isValid = false;
                    }

                    // Confirm password validation
                    const confirmPassword = $('#confirmPassword').val();
                    if (password !== confirmPassword) {
                        $('#confirmError').show();
                        isValid = false;
                    }

                    // If all validations pass, submit the form
                    if (isValid) {
                        this.submit();
                    }
                });
            });
        </script>
                <%@include file="/common/footer.jsp" %>

    </body>
</html>