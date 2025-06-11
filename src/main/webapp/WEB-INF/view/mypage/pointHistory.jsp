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
    <style>
        body {
            background-color: #f3f5ff;
            font-family: 'Apple SD Gothic Neo', sans-serif;
        }

        .point-history-wrapper {
            flex-grow: 1;
            max-width: 900px;
            margin: 50px auto;
            padding: 50px;
            background: white;
            border-radius: 20px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.05);
        }

        .point-history-title {
            font-size: 28px;
            font-weight: 700;
            color: #333;
        }
    </style>
</head>
<body>

<c:import url="/WEB-INF/fragment/navbar.jsp"/>
<c:import url="/WEB-INF/fragment/pointbar.jsp"/>

<div class="d-flex">
    <c:import url="/WEB-INF/fragment/mypagebar.jsp"/>

    <div class="point-history-wrapper">
        <h4 class="text-center point-history-title mb-5">포인트 내역</h4>

        <!-- 탭 메뉴 -->
<%--        <ul class="nav nav-tabs mb-5">--%>
<%--            <li class="nav-item">--%>
<%--                <button class="nav-link tabSelector" id="depositTab" data-bs-toggle="tab"--%>
<%--                        data-type="deposit"--%>
<%--                        type="button">입금--%>
<%--                </button>--%>
<%--            </li>--%>
<%--            <li class="nav-item">--%>
<%--                <button class="nav-link tabSelector" id="withdrawTab" data-bs-toggle="tab"--%>
<%--                        data-type="withdraw"--%>
<%--                        type="button">출금--%>
<%--                </button>--%>
<%--            </li>--%>
<%--            <li class="nav-item">--%>
<%--                <button class="nav-link tabSelector" id="rechargeTab" data-bs-toggle="tab"--%>
<%--                        data-type="recharge"--%>
<%--                        type="button">충전--%>
<%--                </button>--%>
<%--            </li>--%>
<%--        </ul>--%>

        <table class="table text-center">
            <thead>
            <tr>
                <th class="w-20">거래 대상</th>
                <th class="w-20">유형</th>
                <th class="w-20">거래 포인트</th>
                <th class="w-20">날짜</th>
                <th class="w-20">잔액</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pointHistoryList}" var="pointHistory">
                <tr>
                    <td>${pointHistory.nickname}</td>
                    <c:choose>
                        <c:when test="${pointHistory.pointType eq '출금'}">
                            <td style="color: red">${pointHistory.pointType}</td>
                        </c:when>
                        <c:when test="${pointHistory.pointType eq '입금'}">
                            <td style="color: blue">${pointHistory.pointType}</td>
                        </c:when>
                        <c:when test="${pointHistory.pointType eq '충전'}">
                            <td style="color: green">${pointHistory.pointType}</td>
                        </c:when>
                    </c:choose>
                    <td>${pointHistory.changeAmount}</td>
                    <td>${pointHistory.formattedUpdateTime}</td>
                    <td>${pointHistory.balanceAfter}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>


<%--<tr class="tbodyTemplate">--%>
<%--    <td></td>--%>
<%--    <td></td>--%>
<%--    <td></td>--%>
<%--    <td></td>--%>
<%--    <td></td>--%>
<%--</tr>--%>


<script>
  // $(function () {
  //   $('.tabSelector').on('click', function () {
  //     const tabType = $(this).data('type'); // deposit, withdraw, recharge
  //
  //     // $.ajax({
  //     // });
  //   });
  // });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq"
        crossorigin="anonymous"></script>
</body>
</html>