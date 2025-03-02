<%-- 
    Document   : product_manager
    Created on : Feb 24, 2025, 9:41:48 AM
    Author     : MSI2022
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h2 class="mb-4">Quản lý sản phẩm</h2>
        
        <!-- Form thêm/sửa sản phẩm -->
        <form id="productForm">
            <input type="hidden" id="productIndex">
            <div class="mb-3">
                <label for="productName" class="form-label">Tên sản phẩm</label>
                <input type="text" class="form-control" id="productName" required>
            </div>
            <div class="mb-3">
                <label for="productPrice" class="form-label">Giá</label>
                <input type="number" class="form-control" id="productPrice" required>
            </div>
            <button type="submit" class="btn btn-primary">Lưu</button>
        </form>
        
        <!-- Bảng danh sách sản phẩm -->
        <table class="table mt-4">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Tên sản phẩm</th>
                    <th>Giá</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody id="productList"></tbody>
        </table>
    </div>

    <script>
        let products = JSON.parse(localStorage.getItem("products")) || [];
        function renderProducts() {
            let list = "";
            products.forEach((product, index) => {
                list += `<tr>
                    <td>${index + 1}</td>
                    <td>${product.name}</td>
                    <td>${product.price}</td>
                    <td>
                        <button class='btn btn-warning btn-sm' onclick='editProduct(${index})'>Sửa</button>
                        <button class='btn btn-danger btn-sm' onclick='deleteProduct(${index})'>Xóa</button>
                    </td>
                </tr>`;
            });
            document.getElementById("productList").innerHTML = list;
            localStorage.setItem("products", JSON.stringify(products));
        }

        document.getElementById("productForm").addEventListener("submit", function (e) {
            e.preventDefault();
            let name = document.getElementById("productName").value;
            let price = document.getElementById("productPrice").value;
            let index = document.getElementById("productIndex").value;
            if (index === "") {
                products.push({ name, price });
            } else {
                products[index] = { name, price };
                document.getElementById("productIndex").value = "";
            }
            this.reset();
            renderProducts();
        });

        function editProduct(index) {
            document.getElementById("productName").value = products[index].name;
            document.getElementById("productPrice").value = products[index].price;
            document.getElementById("productIndex").value = index;
        }

        function deleteProduct(index) {
            if (confirm("Bạn có chắc muốn xóa sản phẩm này?")) {
                products.splice(index, 1);
                renderProducts();
            }
        }

        renderProducts();
    </script>
</body>
</html>

