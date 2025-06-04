<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">


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

            <a class="navbar-brand mx-auto" href="/"><img src="/uploads/logo2.png" alt="로고" height="100"
                                                          width="200"></a>

            <ul class="navbar-nav d-flex flex-row">
                <li class="nav-item me-2">
                    <a class="nav-link active" aria-current="page" href="/mypage/point" style="display:none"
                       id="mypage">마이페이지</a>
                </li>
                <li class="nav-item d-flex align-items-center me-2">
                    <a href="/message/list?type=received" class=" active" aria-current="page"
                       style="cursor: pointer; display: none" id="message">
                        <div style="position: relative; display: inline-block;">
                            <i class="fa-regular fa-envelope fa-2x" style="color: black;"></i>
                            <!-- 뱃지 -->
                            <span id="msNotification"
                                  class="badge bg-danger"
                                  style="position: absolute; top: -5px; right: -10px;"></span>
                        </div>
                    </a>
                </li>
                <li class="nav-item me-2">
                    <span id="info" class="nav-link" style="display: none"></span>
                </li>
                <li class="nav-item">
                    <a href="/login/signin" class="btn btn-sm btn-outline-primary" id="loginBtn" role="button">로그인</a>
                </li>
                <li class="nav-item d-flex align-items-center">
                    <a href="/logout" class="btn btn-sm btn-outline-danger" id="logoutBtn" role="button"
                       style="display: none;">로그아웃</a>
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
        $("#info").text(res.nickname + '님').show();
        // 로그인 버튼 숨기고 로그아웃 버튼 표시
        $('#loginBtn').hide();
        $('#logoutBtn').show();
        $('#mypage').show();
        $('#message').show();
        if (res.msCount > 0) {
          $('#msNotification').text(res.msCount).show();
        }
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
