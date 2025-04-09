<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq"
            crossorigin="anonymous"></script>
    <title></title>

</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">

            <ul class="navbar-nav d-flex flex-row">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">의뢰목록</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        해결사
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">수락 대기중인 목록</a></li>
                        <li><a class="dropdown-item" href="#">수락한 의뢰</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        의뢰자
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/client/add">의뢰글 쓰기</a></li>
                        <li><a class="dropdown-item" href="/client/request">의뢰수락 요청</a></li>
                        <li><a class="dropdown-item" href="/client/list">의뢰 내역</a></li>
                    </ul>
                </li>
            </ul>


            <a class="navbar-brand mx-auto" href="#">로고</a>


            <ul class="navbar-nav d-flex flex-row">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">마이페이지</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">쪽지</a>
                </li>
                <li>
                    <a href="/login" class="btn btn-sm btn-outline-secondary" role="button">로그인</a>
                </li>
            </ul>
        </div>
    </div>
</nav>


</body>
</html>