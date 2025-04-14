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


<div class="d-flex">
    <c:import url="/WEB-INF/fragment/messagebar.jsp"/>

    <div style="flex-grow: 1; height: 500px">
        <div class="d-flex flex-column justify-content-center align-items-center">
            <h4 class="text-center mt-5 mb-5">쪽지 쓰기</h4>

            <div style="width: 50%">

                <!-- 받는 이 -->
                <div class="row mb-3">
                    <label class="col-2 col-form-label text-end">받는 사람</label>
                    <div class="col-10">
                        <input type="text" class="form-control" placeholder="닉네임 입력"/>
                    </div>
                </div>

                <!-- 제목 -->
                <div class="row mb-3">
                    <label class="col-2 col-form-label text-end">제목</label>
                    <div class="col-10">
                        <input type="text" class="form-control" placeholder="제목 입력"/>
                    </div>
                </div>

                <!-- 내용 -->
                <div class="row mb-3">
                    <label class="col-2 col-form-label text-end">내용</label>
                    <div class="col-10">
                        <textarea class="form-control" rows="10" style="resize: none" placeholder="내용 입력"></textarea>
                    </div>
                </div>

                <!-- 버튼 -->
                <div class="row mt-5">
                    <div class="offset-3 col-9 text-end">
                        <button class="btn btn-primary">보내기</button>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq"
        crossorigin="anonymous"></script>
</body>
</html>