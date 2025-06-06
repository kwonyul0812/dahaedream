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

        .signin-wrapper {
            max-width: 500px;
            margin: 50px auto;
            padding: 50px;
            background: white;
            border-radius: 20px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.05);
        }

        .kakaoBtn {
            background-color: #FEE500;
        }
        .kakaoBtn:hover {
            background-color: #e0c900;
        }

        .signin-title {
            font-size: 28px;
            font-weight: 700;
            color: #333;
        }
    </style>
</head>
<body>

<c:import url="/WEB-INF/fragment/navbar.jsp"/>

<div class="signin-wrapper">

    <form action="/login" class="mb-2" id="loginForm">
        <div class="text-center signin-title mb-5">로그인</div>
        <div class="form-floating mb-3">
            <input type="email" class="form-control" id="emailId" name="email" required>
            <label for="emailId">이메일 아이디</label>
        </div>

        <div class="form-floating mb-3">
            <input type="password" class="form-control" id="password" name="password" required>
            <label for="password">비밀번호</label>
        </div>

        <div class="d-grid mb-2">
            <button type="submit" class="btn btn-primary">로그인</button>
        </div>
        <a href="/oauth2/authorization/kakao" class="d-grid btn kakaoBtn" role="button">
            카카오 로그인
        </a>
    </form>


    <ul class="d-flex justify-content-center list-unstyled find-links">
        <li><a href="">비밀번호 찾기</a></li>
        <li><a href="">아이디 찾기</a></li>
        <li><a href="/login/signup">회원가입</a></li>
    </ul>
</div>

<div class="modal fade" id="alertModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title w-100">알림</h5>
            </div>
            <div class="modal-body text-center">
                <span id="alertText"></span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

<script>
  $(function () {
    const urlParams = new URLSearchParams(window.location.search);
    const error = urlParams.get('error');

    if (error === 'expired') {
      alert('로그인이 만료되었습니다. 다시 로그인 해주세요.');
    } else if (error === 'accountDuplicate') {
      alert('자체로그인으로 이미 생성된 계정입니다.')
    }

    $('#loginForm').on('submit', function (e) {
      e.preventDefault();

      const email = $('#emailId').val().trim();
      const password = $('#password').val().trim();

      $.ajax({
        url: '/login',
        type: 'POST',
        data: {
          email: email,
          password: password
        },
        success: function (res) {
          window.location.href = '/'; // 홈페이지로 이동
        },
        error: function (err) {
          $('#alertText').text('로그인 실패');

          const modal = new bootstrap.Modal(document.getElementById('alertModal'));
          modal.show();
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