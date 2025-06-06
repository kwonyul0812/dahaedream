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

        .signup-wrapper {
            max-width: 700px;
            margin: 50px auto;
            padding: 50px;
            background: white;
            border-radius: 20px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.05);
        }

        .signup-title {
            font-size: 28px;
            font-weight: 700;
            color: #333;
        }
    </style>
</head>
<body>

<c:import url="/WEB-INF/fragment/navbar.jsp"/>

<div class="signup-wrapper" >
    <form id="signupForm">
        <div class="text-center signup-title mb-5">회원가입</div>

        <div class="input-group mb-3">
            <input type="text" class="form-control" id="emailFront" placeholder="이메일">
            <span class="input-group-text">@</span>
            <input type="text" class="form-control" id="emailBack">
            <button class="btn btn-outline-primary" type="button" id="emailCheckBtn">이메일 인증</button>
        </div>
        <div class="input-group mb-3">
            <input type="password" class="form-control" id="password" placeholder="비밀번호 8자 이상">
        </div>
        <div class="input-group mb-3">
            <input type="password" class="form-control" id="passwordCheck" placeholder="비밀번호 확인">
        </div>
        <div class="input-group mb-3">
            <input type="text" class="form-control" id="nickname" placeholder="닉네임">
        </div>
        <div class="input-group mb-3">
            <input type="text" class="form-control" id="address" placeholder="주소">
        </div>
        <div class="input-group mb-3">
            <input type="text" class="form-control" id="phone1" placeholder="핸드폰" maxlength="3">
            <span class="input-group-text">-</span>
            <input type="text" class="form-control" id="phone2" maxlength="4">
            <span class="input-group-text">-</span>
            <input type="text" class="form-control" id="phone3" maxlength="4">
        </div>
        <div class="text-center" style="margin-top: 30px">
            <button type="submit" id="signupBtn" class="btn btn-primary" style="width: 100px">가입</button>
        </div>
    </form>
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
    let checkEmail = false;

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

    // 이메일이 변경이되면 이메일 중복검사 하도록...
    $('#emailFront, #emailBack').on('input', function() {
      checkEmail = false;
    });

    // 연락처 입력란 숫자만 받도록
    $('#phone1, #phone2, #phone3').on('input', function () {
      const value = $(this).val();
      const filtered = value.replace(/[^0-9]/g, '') // 숫자만 남기고 나머지 입력안되게
      $(this).val(filtered);
    })

    $('#emailCheckBtn').on('click', function () {
      // 이메일 중복 검사
      const emailFront = $('#emailFront').val().trim();
      const emailBack = $('#emailBack').val().trim();
      const email = emailFront + '@' + emailBack;

      $.ajax({
        url: '/login/checkEmail',
        type: 'GET',
        data: {
          email: email
        },
        success: function (res, textStatus, jqXHR) {
          if (jqXHR.status === 200) {
            checkEmail = false;
            $('#alertText').text('이미 사용중인 이메일입니다.');
            const modal = new bootstrap.Modal(document.getElementById('alertModal'));
            modal.show();
          }
        },
        error: function (jqXHR) {
          if (jqXHR.status === 404) {
            checkEmail = true;
            $('#alertText').text('사용 가능한 이메일입니다.');
            const modal = new bootstrap.Modal(document.getElementById('alertModal'));
            modal.show();
          }
        },
      })
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

      // checkValue 가 false 이면 알림 모달띄우기
      let checkValue = true;

      if (password.length < 8) {
        $('#alertText').text('비밀번호는 최소 8자 이상이여야 합니다.');
        checkValue = false;
      }

      if (password !== passwordCheck) {
        $('#alertText').text('비밀번호가 일치하지 않습니다.');
        checkValue = false;
      }

      if (!nickname) {
        $('#alertText').text('닉네임을 확인해주세요.');
        checkValue = false;
      }

      if (!address) {
        $('#alertText').text('주소를 확인해주세요.');
        checkValue = false;
      }

      if (!isValidPhoneNumber(phone)) {
        $('#alertText').text('핸드폰을 확인해주세요.');
        checkValue = false;
      }

      if(!checkEmail) { // 이메일 중복검사 확인
        $('#alertText').text('이메일 중복검사를 해주세요');
        checkValue = false;
      }

      // checkValue가 false이면 알림 모달 띄우고 작업중지
      if (!checkValue) {
        const modal = new bootstrap.Modal(document.getElementById('alertModal'));
        modal.show()
        return;
      }

      // 중복방지를 위해 버튼 비활성화
      $('#signupBtn').prop('disabled', true);

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
        success: function (res) {
          // 회원가입 성공시
          $('#alertText').text('회원가입 성공');
          const modal = new bootstrap.Modal(document.getElementById('alertModal'));
          // 모달 닫힐 때 페이지 이동
          $('#alertModal').one('hide.bs.modal', function () {
            window.location.href = '/login/signin';
          });
          modal.show();
        },
        error: function (err) {
          $('#alertText').text('회원가입 실패');
          const modal = new bootstrap.Modal(document.getElementById('alertModal'));
          modal.show()
        },
        complete: function () {
          $('#signupBtn').prop('disabled', false);
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