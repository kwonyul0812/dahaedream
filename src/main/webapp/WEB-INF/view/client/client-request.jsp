<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <title>의뢰수락 요청</title>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jwt-decode@4.0.0/build/cjs/index.min.js"></script>

    <style>
        body {
            background-color: #f3f4ff;
            font-family: 'Apple SD Gothic Neo', sans-serif;
        }

        h1 {
            font-weight: 700;
            color: #333;
            margin-bottom: 20px;
        }

        .card {
            border: none;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.05);
            transition: transform 0.2s ease;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card-img-top {
            height: 180px;
            object-fit: cover;
            background-color: #eee;
        }

        .card-title {
            font-size: 18px;
            font-weight: bold;
            color: #222;
        }

        .card-text {
            font-size: 15px;
            color: #555;
        }

        .card-footer {
            background: none;
            border-top: none;
            padding: 0.75rem;
        }

        .btn-outline-secondary,
        .btn-outline-success,
        .btn-outline-primary {
            font-weight: 600;
            border-radius: 8px;
            transition: 0.3s;
        }

        .btn-outline-secondary:hover {
            background-color: #6c757d;
            color: white;
        }

        .btn-outline-success:hover {
            background-color: #198754;
            color: white;
        }

        .btn-outline-primary:hover {
            background-color: #0d6efd;
            color: white;
        }

        .modal-content {
            border-radius: 12px;
        }
    </style>
</head>
<body>

<c:import url="/WEB-INF/fragment/navbar.jsp"/>

<div class="container py-5">
    <h1 class="text-center">의뢰수락 요청</h1>
    <div id="requestCardList" class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4"></div>
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

<script>
    let requestId = null;
    let solverId = null;
    let memberId = 0;
    getMember();

    function getMember() {
        fetch("/getMember.dox", {
            method : "POST",
            headers : { "Content-Type": "application/json" },
            body : JSON.stringify({})
        })
            .then(res => res.json())
            .then(data => {
                memberId = data.memberId;
                fnGetRequest();
            });
    }

    function prepareModal(name, point, request_id, solver_id) {
        document.getElementById('modalTarget').textContent = name;
        document.getElementById('modalPoint').textContent = point;
        requestId = request_id;
        solverId = solver_id;
    }

    function handleAccept() {
        const target = document.getElementById('modalTarget').textContent;
        const point = document.getElementById('modalPoint').textContent;

        fetch("/point/withdrawal", {
            method: "POST",
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({
                memberId: memberId,
                changeAmount: point,
                targetId: solverId,
                pointType: "출금"
            })
        })
            .then(res => res.json())
            .then(data => {
                if (data.result === "fail") {
                    bootstrap.Modal.getInstance(document.getElementById('acceptModal')).hide();
                    alert("잔액이 부족합니다.");
                    return;
                }

                alert(target + '님에게 ' + point + 'P 결제 처리되었습니다!');

                return fetch("/point/deposit", {
                    method: "POST",
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({
                        memberId: solverId,
                        changeAmount: point,
                        targetId: memberId,
                        pointType: "입금"
                    })
                })
                    .then(res => res.json())
                    .then(data => {
                        return fetch("/client/editRequestAccept.dox", {
                            method: "POST",
                            headers: { 'Content-Type': 'application/json' },
                            body: JSON.stringify({
                                requestId: requestId,
                                solverId: solverId
                            })
                        })
                            .then(res => res.json())
                            .then(data => {
                                fnGetRequest();
                                bootstrap.Modal.getInstance(document.getElementById('acceptModal')).hide();
                            });
                    });
            });
    }

    function fnCancel(request_id, solver_id) {
        if (confirm('취소하시겠습니까?')) {
            fetch("/client/cancelRequest.dox", {
                method: "POST",
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ requestId: request_id, solverId: solver_id })
            })
                .then(res => res.json())
                .then(data => {
                    alert(data.message);
                    fnGetRequest();
                });
        }
    }

    function fnGetRequest() {
        fetch("/client/getRequestAccept.dox", {
            method: "POST",
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ clientId: memberId })
        })
            .then(res => res.json())
            .then(data => {
                const list = data.list || [];
                const container = document.getElementById('requestCardList');
                container.innerHTML = '';

                list.forEach(item => {
                    const card = `
                    <div class="col">
                        <div class="card h-100">
                            <img src="\${item.filePath || '/uploads/default.png'}" class="card-img-top" alt="썸네일 이미지">
                            <div class="card-body">
                                <h5 class="card-title">\${item.title}</h5>
                                <p class="card-text mb-1"><strong>카테고리:</strong> \${item.categoryName}</p>
                                <p class="card-text mb-1"><strong>포인트:</strong> <span>\${item.price}</span>P</p>
                                <p class="card-text"><strong>해결사:</strong> <span>\${item.solverName}</span></p>
                            </div>
                            <div class="card-footer">
                                <div class="btn-group w-100" role="group">
                                    <button class="btn btn-outline-secondary" onclick="fnCancel(\${item.requestId}, \${item.solverId})">취소</button>
                                    <button class="btn btn-outline-success"
                                            data-bs-toggle="modal"
                                            data-bs-target="#acceptModal"
                                            onclick="prepareModal('\${item.solverName}', \${item.price}, \${item.requestId}, \${item.solverId})">
                                        수락
                                    </button>
                                    <button class="btn btn-outline-primary" onclick="location.href='/message/write'">쪽지 보내기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                `;
                    container.insertAdjacentHTML('beforeend', card);
                });
            });
    }
</script>

</body>
</html>
