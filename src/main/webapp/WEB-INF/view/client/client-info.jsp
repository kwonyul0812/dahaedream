<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>의뢰 상세 정보</title>

    <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"
    ></script>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jwt-decode@4.0.0/build/cjs/index.min.js"></script>

</head>
<body class="bg-light">
<jsp:include page="../../fragment/navbar.jsp"/>

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow">
                <div class="card-header bg-primary text-white text-center">
                    <h3 class="mb-0">의뢰 상세 정보</h3>
                </div>
                <div class="card-body">

                    <dl class="row mb-3">
                        <dt class="col-sm-3">제목</dt>
                        <dd class="col-sm-9" id="title"></dd>

                        <dt class="col-sm-3">의뢰자</dt>
                        <dd class="col-sm-9" id="nickname"></dd>

                        <dt class="col-sm-3">카테고리</dt>
                        <dd class="col-sm-9" id="category"></dd>

                        <dt class="col-sm-3">온라인/오프라인</dt>
                        <dd class="col-sm-9" id="onOff"></dd>

                        <dt class="col-sm-3">기간</dt>
                        <dd class="col-sm-9">3주</dd>

                        <dt class="col-sm-3">의뢰비</dt>
                        <dd class="col-sm-9" id="price"></dd>

                        <dt class="col-sm-3">내용</dt>
                        <dd class="col-sm-9" id="content"></dd>

                        <dt class="col-sm-3">주소</dt>
                        <dd class="col-sm-9">서울시 강남구 테헤란로 123</dd>

                        <dt class="col-sm-3">등록일</dt>
                        <dd class="col-sm-9" id="createdAt"></dd>

                        <dt class="col-sm-3">상태</dt>
                        <dd class="col-sm-9" id="status"></dd>
                    </dl>

                    <div class="text-center mt-4">
                        <a href="/request/list" class="btn btn-secondary">목록으로</a>
                        <button id="acceptBtn" style="display: none" class="btn btn-primary">의뢰 수락 요청</button>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>
<script>
    $(function () {

        const urlParams = new URLSearchParams(window.location.search);
        const requestId = urlParams.get("requestId");

        console.log("페이지 로드 됨!");
        fetch("/client/info.dox", {
            method : "POST",
            headers : {
                "Content-type" : "application/json"
            },
            body : JSON.stringify({requestId : requestId})
        })
            .then(res => res.json())
            .then(data => {
                console.log(data);
                const info = data.info;
                document.getElementById("title").textContent = info.title;
                document.getElementById("nickname").textContent = info.nickname;
                document.getElementById("category").textContent = info.categoryName;
                document.getElementById("onOff").textContent = info.isOnline === "online" ? "온라인" : "오프라인";
                document.getElementById("price").textContent = Number(info.price).toLocaleString() + "P";
                document.getElementById("content").textContent = info.content;
                document.getElementById("createdAt").textContent = info.createdAt;
                document.getElementById("status").textContent = info.status;
                const token = localStorage.getItem('jwtToken');
                if(token) {
                    const decoded = jwtDecode(token);
                    console.log("로그인한 사용자 ID:", decoded.memberId);

                    console.log("의뢰 작성자 ID:", info.memberId);
                    if (decoded.memberId !== info.memberId) {
                        // 작성자가 아닌 경우 → 버튼 보이기
                        document.getElementById("acceptBtn").style.display = "inline-block";
                    }
                } else {
                    console.log('토큰 없음!');

                }
            });

    });





</script>

