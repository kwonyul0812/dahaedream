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
                    <a href="/message/receivedMessage" class="nav-link active" aria-current="page" style="cursor: pointer" id="message">쪽지</a>
                </li>
                <li>
                    <span id="info" style="display: none"></span>
                </li>
                <li>
                    <a href="/login/signin" class="btn btn-sm btn-outline-secondary" id="loginBtn" role="button">로그인</a>
                </li>
                <li>
                    <a href="/logout" class="btn btn-sm btn-outline-secondary" id="logoutBtn" role="button" style="display: none">로그아웃</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<script>
  $(function () {
    $.ajax({
      url: "/auth/getUser",
      type: "GET",
      success: function (res) {
        $("#info").text(res.nickname).show();
        // 로그인 버튼 숨기고 로그아웃 버튼 표시
        $('#loginBtn').hide();
        $('#logoutBtn').show();
      },
      error: function (err) {
        // 인증되지 않은 경우
        $('#info').text("").hide();
        $('#loginBtn').show();
        $('#logoutBtn').hide();
      }
    })
  })
</script>
