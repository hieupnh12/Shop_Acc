<%-- 
    Document   : headlib
    Created on : Feb 26, 2025, 11:06:46 PM
    Author     : hieup
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/tablib.jsp" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>shop acc uy tin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
    .custom-border-radius {
        border-radius: 5px; /* Làm tròn góc */
        padding: 5px 10px; /* Tạo khoảng cách nội dung với viền */
        background-color: #f8f9fa; /* Màu nền nhẹ để nhìn rõ hơn */
        border: 1px solid #777777; /* Viền nhẹ */
        width: 160PX;
    }
    .dropdown-menu {
        left: auto !important;
        right: 0 !important;
    }
    /* Section Title Styling */
    .section-title {
        font-size: 2.5rem;
        font-weight: bold;
    }

    /* Gradient Text Styling */
    .text-gradient {
        background: linear-gradient(45deg, #ff6b6b, #ffcc33);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
    }

    /* Hover Effects for Cards */
    .card-hover:hover {
        transform: translateY(-10px);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        transition: all 0.3s ease-in-out;
    }

    /* Gradient Button Styling */
    .btn-gradient {
        background: linear-gradient(45deg, #ff6b6b, #ffcc33);
        border: none;
        color: white;
        transition: background 0.3s ease-in-out;
    }

    .btn-gradient:hover {
        background: linear-gradient(45deg, #ffcc33, #ff6b6b);
        transition: all 0.3s ease-in-out;
    }

    /* Viền cho Card và hiệu ứng hover */
    
    .card-hover {
        border: 3px solid #F09C42;  /* Viền mặc định cho card */
        border-radius: 10px;  /* Bo góc cho card */
        transition: all 0.3s ease-in-out; /* Thêm hiệu ứng chuyển tiếp khi hover */
        position: relative; /* Đảm bảo rằng background phủ đúng */
        overflow: hidden; /* Để giới hạn phần background phủ không tràn ra ngoài card */
    }

    .card-hover::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(255,238,186,0.8); /* Màu nền khi hover */
        z-index: -1; /* Đảm bảo background phủ dưới nội dung */
        transform: scaleX(0); /* Bắt đầu từ 0% phủ */
        transform-origin: left; /* Đặt gốc chuyển động là bên phải */
        transition: transform 0.5s ease-in-out; /* Thêm thời gian và hiệu ứng cho sự thay đổi */
    }

    .card-hover:hover {
        background-color: rgba(255,238,186,0.8); /* Màu nền khi hover */
        border: 2px solid #ff6b6b;  /* Viền đỏ khi hover */
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);  /* Thêm bóng đổ mạnh khi hover */
        transform: scale(1.5);  /* Phóng to nhẹ khi hover */
    }

    .card-hover:hover::before {
        transform: scaleX(1); /* Tăng phần phủ lên 100% khi hover */
    }
    .content-body-each-part {
        border: 2px solid transparent; /* Transparent border initially */
        border-radius: 15px; /* Rounded corners */
        transition: all 0.3s ease-in-out; /* Smooth transition for all properties */
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* Light shadow */
    }

    .fade-section {
        opacity: 0;
        transform: translateY(20px);
        transition: opacity 1s ease-out, transform 1s ease-out;
    }

    .fade-section.visible {
        opacity: 1;
        transform: translateY(0);
    }
</style>
</head>
