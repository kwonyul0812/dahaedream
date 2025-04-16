<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <title>의뢰수락 요청</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq"
            crossorigin="anonymous"></script>
</head>
<body class="bg-light">

<jsp:include page="../../fragment/navbar.jsp"/>

<div class="container py-5">
    <h1 class="text-center mb-4">의뢰수락 요청</h1>

    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
        <div class="col">
            <div class="card h-100 shadow-sm">
                <img src="" class="card-img-top" alt="썸네일 이미지">
                <div class="card-body">
                    <h5 class="card-title">수영 알려주실 분</h5>
                    <p class="card-text mb-1"><strong>카테고리:</strong> 수영</p>
                    <p class="card-text mb-1"><strong>포인트:</strong> <span id="point">30000</span>P</p>
                    <p class="card-text"><strong>해결사:</strong> <span id="targetName">홍길동</span></p>
                </div>
                <div class="card-footer p-0">
                    <div class="btn-group w-100" role="group">
                        <button class="btn btn-outline-secondary">취소</button>
                        <button class="btn btn-outline-success"
                                data-bs-toggle="modal"
                                data-bs-target="#acceptModal"
                                onclick="prepareModal('홍길동', 30000)">
                            수락
                        </button>
                        <button class="btn btn-outline-primary">쪽지 보내기</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100 shadow-sm">
                <img src="" class="card-img-top" alt="썸네일 이미지">
                <div class="card-body">
                    <h5 class="card-title">요리 알려주실 분</h5>
                    <p class="card-text mb-1"><strong>카테고리:</strong> 수영</p>
                    <p class="card-text mb-1"><strong>포인트:</strong> <span id="point">30000</span>P</p>
                    <p class="card-text"><strong>해결사:</strong> <span id="targetName">홍길동</span></p>
                </div>
                <div class="card-footer p-0">
                    <div class="btn-group w-100" role="group">
                        <button class="btn btn-outline-secondary">취소</button>
                        <button class="btn btn-outline-success"
                                data-bs-toggle="modal"
                                data-bs-target="#acceptModal"
                                onclick="prepareModal('홍길동', 30000)">
                            수락
                        </button>
                        <button class="btn btn-outline-primary">쪽지 보내기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 결제 확인 모달 -->
<div class="modal fade" id="acceptModal" tabindex="-1" aria-labelledby="acceptModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="acceptModalLabel">결제 확인</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>결제 하시겠습니까?</p>
                <p><strong>거래 대상:</strong> <span id="modalTarget">-</span></p>
                <p><strong>포인트:</strong> <span id="modalPoint">-</span>P</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니오</button>
                <button type="button" class="btn btn-success" onclick="handleAccept()">예</button>
            </div>
        </div>
    </div>
</div>

<!-- 스크립트 -->
<script>
    // 모달 열기 전에 거래 대상 및 포인트 설정
    function prepareModal(name, point) {
        document.getElementById('modalTarget').textContent = name;
        document.getElementById('modalPoint').textContent = point;
    }

    // 결제 처리
    function handleAccept() {
        const target = document.getElementById('modalTarget').textContent;
        const point = document.getElementById('modalPoint').textContent;

        alert(`${target}님에게 ${point}P 결제 처리되었습니다!`);

        // 실제 서버 처리로직이 들어갈 수 있음

        // 모달 닫기
        const modal = bootstrap.Modal.getInstance(document.getElementById('acceptModal'));
        modal.hide();
    }
</script>

</body>
</html>
