<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>수락한 의뢰</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</head>
<body class="bg-light">
<jsp:include page="../../fragment/navbar.jsp"/>

<div class="container py-5">
    <h1 class="mb-4 text-center">수락한 의뢰</h1>

    <!-- 탭 메뉴 -->
    <ul class="nav nav-tabs mb-4" id="requestTab" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active" id="inprogress-tab" data-bs-toggle="tab" data-bs-target="#inprogress"
                    type="button" role="tab">진행중</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="completed-tab" data-bs-toggle="tab" data-bs-target="#completed"
                    type="button" role="tab">완료</button>
        </li>
    </ul>

    <!-- 탭 내용 -->
    <div class="tab-content" id="requestTabContent">

        <!-- 진행중 -->
        <div class="tab-pane fade show active" id="inprogress" role="tabpanel">
            <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
                <div class="col">
                    <div class="card h-100 shadow-sm">
                        <img src="" class="card-img-top" alt="썸네일 이미지">
                        <div class="card-body">
                            <h5 class="card-title">요리 알려주실 분</h5>
                            <p class="card-text"><strong>상태:</strong> 진행중</p>
                            <p class="card-text"><strong>50000P</strong></p>
                            <p class="card-text"><strong>기간:</strong>3일</p>
                            <p class="card-text"><strong>의뢰자:</strong>홍길동</p>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card h-100 shadow-sm">
                        <img src="" class="card-img-top" alt="썸네일 이미지">
                        <div class="card-body">
                            <h5 class="card-title">요리 알려주실 분</h5>
                            <p class="card-text"><strong>상태:</strong> 진행중</p>
                            <p class="card-text"><strong>50000P</strong></p>
                            <p class="card-text"><strong>기간:</strong>3일</p>
                            <p class="card-text"><strong>의뢰자:</strong>홍길동</p>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card h-100 shadow-sm">
                        <img src="" class="card-img-top" alt="썸네일 이미지">
                        <div class="card-body">
                            <h5 class="card-title">요리 알려주실 분</h5>
                            <p class="card-text"><strong>상태:</strong> 진행중</p>
                            <p class="card-text"><strong>50000P</strong></p>
                            <p class="card-text"><strong>기간:</strong>3일</p>
                            <p class="card-text"><strong>의뢰자:</strong>홍길동</p>
                        </div>
                    </div>
                </div>
                <!-- 진행중 카드 추가 가능 -->
            </div>
        </div>

        <!-- 완료 -->
        <div class="tab-pane fade" id="completed" role="tabpanel">
            <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
                <div class="col">
                    <div class="card h-100 shadow-sm">
                        <img src="" class="card-img-top" alt="썸네일 이미지">
                        <div class="card-body">
                            <h5 class="card-title">수영 알려주실 분</h5>
                            <p class="card-text"><strong>상태:</strong> 완료</p>
                            <p class="card-text"><strong>30000P</strong></p>
                            <p class="card-text"><strong>기간:</strong>주1회</p>
                            <p class="card-text"><strong>의뢰자:</strong>홍길동</p>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card h-100 shadow-sm">
                        <img src="" class="card-img-top" alt="썸네일 이미지">
                        <div class="card-body">
                            <h5 class="card-title">수영 알려주실 분</h5>
                            <p class="card-text"><strong>상태:</strong> 완료</p>
                            <p class="card-text"><strong>30000P</strong></p>
                            <p class="card-text"><strong>기간:</strong>주1회</p>
                            <p class="card-text"><strong>의뢰자:</strong>홍길동</p>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card h-100 shadow-sm">
                        <img src="" class="card-img-top" alt="썸네일 이미지">
                        <div class="card-body">
                            <h5 class="card-title">수영 알려주실 분</h5>
                            <p class="card-text"><strong>상태:</strong> 완료</p>
                            <p class="card-text"><strong>30000P</strong></p>
                            <p class="card-text"><strong>기간:</strong>주1회</p>
                            <p class="card-text"><strong>의뢰자:</strong>홍길동</p>
                        </div>
                    </div>
                </div>
                <!-- 완료 카드 추가 가능 -->
            </div>
        </div>

    </div>
</div>

</body>
</html>