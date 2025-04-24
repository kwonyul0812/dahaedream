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

<h4>db 데이터 테스트</h4>

<div>
    <table class="table">
        <thead>
        <tr>
            <th>id</th>
            <th>name</th>
            <th>email</th>
        </tr>
        </thead>
        <tbody id="testDataBody">
        <c:forEach var="data" items="${testData}">
            <tr>
                <td>${data.id}</td>
                <td>${data.name}</td>
                <td>${data.email}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div>
    <button id="testBtn" class="btn btn-primary">에이잭스 테스트</button>
</div>

<script>
    $(function() {
      $('#testBtn').on('click', function() {
        $.ajax({
          url: 'test/data', // 컨트롤러 매핑 주소
          type: 'GET',
          success: function(res) { // 성공시
            $('#testDataBody').empty();

            $.each(res, function(index, data) {
              $('#testDataBody').append(
                '<tr>' +
                    '<td>' + data.id + '</td>' +
                    '<td>' + data.name + '</td>' +
                    '<td>' + data.email + '</td>' +
                '</tr>'
              );
            });
          },
          error: function(err) { // 에러 발생시
            alert("데이터 요청 실패");
          },
          complete: function() { // 성공 혹은 실패 후 반드시 실행하는 코드
            alert("ajax 알림");
          }
        })
      })
    })

</script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq"
        crossorigin="anonymous"></script>
</body>
</html>