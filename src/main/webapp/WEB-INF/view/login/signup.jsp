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

<div class="mx-auto" style="width: 700px; margin-top: 30px">
    <form id="signupForm" class="p-4">
        <h4 class="text-center mb-4">회원가입</h4>

        <div class="input-group mb-3">
            <input type="text" class="form-control" id="emailFront" placeholder="이메일">
            <span class="input-group-text">@</span>
            <input type="text" class="form-control" id="emailBack">
            <button class="btn btn-outline-secondary" type="button" id="emailCheck">이메일 인증</button>
        </div>
        <div class="input-group mb-3">
            <input type="password" class="form-control" id="password" placeholder="비밀번호 8자 이상">
        </div>
        <div class="input-group mb-3">
            <input type="password" class="form-control" id="passwordCheck" placeholder="비밀번호 확인">
        </div>
        <div class="input-group mb-3">
            <input type="text" class="form-control" id="nickname" placeholder="닉네임">
            <button class="btn btn-outline-secondary" type="button" id="nicknameCheck">중복 확인</button>
        </div>
        <div class="input-group mb-3">
            <input type="text" class="form-control" id="address" placeholder="주소">
            <button class="btn btn-outline-secondary" type="button" id="searchAddress">주소 찾기</button>
        </div>
        <div class="input-group mb-3">
            <input type="text" class="form-control" id="phone1" placeholder="핸드폰" maxlength="3">
            <span class="input-group-text">-</span>
            <input type="text" class="form-control" id="phone2" maxlength="4">
            <span class="input-group-text">-</span>
            <input type="text" class="form-control" id="phone3" maxlength="4">
        </div>
        <div class="text-end">
            <button type="submit" class="btn btn-primary">가입</button>
        </div>
    </form>
</div>

<script>
  $(function () {
    // 이메일 앞부분: 영문, 숫자, 일부 특수문자만 허용
    $('#emailFront').on('input', function () {
      const value = $(this).val();
      const filtered = value.replace(/[^a-zA-Z0-9._-]/g, ''); // 허용: . _ -
      $(this).val(filtered);
    });

    // 이메일 뒷부분: 도메인 형식 (영문, 숫자, -, .)
    $('#emailBack').on('input', function () {
      const value = $(this).val();
      const filtered = value.replace(/[^a-zA-Z0-9.-]/g, ''); // 허용: . -
      $(this).val(filtered);
    });

    // 연락처 입력란 숫자만 받도록
    $('#phone1, #phone2, #phone3').on('input', function () {
      const value = $(this).val();
      const filtered = value.replace(/[^0-9]/g, '') // 숫자만 남기고 나머지 입력안되게
      $(this).val(filtered);
    })

    $('#signupForm').on('submit', function (e) {
      e.preventDefault();

      const emailFront = $('#emailFront').val().trim();
      const emailBack = $('#emailBack').val().trim();
      const password = $('#password').val().trim();
      const passwordCheck = $('#passwordCheck').val().trim();
      const nickname = $('#nickname').val().trim();
      const address = $('#address').val().trim();
      const phone = $('#phone1').val().trim() + $('#phone2').val().trim() + $('#phone3').val().trim();

      if (!emailFront || !emailBack) {
        alert('이메일을 확인해주세요.');
        return;
      }

      if (password.length < 8) {
        alert('비밀번호는 최소 8자 이상이여야 합니다.');
        return;
      }

      if (password !== passwordCheck) {
        alert('비밀번호가 일치하지 않습니다.');
        return;
      }

      if (!nickname) {
        alert('닉네임을 확인해주세요.');
        return;
      }

      if (!address) {
        alert('주소를 확인해주세요.');
        return;
      }

      if (!isValidPhoneNumber(phone)) {
        alert('핸드폰을 확인해주세요.');
        return;
      }

      // ajax로 비밀번호 확인 필드 제외 후 데이터 전송
      $.ajax({
        url: '/login/signup',
        type: 'POST',
        data: {
          email: emailFront + "@" + emailBack,
          password: password,
          nickname: nickname,
          address: address,
          phone: phone
        },
        success: function(res) {
          alert('전송 완료');
        },
        error: function(err) {

        }
      });
    });
  });

  function isValidPhoneNumber(phone) {
    const regex = /^(01[0-9])(\d{4})(\d{4})$/;
    return regex.test(phone);
  }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq"
        crossorigin="anonymous"></script>
</body>
</html>