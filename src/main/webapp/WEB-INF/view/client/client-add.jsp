<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <title>의뢰하기</title>

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
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow-lg">
                <div class="card-header bg-primary text-white text-center">
                    <h3 class="mb-0">의뢰하기</h3>
                </div>
                <div class="card-body">

                        <div class="mb-3">
                            <label class="form-label">제목</label>
                            <input type="text" class="form-control" placeholder="제목을 입력하세요">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">하는 일</label>
                            <input type="text" class="form-control" placeholder="예: 강습 등">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">진행 방법</label>
                            <select class="form-select">
                                <option selected disabled>선택하세요</option>
                                <option value="online">온라인</option>
                                <option value="offline">오프라인</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">기간</label>
                            <input type="text" class="form-control" placeholder="예: 2주, 1개월 등">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">이미지</label>
                            <input type="file" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">의뢰비</label>
                            <input type="text" class="form-control" placeholder="예: 100,000원">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">내용</label>
                            <textarea class="form-control" rows="4" placeholder="상세 내용을 입력하세요"></textarea>
                        </div>
                        <div class="mb-3 d-flex align-items-center">
                            <label class="form-label me-3 mb-0">의뢰 장소</label>
                            <button type="button" class="btn btn-outline-secondary btn-sm">On/Off</button>
                        </div>
                        <div class="mb-4">
                            <label class="form-label">주소</label>
                            <input type="text" class="form-control" placeholder="장소 주소를 입력하세요">
                        </div>
                        <div class="text-center">
                            <button class="btn btn-success px-4" onclick="fnSubmit()">의뢰 하기</button>
                        </div>

                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>

<script>
    function fnSubmit(){
        if(confirm('의뢰 하시겠습니까?')) {
            alert('등록되었습니다.');
            location.href='/request/list';
        }
    }

</script>
