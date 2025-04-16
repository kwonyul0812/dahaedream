<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <title>의뢰내역</title>

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
    <h1 class="mb-4 text-center">의뢰 내역</h1>

    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">

        <div class="col">
            <div class="card h-100 shadow-sm">
                <img src="" class="card-img-top" alt="썸네일 이미지">
                <div class="card-body">
                    <h5 class="card-title">수영 알려주실 분</h5>
                    <p class="card-text"><strong>상태:</strong> 대기중</p>
                </div>
                <div class="card-footer p-0">
                    <div class="btn-group w-100" role="group">
                        <button class="btn btn-outline-primary" onclick="location.href='/client/info'">수정</button>
                        <button class="btn btn-outline-danger" onclick="fnDelete()">삭제</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100 shadow-sm">
                <img src="" class="card-img-top" alt="썸네일 이미지">
                <div class="card-body">
                    <h5 class="card-title">요리 알려주실 분</h5>
                    <p class="card-text"><strong>상태:</strong> 대기중</p>
                </div>
                <div class="card-footer p-0">
                    <div class="btn-group w-100" role="group">
                        <button class="btn btn-outline-primary" onclick="location.href='/client/info'">수정</button>
                        <button class="btn btn-outline-danger" onclick="fnDelete()">삭제</button>
                    </div>
                </div>
            </div>
        </div>


    </div>
</div>

</body>
</html>
<script>
    function fnDelete() {

        if(confirm('삭제할까요?')) {
            alert('삭제되었습니다.');
        }

    }

</script>
