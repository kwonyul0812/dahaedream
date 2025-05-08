<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
</head>
<body>


<script>
  $(function () {
    $.ajax({
      url: '/login/loading',
      type: 'POST',
      success: function (data, status, xhr) {
        // jwt token을 local storage에 저장
        const token = xhr.getResponseHeader('Authorization');

        if (token) {
          console.log("토큰 : " + token);
          localStorage.setItem('jwtToken', token);
        } else {
          console.log("토큰 없음");
        }
        window.location.href = '/'; // 홈페이지로 이동
      },
      error: function (xhr, status, error) {
        if (xhr.status === 401) {
          alert('인증되지 않았습니다. 다시 로그인 해주세요.');
          window.location.href = '/login/signin'; // 로그인 페이지로 이동
        } else {
          alert('로그인 실패');
        }
      }
    });
  });

</script>


</body>
</html>