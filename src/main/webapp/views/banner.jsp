
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
    .card-header {
        background: linear-gradient(45deg, #ff9d00, #ff2d00);
        color: white;
        font-weight: bold;
        text-align: center;
        font-size: 1.2rem;
    }

    .list-group-item {
        display: flex;
        align-items: center;
        transition: background-color 0.3s ease, transform 0.2s ease;
        border: none;
        padding: 12px 15px;
        position: relative;
        font-size: 1.1rem;
    }

    .list-group-item:hover {
        background-color: #ffeeba;
        transform: scale(1.05);
        z-index: 1;
    }

    .badge {
        width: 40px;
        text-align: center;
    }
</style>


<div class="container mt-5" >
    <div class="row align-items-stretch">
        <div class="col-md-8">
            <div id="carouselExampleAutoplaying" class="carousel slide rounded-3 overflow-hidden" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="//cdn3.upanh.info/upload/server-sw3/images/323%20-%20Cuoq%20-%2020_02_2024%20-%20Banner%20Nicklienquan_net.jpg"
                             class="d-block w-100 rounded-3" alt="Ảnh 1">
                    </div>
                    <div class="carousel-item">
                        <img src="//cdn3.upanh.info/upload/server-sw3/images/323%20-%20Cuoq%20-%2020_02_2024%20-%20Banner%20Nicklienquan_net.jpg"
                             class="d-block w-100 rounded-3" alt="Ảnh 2">
                    </div>
                    <div class="carousel-item">
                        <img src="//cdn3.upanh.info/upload/server-sw3/images/323%20-%20Cuoq%20-%2020_02_2024%20-%20Banner%20Nicklienquan_net.jpg"
                             class="d-block w-100 rounded-3" alt="Ảnh 3">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>







        <div class="col-md-4 mx-auto">
        <div class="card shadow-lg border-0 rounded-3 overflow-hidden">
            <div class="card-header py-3 text-center fw-bold">🌟 Top Người Nạp Tiền 🌟</div>
            <ul class="list-group list-group-flush">
                <c:choose>
                    <c:when test="${not empty top5Users}">
                        <c:forEach var="user" items="${top5Users}" varStatus="status">
                            <li class="list-group-item d-flex align-items-center">
                                <span class="badge 
                                    <c:choose>
                                        <c:when test='${status.index == 0}'>bg-danger text-dark</c:when>
                                        <c:when test='${status.index == 1}'>bg-warning text-white</c:when>
                                        <c:when test='${status.index == 2}'>bg-success text-white</c:when>
                                        <c:otherwise>bg-dark text-white</c:otherwise>
                                    </c:choose> 
                                    me-2 py-2 rounded-pill">
                                    <c:choose>
                                        <c:when test='${status.index == 0}'>&#x1F947;</c:when>
                                        <c:when test='${status.index == 1}'>&#x1F948;</c:when>
                                        <c:when test='${status.index == 2}'>&#x1F949;</c:when>
                                        <c:otherwise>🎖</c:otherwise>
                                    </c:choose>
                                </span> 
                                <span class="fw-bold flex-grow-1">${user.email}</span>
                                <i class="fa-solid fa-coins text-warning"> ${user.balance}</i>
                            </li>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <li class="list-group-item text-center">Không có dữ liệu</li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
                                
                                
                                
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>