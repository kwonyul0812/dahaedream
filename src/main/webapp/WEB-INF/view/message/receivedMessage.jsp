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
    <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"
    ></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jwt-decode@4.0.0/build/cjs/index.min.js"></script>
</head>
<body>

<c:import url="/WEB-INF/fragment/navbar.jsp"/>


<div class="d-flex">
    <c:import url="/WEB-INF/fragment/messagebar.jsp"/>

    <div style="flex-grow: 1; height: 500px">
        <div class="d-flex flex-column justify-content-center align-items-center">
            <h4 class="text-center mt-5 mb-5">받은 쪽지</h4>

            <div class="w-75">
                <table class="table text-center">
                    <thead>
                    <tr>
                        <th class="w-20">보낸 사람</th>
                        <th class="w-50">제목</th>
                        <th class="w-25">날짜</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr id="test">
                        <td>홍길동</td>
                        <td>테스트 제목 1</td>
                        <td>25-04-14</td>
                    </tr>
                    <tr>
                        <td>김길동</td>
                        <td>테스트 제목 2</td>
                        <td>25-04-11</td>
                    </tr>
                    <tr>
                        <td>김길동</td>
                        <td>테스트 제목 3</td>
                        <td>25-04-10</td>
                    </tr>
                    <tr>
                        <td>김길동</td>
                        <td>테스트 제목 4</td>
                        <td>25-04-09</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script>
  $(function () {
    $('#test').on('click', function () {
      window.location.href = '/message/read';
    })
  });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq"
        crossorigin="anonymous"></script>
</body>
</html>