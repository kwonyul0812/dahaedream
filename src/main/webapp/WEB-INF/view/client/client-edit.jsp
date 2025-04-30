<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <title>의뢰하기</title>
    <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"
    ></script>
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
                        <input type="text" class="form-control" placeholder="제목을 입력하세요" value="수영알려주실 분">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">하는 일</label>
                        <input type="text" class="form-control" placeholder="예: 강습" value="수영 강습">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">진행 방법</label>
                        <select class="form-select">
                            <option disabled>선택하세요</option>
                            <option value="online">온라인</option>
                            <option value="offline" selected>오프라인</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">기간</label>
                        <input type="text" class="form-control" placeholder="예: 2주, 1개월 등" value="3주">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">이미지</label>
                        <input type="file" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">의뢰비</label>
                        <input type="text" class="form-control" placeholder="예: 100,000원" value="300,000원">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">내용</label>
                        <textarea class="form-control" rows="4" placeholder="상세 내용을 입력하세요">안녕하세요 저는 수영 초보 이고 물에만 뜨게 해주시면 되요 주2회 만나서 수영 알려주시면 좋겠어요
                        </textarea>
                    </div>
                    <div class="mb-3 d-flex align-items-center">
                        <label class="form-label me-3 mb-0">의뢰 장소</label>
                        <button type="button" class="btn btn-outline-secondary btn-sm">On/Off</button>
                    </div>
                    <div class="mb-4">
                        <label class="form-label">주소</label>
                        <input type="text" class="form-control" placeholder="장소 주소를 입력하세요" value="서울시 강남구 테헤란로 123">
                    </div>
                    <div class="text-center">
                        <button class="btn btn-success px-4" onclick="fnUpdate()">수정</button>
                        <button class="btn btn-danger px-4" onclick="fnDelete()">삭제</button>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>

<script>
    function fnUpdate(){
        if(confirm('수정 하시겠습니까?')) {
            alert('수정되었습니다.');
        }
    }
    function fnDelete(){
        if(confirm('삭제 하시겠습니까?')) {
            alert('삭제되었습니다.');
        }
    }
</script>