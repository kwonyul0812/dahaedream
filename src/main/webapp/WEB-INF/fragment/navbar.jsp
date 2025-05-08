<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">

            <ul class="navbar-nav d-flex flex-row">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/request/list">의뢰목록</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        해결사
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/solver/send">수락 대기중인 목록</a></li>
                        <li><a class="dropdown-item" href="/solver/list">수락한 의뢰</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        의뢰자
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/client/add">의뢰글 쓰기</a></li>
                        <li><a class="dropdown-item" href="/client/request">의뢰수락 요청</a></li>
                        <li><a class="dropdown-item" href="/client/list">의뢰 내역</a></li>
                    </ul>
                </li>
            </ul>

            <a class="navbar-brand mx-auto" href="/">로고</a>

            <ul class="navbar-nav d-flex flex-row">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/mypage/member">마이페이지</a>
                </li>
                <li class="nav-item">
                    <span class="nav-link active" aria-current="page" style="cursor: pointer" id="message">쪽지</span>
                </li>
                <li>
                    <span id="info" style="display: none"></span>
                </li>
                <li>
                    <a href="/login/signin" class="btn btn-sm btn-outline-secondary" id="loginBtn" role="button">로그인</a>
                </li>
                <li>
                    <button class="btn btn-sm btn-outline-secondary" id="logoutBtn" style="display: none">로그아웃</button>
                </li>
            </ul>
        </div>
    </div>
</nav>
<script>
  $(function () {
    // 로컬 스토리지에서 token 가져옴
    const token = localStorage.getItem('jwtToken');

    // 토큰이 있으면 로그인 버튼 숨기고 로그아웃 버튼 보이기
    if (token) {
      const decoded = jwtDecode(token); // 라이브러리 함수
      $("#info").text(decoded.nickname + "님").show();
      $('#loginBtn').hide();
      $('#logoutBtn').show();
    } else {
      $('#info').text("").hide();
      $('#loginBtn').show();
      $('#logoutBtn').hide();
    }

    $('#logoutBtn').on('click', function () {
      // 로그아웃 클릭시 jwt 토큰 삭제 처리
      localStorage.removeItem('jwtToken');

      window.location.href = "/";
    })

    $('#message').on('click', function () {
      const token = localStorage.getItem("jwtToken");
      $.ajax({
        url: '/message/receivedMessage',
        type: 'GET',
        headers: {
          'Authorization': token  // Authorization 헤더에 JWT 토큰 추가
        }, success: function (res) {
          // 서버 응답이 성공적으로 왔을 때, 페이지를 이동
          window.location.href = "/message/receivedMessage";
        },
        error: function (err) {
          // 에러가 발생한 경우
          if (err.status === 401) {
            alert("로그인이 필요합니다.");
            window.location.href = "/login/signin";  // 인증 실패시 로그인 페이지로 리디렉션
          } else {
            alert("오류가 발생했습니다.");
          }
        }
      })
    })
  })
</script>
