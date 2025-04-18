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
</head>
<body>

<c:import url="/WEB-INF/fragment/navbar.jsp"/>


<div class="d-flex">
    <c:import url="/WEB-INF/fragment/mypagebar.jsp"/>

    <div style="flex-grow: 1; height: 500px">
        <c:import url="/WEB-INF/fragment/pointbar.jsp"/>
        <div class="d-flex flex-column justify-content-center align-items-center">
            <h4 class="text-center mt-5 mb-5">포인트 충전</h4>

            <div class="w-75 mb-5">
                <div class="d-flex justify-content-evenly">
                    <button class="btn btn-secondary fs-4" id="point1" style="width: 8%">1만</button>
                    <button class="btn btn-secondary fs-4" id="point2" style="width: 8%">3만</button>
                    <button class="btn btn-secondary fs-4" id="point3" style="width: 8%">5만</button>
                    <button class="btn btn-secondary fs-4" id="point4" style="width: 8%">10만</button>
                </div>
            </div>
            <div class="d-flex w-100 mt-5 mb-5 justify-content-center">
                <span class="fs-4 me-3">포인트 : </span>
                <input type="text" class="form-control form-control-lg me-3" id="pointInput" style="width: 200px">
                <button class="btn btn-lg btn-danger" id="reset-btn">초기화</button>
            </div>
            <div>
                <button class="btn btn-lg btn-primary">충전</button>
            </div>
        </div>
    </div>
</div>

<script>
  $(function () {
    let point=0;

    $('button').on('click', function () {
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

    $('#reset-btn').on('click', function() { // 초기화 버튼 클릭시
      point = 0;
      $('#pointInput').val(point);
    });

    // 사용자가 직접 입력창의 값을 수정했을 때
    $('#pointInput').on('input', function () {
      const inputVal = parseInt($(this).val());
      // 숫자면 반영, 아니면 0으로
      point = isNaN(inputVal) ? 0 : inputVal;
    });
  });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq"
        crossorigin="anonymous"></script>
</body>
</html>