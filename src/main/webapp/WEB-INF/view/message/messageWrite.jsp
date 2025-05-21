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
    <c:import url="/WEB-INF/fragment/messagebar.jsp"/>

    <div style="flex-grow: 1; height: 500px">
        <div class="d-flex flex-column justify-content-center align-items-center">
            <h4 class="text-center mt-5 mb-5">쪽지 쓰기</h4>

            <div style="width: 50%">

                <!-- 받는 이 -->
                <div class="row mb-3">
                    <label class="col-2 col-form-label text-end">받는 사람</label>
                    <div class="col-10">
                        <input type="text" class="form-control" id="nickname" placeholder="닉네임 입력" readonly/>
                    </div>
                    <input type="number" id="memberId" hidden/>
                </div>

                <!-- 제목 -->
                <div class="row mb-3">
                    <label class="col-2 col-form-label text-end">제목</label>
                    <div class="col-10">
                        <input id="title" type="text" class="form-control" placeholder="제목 입력"/>
                    </div>
                </div>

                <!-- 내용 -->
                <div class="row mb-3">
                    <label class="col-2 col-form-label text-end">내용</label>
                    <div class="col-10">
                        <textarea id="content" class="form-control" rows="10" style="resize: none"
                                  placeholder="내용 입력"></textarea>
                    </div>
                </div>

                <!-- 버튼 -->
                <div class="row mt-5">
                    <div class="offset-3 col-9 text-end">
                        <button id="sendMessageBtn" class="btn btn-primary">보내기</button>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="searchMember" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title w-100 text-center">회원검색</h4>
            </div>
            <div class="modal-body w-100">
                <div class="mb-3 d-flex gap-2">
                    <input type="text" class="form-control flex-grow-1" id="searchNickname" placeholder="닉네임 입력"/>
                    <button class="btn btn-primary" id="searchNicknameBtn" style="width: 80px">검색</button>
                </div>
                <div id="searchResults">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

<template id="memberTemplate">
    <div class="memberItem mb-2 d-flex align-items-center gap-2 justify-content-between">
        <span class="ms-3 searchedNickname"></span>
        <button class="btn btn-primary selectMember" style="width: 60px">선택</button>
    </div>
</template>

<script>
  $(function () {
    $('#nickname').on('click', function () {
      const modal = new bootstrap.Modal(document.getElementById('searchMember'));
      modal.show();
    });

    $('#searchResults').on('click', '.selectMember', function () {
      const memberId = $(this).data('memberId');
      const nickname = $(this).data('nickname');

      $('#memberId').val(memberId);
      $('#nickname').val(nickname);

      $('#searchMember').modal('hide');
    });

    $('#searchNicknameBtn').on('click', function () {
      const nickname = $('#searchNickname').val().trim();

      $.ajax({
        url: '/message/searchMember',
        type: 'GET',
        data: {
          nickname: nickname
        },
        success: function (members) {
          // const $template = $('#memberTemplate').clone();

          $('#searchResults').empty();

          if (members.length === 0) {
            $('#searchResults').append('<div class="text-center">검색 결과가 없습니다.</div>');
            return;
          }

          members.forEach(member => {
            // const $item = $template.clone();
            // $item.show();
            const template = document.getElementById('memberTemplate');
            const $item = $(template.content.cloneNode(true));
            $item.find('.searchedNickname').text(member.nickname + ' (' + maskEmail(member.email) + ')');
            $item.find('.selectMember').data({
              memberId: member.memberId,
              nickname: member.nickname
            });
            $('#searchResults').append($item);
          });
        },
      });
    });
    $('#sendMessageBtn').on('click', function () {
      const memberId = $('#memberId').val();
      const nickname = $('#nickname').val().trim();
      const title = $('#title').val().trim();
      const content = $('#content').val().trim();

      if (nickname === "") {
        alert('닉네임을 입력해주세요.');
        return;
      } else if (title === "") {
        alert('제목을 입력해주세요.')
        return;
      } else if (content === "") {
        alert('내용을 입력해주세요.');
        return;
      }

      $.ajax({
        url: '/message/insert',
        type: 'POST',
        data: {
          receiverId: memberId,
          title: title,
          content: content,
        },
        success: function (data, textStatus, jqXHR) {
          if (jqXHR.status === 200) {
            window.location.href = '/message/list?type=sended';
          }
        },
        error: function () {
          alert('오류 발생');
        }
      });
    });
  });

  function maskEmail(email) {
    const [user, domain] = email.split('@');
    if (user.length <= 2) return email;
    const maskedUser = user[0] + '*'.repeat(user.length - 2) + user[user.length - 1];
    return maskedUser + '@' + domain;
  }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq"
        crossorigin="anonymous"></script>
</body>
</html>