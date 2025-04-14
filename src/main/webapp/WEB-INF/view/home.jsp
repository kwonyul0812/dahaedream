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
</head>
<body>

<c:import url="/WEB-INF/fragment/navbar.jsp"/>

<div class="w-75 mx-auto">
    <div class="mt-5 mb-5">
        <h4 class="text-start">음식 하는법 알려주세요</h4>
        <div class="bg-body-secondary rounded mt-3 d-flex justify-content-evenly">
            <div class="d-flex flex-column align-items-center">
                <img src="https://picsum.photos/200/200" class="rounded mt-4" >
                <p class="mt-3">제목1</p>
            </div>
            <div class="d-flex flex-column align-items-center">
                <img src="https://picsum.photos/200/200" class="rounded mt-4">
                <p class="mt-3">테스트 제목</p>
            </div>
            <div class="d-flex flex-column align-items-center">
                <img src="https://picsum.photos/200/200" class="rounded mt-4">
                <p class="mt-3">테스트 제목2</p>
            </div>
            <div class="d-flex flex-column align-items-center">
                <img src="https://picsum.photos/200/200" class="rounded mt-4">
                <p class="mt-3">주방 잡일 해줘</p>
            </div>
        </div>
    </div>
    <div class="mb-5" style="margin-top: 120px">
        <h4 class="text-start">수영 하는법 알려주세요</h4>
        <div class="bg-body-secondary rounded mt-3 d-flex justify-content-evenly">
            <div class="d-flex flex-column align-items-center">
                <img src="https://picsum.photos/200/200" class="rounded mt-4" >
                <p class="mt-3">제목1</p>
            </div>
            <div class="d-flex flex-column align-items-center">
                <img src="https://picsum.photos/200/200" class="rounded mt-4">
                <p class="mt-3">테스트 제목</p>
            </div>
            <div class="d-flex flex-column align-items-center">
                <img src="https://picsum.photos/200/200" class="rounded mt-4">
                <p class="mt-3">테스트 제목2</p>
            </div>
            <div class="d-flex flex-column align-items-center">
                <img src="https://picsum.photos/200/200" class="rounded mt-4">
                <p class="mt-3">주방 잡일 해줘</p>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq"
        crossorigin="anonymous"></script>
</body>
</html>