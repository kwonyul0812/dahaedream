<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>의뢰 상세 정보</title>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jwt-decode@4.0.0/build/cjs/index.min.js"></script>

    <style>
        .card-custom {
            border-radius: 1rem;
            overflow: hidden;
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
        }

        dt {
            font-weight: bold;
            color: #343a40;
        }

        dd {
            margin-bottom: 1rem;
        }

        .info-label {
            font-weight: 500;
            color: #6c757d;
        }

        .info-value {
            font-size: 1.05rem;
        }

        .btn-custom {
            min-width: 120px;
        }

        .btn-primary:hover, .btn-secondary:hover {
            transform: translateY(-1px);
        }
    </style>
</head>
<body class="bg-light">
<jsp:include page="../../fragment/navbar.jsp"/>

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card card-custom">
                <div class="card-header bg-primary text-white text-center py-3">
                    <h3 class="mb-0">의뢰 상세 정보</h3>
                </div>
                <div class="card-body px-4 py-4">

                    <dl class="row">
                        <dt class="col-sm-4">제목</dt>
                        <dd class="col-sm-8 info-value" id="title"></dd>

                        <dt class="col-sm-4">의뢰자</dt>
                        <dd class="col-sm-8 info-value" id="nickname"></dd>

                        <dt class="col-sm-4">카테고리</dt>
                        <dd class="col-sm-8 info-value" id="category"></dd>

                        <dt class="col-sm-4">방식</dt>
                        <dd class="col-sm-8 info-value" id="onOff"></dd>

                        <dt class="col-sm-4">기간</dt>
                        <dd class="col-sm-8 info-value">3주</dd>

                        <dt class="col-sm-4">의뢰비</dt>
                        <dd class="col-sm-8 info-value" id="price"></dd>

                        <dt class="col-sm-4">내용</dt>
                        <dd class="col-sm-8 info-value" id="content"></dd>

                        <dt class="col-sm-4">주소</dt>
                        <dd class="col-sm-8 info-value" id="address"></dd>

                        <dt class="col-sm-4">등록일</dt>
                        <dd class="col-sm-8 info-value" id="createdAt"></dd>

                        <dt class="col-sm-4">상태</dt>
                        <dd class="col-sm-8 info-value" id="status"></dd>
                    </dl>

                    <div class="text-center mt-4">
                        <a href="/request/list" class="btn btn-secondary btn-custom me-2">목록으로</a>
                        <button id="acceptBtn" style="display: none" class="btn btn-primary btn-custom" onclick="fnSend()">의뢰 수락 요청</button>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<script>
    let memberId = 0;
    getMember();
    function getMember() {
        fetch("/getMember.dox", {
            method : "POST",
            headers : { "Content-Type": "application/json" },
            body : JSON.stringify()
        })
            .then(res => res.json())
            .then(data => {
                console.log(data);
                memberId = data.memberId;
            })
    }

    function fnGetList() {
        const urlParams = new URLSearchParams(window.location.search);
        const requestId = urlParams.get("requestId");
        fetch("/client/info.dox", {
            method: "POST",
            headers: {
                "Content-type": "application/json"
            },
            body: JSON.stringify({
                requestId: requestId,
                solverId: memberId
            })
        })
            .then(res => res.json())
            .then(data => {
                const info = data.info;
                document.getElementById("title").textContent = info.title;
                document.getElementById("nickname").textContent = info.nickname;
                document.getElementById("category").textContent = info.categoryName;
                document.getElementById("onOff").textContent = info.isOnline === "online" ? "온라인" : "오프라인";
                document.getElementById("price").textContent = Number(info.price).toLocaleString() + "P";
                document.getElementById("content").textContent = info.content;
                document.getElementById("createdAt").textContent = info.createdAt;
                document.getElementById("status").textContent = info.status;
                if(memberId !== 0) {
                    if (memberId !== info.memberId) {
                        document.getElementById("acceptBtn").style.display = "inline-block";
                        if (data.alreadySent) {
                            const btn = document.getElementById("acceptBtn");
                            btn.textContent = "보낸 의뢰";
                            btn.disabled = true;
                            btn.classList.remove("btn-primary");
                            btn.classList.add("btn-secondary");
                        }
                    }
                } else {
                    alert('로그인이 필요합니다.');
                    return;
                }
            });
    }

    function fnSend() {
        const urlParams = new URLSearchParams(window.location.search);
        const requestId = urlParams.get("requestId");
        const token = localStorage.getItem('jwtToken');

        if (token) {
            const decoded = jwtDecode(token);
            fetch("/solver/send.dox", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify({ requestId, solverId: decoded.memberId })
            })
                .then(res => res.json())
                .then(data => {
                    alert("의뢰 수락 요청을 보냈습니다.");
                    fnGetList();
                });
        }
    }

    fnGetList();
</script>

</body>
</html>
