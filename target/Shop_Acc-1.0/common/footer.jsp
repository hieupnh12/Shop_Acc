<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
        @media (min-width: 700px) {
  .custom-container {
    max-width: calc(100% - 380.8px);
  }
}

</style>
<footer class=" text-white py-4" style="background-color: #5A5C69">
       <div class="container mx-auto custom-container">

        <div class="row">
            <!-- Cột 1: Giới thiệu -->
            <div class="col-md-4">
                <h5><i class="fa-solid fa-gamepad me-2"></i> SHOP ACC UY TÍN</h5>
                <p>Chuyên cung cấp tài khoản game Liên Quân, Free Fire, PUBG , NINJA với giá tốt.</p>
            </div>

            <!-- Cột 2: Liên kết nhanh -->
            <div class="col-md-4">
                <h5><i class="fa-solid fa-link me-2"></i> Liên Kết Nhanh</h5>
                <ul class="list-unstyled">
                    <li><a href="#" class="text-white text-decoration-none">Trang Chủ</a></li>
                    <li><a href="#" class="text-white text-decoration-none">Sản Phẩm</a></li>
                    <li><a href="#" class="text-white text-decoration-none">Liên Hệ</a></li>
                </ul>
            </div>

            <!-- Cột 3: Liên hệ -->
            <div class="col-md-4">
                <h5><i class="fa-solid fa-phone me-2"></i> Liên Hệ</h5>
                <p>Email: commingson@lienquanmobile.com</p>
                <p>Hotline: 0123 456 789</p>
                <div>
                <!-- Facebook Icon with onmouseover and onmouseout for <a> -->
                <a href="#" class="text-white me-2 text-decoration-none"
                   onmouseover="this.querySelector('.fa-facebook').style.color='#0000EE';"
                   onmouseout="this.querySelector('.fa-facebook').style.color='#FFFFFF';">
                  <i class="fa-brands fa-facebook fa-1x"></i> Facebook
                </a>

                <!-- YouTube Icon with onmouseover and onmouseout for <a> -->
                <a href="#" class="text-white me-2 text-decoration-none"
                   onmouseover="this.querySelector('.fa-youtube').style.color='#FF0000';"
                   onmouseout="this.querySelector('.fa-youtube').style.color='#FFFFFF';">
                  <i class="fa-brands fa-youtube fa-1x"></i> Youtube
                </a>
              </div>
            </div>
        </div>

        <!-- Dòng bản quyền -->
        <div class="text-center mt-3">
            <p class="mb-0">© 2025 LIÊN QUÂN Mobile. All rights reserved.</p>
        </div>
    </div>
</footer>

<script>
    $(document).ready(function () {
        $('.card').hover(
                function () {
                    $(this).addClass('shadow-lg').css({
                        'transform': 'scale(1.05)',
                        'transition': 'all 0.3s ease-in-out'
                    });
                }, function () {
            $(this).removeClass('shadow-lg').css({
                'transform': 'scale(1)',
                'transition': 'all 0.3s ease-in-out'
            });
        }
        );

        // Điều chỉnh kích thước chữ
        $('.card-title').css('font-size', '1.25rem');
        $('.card-text').css('font-size', '1rem');
        $('.btn').css('font-size', '1rem');

        // Thêm gradient và hiệu ứng hover cho nút
        $('.btn-gradient').css({
            'background': 'linear-gradient(45deg, #ff6b6b, #ffcc33)',
            'border': 'none',
            'color': '#fff',
            'border-radius': '30px',
            'padding': '10px 20px',
            'transition': 'all 0.3s ease-in-out',
            'box-shadow': '0 4px 6px rgba(0, 0, 0, 0.1)'
        });
        $('.btn-gradient').hover(
                function () {
                    $(this).css({
                        'background': 'linear-gradient(45deg, #ffcc33, #ff6b6b)',
                        'transform': 'scale(1.1)',
                        'box-shadow': '0 6px 8px rgba(0, 0, 0, 0.2)'
                    });
                }, function () {
            $(this).css({
                'background': 'linear-gradient(45deg, #ff6b6b, #ffcc33)',
                'transform': 'scale(1)',
                'box-shadow': '0 4px 6px rgba(0, 0, 0, 0.1)'
            });
        }
        );
    });
    
     window.addEventListener('scroll', function () {
        const sections = document.querySelectorAll('.fade-section');
        
        sections.forEach(function (section) {
            if (section.getBoundingClientRect().top <= window.innerHeight * 0.8) {
                section.classList.add('visible');
            }
        });
    });
</script>