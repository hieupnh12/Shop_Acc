
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>shop acc uy tin</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="../CSS/menu.css"><!-- comment -->
        <link rel="stylesheet" href="../CSS/banner.css">
        <link href="../CSS/details.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <jsp:include page="/common/menu.jsp"></jsp:include>

            <div class="container mt-4 details">
                <div class="row">
                    <!-- Phần hiển thị ảnh acc game -->
                    <div class="col-md-6">
                        <div class="image-gallery text-center position-relative">
                            <!-- Ảnh chính -->
                            <img id="mainImage" src="https://lienquan.garena.vn/wp-content/uploads/2024/05/3eb5e658f7766dcc3ad915ab1275b60e659526576f34e1.jpg" 
                                 class="main-img img-fluid" alt="Acc Game">

                            <!-- Nút mũi tên trái -->
                            <button id="prevBtn" class="btn btn-dark position-absolute top-50 start-0 translate-middle-y px-3">←</button>

                            <!-- Nút mũi tên phải -->
                            <button id="nextBtn" class="btn btn-dark position-absolute top-50 end-0 translate-middle-y px-3">→</button>

                            <div class="thumbs-container position-relative">
                                <button id="thumbPrev" class="btn btn-dark position-absolute top-50 start-0 translate-middle-y px-3">←</button>

                                <div class="thumbs d-flex gap-3 overflow-hidden">
                                    <div class="thumbs-wrapper d-flex">

                                        <img src="https://lienquan.garena.vn/wp-content/uploads/2024/05/3eb5e658f7766dcc3ad915ab1275b60e659526576f34e1.jpg" class="thumb img-thumbnail" alt="Ảnh 1">
                                        <img src="https://lienquan.garena.vn/wp-content/uploads/2024/05/700a2b1db620403126bb04ff26dace86659653e9112c71.jpg" class="thumb img-thumbnail" alt="Ảnh 2">
                                        <img src="https://lienquan.garena.vn/wp-content/uploads/2024/05/2022d73a74079d001aa2953124cad71365964ecbe72021.jpg" class="thumb img-thumbnail" alt="Ảnh 3">
                                        <img src="https://lienquan.garena.vn/wp-content/uploads/2024/05/0c026845cdd6414fbd6c1bcb9fc70628660396d3c7f931.jpg" class="thumb img-thumbnail" alt="Ảnh 4">
                                        <img src="https://lienquan.garena.vn/wp-content/uploads/2024/05/bd1e14967c73c54c19de2aba827054886597c1384e6d41.jpg" class="thumb img-thumbnail" alt="Ảnh 5">
                                        <img src="https://lienquan.garena.vn/wp-content/uploads/2024/05/52808.jpg" class="thumb img-thumbnail" alt="Ảnh 6">
                                        <img src="https://lienquan.garena.vn/wp-content/uploads/2024/05/f551edd33bee7de95df506b30a8b7a486594e3181115d1.jpg" class="thumb img-thumbnail" alt="Ảnh 7">
                                        <img src="https://lienquan.garena.vn/wp-content/uploads/2024/05/3ed4166b122119a4a0f23bb1069e0e456594e6280fd0a1.jpg" class="thumb img-thumbnail" alt="Ảnh 8">
                                        <img src="https://lienquan.garena.vn/wp-content/uploads/2024/05/fa5833ffec89683fe89029070d78806f5a815a03490201.jpg" class="thumb img-thumbnail" alt="Ảnh 9">
                                        <img src="https://lienquan.garena.vn/wp-content/uploads/2024/07/15015.jpg" class="thumb img-thumbnail" alt="Ảnh 10">
                                    </div>
                                </div>


                                <button id="thumbNext" class="btn btn-dark position-absolute top-50 end-0 translate-middle-y px-3">→</button>
                            </div>

                        </div>

                    </div>

                    <!-- Phần thông tin chi tiết acc game -->
                    <div class="col-md-6">
                        <div class="card p-4 shadow-lg">
                            <h2 class="text-center mb-4">Thông Tin Acc Game</h2>
                            <ul class="list-group list-group-flush fs-5">
                                <li class="list-group-item"><strong>🔰 Rank:</strong> Cao Thủ</li>
                                <li class="list-group-item"><strong>🎭 Tướng:</strong> 50+</li>
                                <li class="list-group-item"><strong>🎨 Skin:</strong> 30+ Skin hiếm</li>
                                <li class="list-group-item"><strong>💰 Giá:</strong> <span class="text-danger fw-bold fs-5">300.000 VNĐ</span></li>
                            </ul>
                            <div class="text-center mt-4">
                                <a href="#" class="btn btn-success btn-lg px-4">Mua Ngay</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        <jsp:include page="/common/footer.jsp"></jsp:include>
            <!-- Bootstrap JavaScript -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    let images = document.querySelectorAll(".thumb");
                    let mainImage = document.getElementById("mainImage");
                    let prevBtn = document.getElementById("prevBtn");
                    let nextBtn = document.getElementById("nextBtn");
                    let thumbPrev = document.getElementById("thumbPrev");
                    let thumbNext = document.getElementById("thumbNext");
                    let thumbsWrapper = document.querySelector(".thumbs-wrapper");

                    let currentIndex = 0;
                    let scrollIndex = 0;
                    let visibleCount = 5; // Số ảnh hiển thị tối đa
                    let totalImages = images.length;

                    function updateImage(index) {
                        mainImage.src = images[index].src;
                    }

                    images.forEach((img, index) => {
                        img.addEventListener("click", function () {
                            currentIndex = index;
                            updateImage(currentIndex);
                        });
                    });

                    nextBtn.addEventListener("click", function () {
                        currentIndex = (currentIndex + 1) % images.length;
                        updateImage(currentIndex);
                    });

                    prevBtn.addEventListener("click", function () {
                        currentIndex = (currentIndex - 1 + images.length) % images.length;
                        updateImage(currentIndex);
                    });

                    function getImageWidth() {
                        return images[0].getBoundingClientRect().width + 10;
                    }

                    // Xử lý cuộn danh sách ảnh nhỏ
                    function scrollThumbnails(direction) {
                        let imageWidth = getImageWidth(); // Kích thước ảnh + khoảng cách
                        let maxScroll = totalImages - visibleCount; // Giới hạn cuộn

                        if (direction === "next") {
                            scrollIndex = Math.min(scrollIndex + 1, maxScroll);
                        } else {
                            scrollIndex = Math.max(scrollIndex - 1, 0);
                        }

                        let newTransform = -scrollIndex * imageWidth;
                        thumbsWrapper.style.transform = `translateX(${newTransform}px)`;
                    }

                    thumbNext.addEventListener("click", function () {
                        scrollThumbnails("next");
                    });

                    thumbPrev.addEventListener("click", function () {
                        scrollThumbnails("prev");
                    });
                });


        </script>     
    </body>
</html>
