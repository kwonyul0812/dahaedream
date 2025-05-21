<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>수락대기중 의뢰</title>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"></script>

    <!-- JWT Decode -->
    <script src="https://cdn.jsdelivr.net/npm/jwt-decode@4.0.0/build/cjs/index.min.js"></script>

    <style>
        .card-img-top {
            height: 180px;
            object-fit: cover;
        }
    </style>
</head>

<body class="bg-light">

<jsp:include page="../../fragment/navbar.jsp"/>

<div class="container py-5">
    <h2 class="text-center mb-4 fw-bold">수락 대기중인 의뢰</h2>

    <div id="request-list" class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
        <!-- 카드가 삽입될 자리 -->
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", getRequestList);

    function getRequestList() {
        const token = localStorage.getItem('jwtToken');
        const decoded = token ? jwtDecode(token) : null;

        fetch("/solver/getRequest.dox", {
            method: "POST",
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ solverId: decoded?.memberId })
        })
            .then(res => res.json())
            .then(data => {
                const items = data.list
                    ? (Array.isArray(data.list) ? data.list : [data.list])
                    : [];

                const container = document.getElementById("request-list");
                container.innerHTML = "";

                items.forEach(item => {
                    const imageUrl = item.thumbnailUrl || "https://via.placeholder.com/400x180?text=No+Image";

                    const cardHTML = `
                    <div class="col">
                        <div class="card h-100 shadow-sm">
                            <img src="\${imageUrl}" class="card-img-top" alt="썸네일">
                            <div class="card-body">
                                <h5 class="card-title">\${item.title}</h5>
                                <p class="card-text mb-1"><strong>가격:</strong> \${item.price}P</p>
                                <p class="card-text"><strong>작성시간:</strong> \${item.createdAt}</p>
                            </div>
                            <div class="card-footer bg-white border-top-0 d-flex justify-content-between p-3">
                                <button class="btn btn-outline-danger w-50 me-2" onclick="cancelRequest(\${item.requestId})">취소</button>
                                <button class="btn btn-outline-primary w-50" onclick="location.href='/client/info?requestId=\${item.requestId}'">자세히 보기</button>
                            </div>
                        </div>
                    </div>
                `;

                    container.insertAdjacentHTML("beforeend", cardHTML);
                });
            })
            .catch(err => console.error("에러 발생:", err));
    }

    function cancelRequest(requestId) {
        if (!confirm("정말 취소하시겠습니까?")) return;

        fetch(`/solver/cancel?requestId=\${requestId}`, {
            method: "POST"
        })
            .then(res => {
                if (!res.ok) throw new Error("요청 실패");
                alert("취소되었습니다.");
                getRequestList(); // 갱신
            })
            .catch(err => console.error("취소 에러:", err));
    }
</script>

</body>
</html>
