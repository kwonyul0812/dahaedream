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
    <style>
        .find-links li:not(:last-child)::after {
            content: "|";
            margin-left: 10px;
            margin-right: 10px;
            color: #aaa;
        }
        .find-links li {
            margin-top: 10px;
        }
        a {
            color: #212529;
            text-decoration: none;
        }
    </style>
</head>
<body>

<c:import url="/WEB-INF/fragment/navbar.jsp"/>

<div class="bg-light rounded mx-auto" style="width: 500px; height: 380px; margin-top: 100px">
    <form action="/login" method="post" class="p-4">
        <h4 class="text-center mb-4">로그인</h4>

        <div class="form-floating mb-3">
            <input type="email" class="form-control" id="emailId" name="email" required>
            <label for="emailId">이메일 아이디</label>
        </div>

        <div class="form-floating mb-3">
            <input type="password" class="form-control" id="password" name="password" required>
            <label for="password">비밀번호</label>
        </div>

        <div class="d-grid">
            <button type="submit" class="btn mb-1" style="background-color: greenyellow">로그인</button>
        </div>
    </form>
    <button class="btn" style="width: 450px;background-color: #f3dc00; margin-left: 25px; margin-top: -20px">카카오 로그인</button>

    <ul class="d-flex justify-content-center list-unstyled find-links" style="margin-bottom: 100px">
        <li><a href="">비밀번호 찾기</a></li>
        <li><a href="">아이디 찾기</a></li>
        <li><a href="/login/signup">회원가입</a></li>
    </ul>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq"
        crossorigin="anonymous"></script>
</body>
</html>