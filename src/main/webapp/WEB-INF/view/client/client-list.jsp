<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>의뢰 내역</title>

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
    <h2 class="text-center mb-4 fw-bold">나의 의뢰 내역</h2>

    <div id="requestList" class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
        <!-- 카드들이 여기에 삽입됩니다 -->
    </div>
</div>

<script>
    fnGet();

    function fnDelete(requestId) {
        if (confirm('정말 삭제하시겠습니까?')) {
            fetch("/client/delete.dox", {
                method: "POST",
                headers: {'Content-Type': 'application/json'},
                body: JSON.stringify({requestId})
            })
                .then(res => res.json())
                .then(data => {
                    alert(data.message);
                    fnGet();
                });
        }
    }

    function fnGet() {
        const token = localStorage.getItem('jwtToken');
        const decoded = token ? jwtDecode(token) : null;

        fetch("/client/getRequest.dox", {
            method: "POST",
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify({memberId: decoded?.memberId})
        })
            .then(res => res.json())
            .then(data => {
                const container = document.getElementById('requestList');
                container.innerHTML = '';

                const items = Array.isArray(data.list) ? data.list : [data.list];

                items.forEach(item => {
                    let buttonHTML = '';

                    if (item.status === '대기중') {
                        buttonHTML = `
                            <button class="btn btn-outline-primary w-50" onclick="location.href='/client/info?requestId=${item.requestId}'">수정</button>
                            <button class="btn btn-outline-danger w-50" onclick="fnDelete(${item.requestId})">삭제</button>
                        `;
                    } else if (item.status === '진행중') {
                        buttonHTML = `<button class="btn btn-outline-secondary w-100" disabled>진행중</button>`;
                    } else if (item.status === '완료') {
                        buttonHTML = `<button class="btn btn-success w-100" onclick="fnComplete(${item.requestId})">완료 처리</button>`;
                    }

                    const imageUrl = item.thumbnailUrl || 'https://via.placeholder.com/400x180?text=No+Image';

                    const cardHTML = `
                        <div class="col">
                            <div class="card h-100 shadow-sm">
                                <img src="\${imageUrl}" class="card-img-top" alt="썸네일">
                                <div class="card-body">
                                    <h5 class="card-title">\${item.title}</h5>
                                    <p class="card-text"><strong>상태:</strong> \${item.status}</p>
                                </div>
                                <div class="card-footer bg-white border-top-0">
                                    <div class="d-flex justify-content-between gap-2">
                                        \${buttonHTML}
                                    </div>
                                </div>
                            </div>
                        </div>
                    `;
                    container.insertAdjacentHTML('beforeend', cardHTML);
                });
            });
    }

    function fnComplete(requestId) {
        fetch("/client/completeRequest.dox", {
            method: "POST",
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify({requestId})
        })
            .then(res => res.json())
            .then(data => {
                alert(data.message || "완료 처리되었습니다.");
                fnGet();
            });
    }
</script>

</body>
</html>
