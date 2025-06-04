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
    <script src="https://cdn.portone.io/v2/browser-sdk.js"></script>
    <style>
        body {
            background-color: #f3f5ff;
            font-family: 'Apple SD Gothic Neo', sans-serif;
        }

        .point-wrapper {
            flex-grow: 1;
            max-width: 900px;
            margin: 50px auto;
            padding: 50px;
            background: white;
            border-radius: 20px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.05);
        }

        .point-title {
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

    <div class="point-wrapper">

        <h4 class="text-center point-title mb-5">포인트 충전</h4>

        <div class="mb-5">
            <div class="d-flex justify-content-evenly">
                <button class="btn btn-secondary fs-4 amountBtn" id="point1">1만</button>
                <button class="btn btn-secondary fs-4 amountBtn" id="point2">3만</button>
                <button class="btn btn-secondary fs-4 amountBtn" id="point3">5만</button>
                <button class="btn btn-secondary fs-4 amountBtn" id="point4">10만</button>
            </div>
        </div>
        <div class="d-flex w-100 mt-5 mb-5 justify-content-center">
            <span class="fs-4 me-3">포인트 : </span>
            <input type="text" class="form-control form-control-lg me-3" id="pointInput" style="width: 200px">
            <button class="btn btn-lg btn-danger" id="reset-btn">초기화</button>
        </div>
        <div class="text-center">
            <button class="btn btn-lg btn-primary" id="addPointBtn">충전</button>
        </div>
    </div>
</div>

<script>
  $(function () {
    let point = 0;

    $('.amountBtn').on('click', function () {
      const id = $(this).attr('id');

      if (id === 'point1') { // 1만 을 클릭했을때
        point += 10000;
        $('#pointInput').val(point);
      } else if (id === 'point2') { // 3만 을 클릭했을때
        point += 30000;
        $('#pointInput').val(point);
      } else if (id === 'point3') { // 5만 을 클릭했을때
        point += 50000;
        $('#pointInput').val(point);
      } else if (id === 'point4') { // 10만 을 클릭했을때
        point += 100000;
        $('#pointInput').val(point);
      }
    });

    $('#reset-btn').on('click', function () { // 초기화 버튼 클릭시
      point = 0;
      $('#pointInput').val(point);
    });

    // 사용자가 직접 입력창의 값을 수정했을 때
    $('#pointInput').on('input', function () {
      const inputVal = parseInt($(this).val());
      // 숫자면 반영, 아니면 0으로
      point = isNaN(inputVal) ? 0 : inputVal;
    });

    $('#addPointBtn').on('click', async function () {
      const point = $('#pointInput').val();
      userRes = await $.ajax({
        url: '/auth/getUser',
        type: 'GET',
      });

      const response = await requestPayment(point, userRes.email, userRes.nickname);

      if (response.code !== undefined) {
        // response.code 의 값이 있을 경우 오류 발생을 의미
        // response.code 의 값이 undefined의 경우 결제 성공을 의미
        // 오류 발생
        return alert(response.message);
      } else {
        // 결제 성공 이후 포인트 충전 로직 필요
        $.ajax({
          url: '/mypage/addPoint',
          type: 'POST',
          data: {
            point: point
          },
          success: function () {
            alert('포인트 충전 성공');
            location.reload();
          }
        })
      }

    })
  });

  async function requestPayment(point, email, nickname) {
    const random = crypto.randomUUID();
    return await PortOne.requestPayment({
      storeId: "store-609fd8d9-45b9-4c78-a314-f4b7dd2d4986", // 고객사 storeId로 변경해주세요.
      channelKey: "channel-key-731334c3-0464-43b1-bf87-322040ab1642", // 콘솔 결제 연동 화면에서 채널 연동 시 생성된 채널 키를 입력해주세요.
      paymentId: random,
      orderName: "다해드림 " + point + "p",
      totalAmount: point,
      currency: "CURRENCY_KRW",
      payMethod: "CARD",
      customer: {
        fullName: nickname,
        phoneNumber: "010-1234-1234",
        email: email,
      },
    });
  }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq"
        crossorigin="anonymous"></script>
</body>
</html>