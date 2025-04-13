<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
</head>
<body>

<c:import url="/WEB-INF/fragment/navbar.jsp"/>


<div class="bg-light rounded mx-auto" style="width: 700px; margin-top: 30px">
    <form action="/login" method="post" class="p-4">
        <h4 class="text-center mb-4">회원정보 수정</h4>

        <div class="input-group mb-3">
            <input type="text" class="form-control" placeholder="이메일" value="kwonyul99" disabled>
            <span class="input-group-text">@</span>
            <input type="text" class="form-control" value="naver.com" disabled>
        </div>
        <div class="input-group mb-3">
            <input type="password" class="form-control" placeholder="비밀번호">
        </div>
        <div class="input-group mb-3">
            <input type="password" class="form-control" placeholder="비밀번호 확인">
        </div>
        <div class="input-group mb-3">
            <input type="text" class="form-control" placeholder="닉네임" value="권율장군">
        </div>
        <div class="input-group mb-3">
            <input type="text" class="form-control" placeholder="주소" value="경기도 고양시 일산동구 마두1동">
            <button class="btn btn-outline-secondary" type="button" id="button-addon2">주소 찾기</button>
        </div>
        <div class="input-group mb-3">
            <input type="text" class="form-control" placeholder="핸드폰" value="010">
            <span class="input-group-text">-</span>
            <input type="text" class="form-control" value="4440">
            <span class="input-group-text">-</span>
            <input type="text" class="form-control" value="2063">
        </div>
        <div class="text-end">
            <button type="submit" class="btn btn-primary">수정</button>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq"
        crossorigin="anonymous"></script>
</body>
</html>