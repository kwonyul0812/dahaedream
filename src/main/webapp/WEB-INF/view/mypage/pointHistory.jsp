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
    <c:import url="/WEB-INF/fragment/mypagebar.jsp"/>

    <div style="flex-grow: 1; height: 500px">
        <c:import url="/WEB-INF/fragment/pointbar.jsp"/>
        <div class="d-flex flex-column justify-content-center align-items-center">
            <h4 class="text-center mt-5 mb-5">포인트 내역</h4>

            <div class="w-75">
                <table class="table text-center">
                    <thead>
                    <tr>
                        <th class="w-20">대상</th>
                        <th class="w-20">거래 포인트</th>
                        <th class="w-20">날짜</th>
                        <th class="w-20">유형</th>
                        <th class="w-20">잔액</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>홍길동</td>
                        <td>30000</td>
                        <td>25-03-31</td>
                        <td>출금</td>
                        <td>60000</td>
                    </tr>
                    <tr>
                        <td>길동무</td>
                        <td>20000</td>
                        <td>25-03-30</td>
                        <td>입금</td>
                        <td>90000</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq"
        crossorigin="anonymous"></script>
</body>
</html>