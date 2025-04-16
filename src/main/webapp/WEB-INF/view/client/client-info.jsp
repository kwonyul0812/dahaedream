<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>의뢰 상세 정보</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet"
          crossorigin="anonymous">
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
                        <dd class="col-sm-9">수영알려주실 분</dd>

                        <dt class="col-sm-3">하는 일</dt>
                        <dd class="col-sm-9">수영 강습</dd>

                        <dt class="col-sm-3">진행 방법</dt>
                        <dd class="col-sm-9">오프라인</dd>

                        <dt class="col-sm-3">기간</dt>
                        <dd class="col-sm-9">3주</dd>

                        <dt class="col-sm-3">의뢰비</dt>
                        <dd class="col-sm-9">300,000원</dd>

                        <dt class="col-sm-3">내용</dt>
                        <dd class="col-sm-9">
                            안녕하세요 저는 수영 초보 이고 물에만 뜨게 해주시면 되요. <br>
                            주 2회 만나서 수영 알려주시면 좋겠어요.
                        </dd>

                        <dt class="col-sm-3">주소</dt>
                        <dd class="col-sm-9">서울시 강남구 테헤란로 123</dd>

                        <dt class="col-sm-3">이미지</dt>
                        <dd class="col-sm-9">
                            <img src="/upload/sample-swim.jpg" class="img-fluid rounded" alt="의뢰 이미지">
                        </dd>
                    </dl>

                    <div class="text-center mt-4">
                        <a href="/request/list" class="btn btn-secondary">목록으로</a>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
