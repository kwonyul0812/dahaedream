<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <title>다해드림</title>

    <!-- CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f8f9fa;
        }

        .swiper {
            width: 90%;
            height: 300px;
            margin: 40px auto;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        .swiper-slide {
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 24px;
            background: linear-gradient(to right, #ffecd2, #fcb69f);
            color: #333;
            font-weight: bold;
        }

        .section-title {
            margin-top: 80px;
            margin-bottom: 30px;
            font-weight: 600;
            font-size: 1.5rem;
        }

        .card-img-top {
            aspect-ratio: 1/1;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .card:hover .card-img-top {
            transform: scale(1.05);
        }
    </style>
</head>

<body>

<jsp:include page="../fragment/navbar.jsp"/>

<!-- Swiper -->
<div class="swiper">
    <div class="swiper-wrapper">
        <div class="swiper-slide">
            <img src="/uploads/banner3.png" alt="" style="height: 100%; width: 100%">

        </div>
        <div class="swiper-slide">
            <img src="/uploads/banner.png" alt="" style="height: 100%; width: 100%">

        </div>
        <div class="swiper-slide">
            <img src="/uploads/vari.png" alt="" style="height: 100%; width: 100%" >

        </div>
    </div>
    <div class="swiper-pagination"></div>
    <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>
</div>

<!-- 콘텐츠 섹션 -->
<div class="container">
    <!-- 섹션 1 -->
    <h4 class="section-title">🍳 음식 하는법 알려주세요</h4>
    <div class="row g-4">
    </div>

    <!-- 섹션 2 -->
    <h4 class="section-title">🏊 수영 하는법 알려주세요</h4>
    <div class="row g-4 mb-5">
    </div>
</div>

<script>
    const swiper = new Swiper('.swiper', {
        loop: true,
        pagination: {
            el: '.swiper-pagination',
            clickable: true
        },
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        autoplay: {
            delay: 3000,
            disableOnInteraction: false,
        },
    });
</script>

</body>
</html>
