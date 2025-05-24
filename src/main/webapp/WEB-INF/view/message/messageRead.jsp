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
<body data-message-type="${type}">
<input type="text" id="messageId" value="${message.messageId}" hidden>
<c:choose>
    <c:when test="${type eq 'sended'}">
        <input type="hidden" id="receiverId" value="${message.receiverId}"/>
    </c:when>
    <c:when test="${type eq 'received'}">
        <input type="hidden" id="senderId" value="${message.senderId}"/>
    </c:when>
</c:choose>

<c:import url="/WEB-INF/fragment/navbar.jsp"/>


<div class="d-flex">
    <c:import url="/WEB-INF/fragment/messagebar.jsp"/>

    <div style="flex-grow: 1; height: 500px">
        <div class="d-flex flex-column justify-content-center align-items-center">

            <c:choose>
                <c:when test="${type eq 'sended'}">
                    <h4 class="text-center mt-5 mb-5">보낸 쪽지</h4>
                </c:when>
                <c:when test="${type eq 'received'}">
                    <h4 class="text-center mt-5 mb-5">받은 쪽지</h4>
                </c:when>
            </c:choose>


            <div style="width: 50%">

                <!-- 받는 이 -->
                <div class="row mb-3">
                    <c:choose>
                        <c:when test="${type eq 'sended'}">
                            <label class="col-2 col-form-label text-end">받는 사람</label>
                        </c:when>
                        <c:when test="${type eq 'received'}">
                            <label class="col-2 col-form-label text-end">보낸 사람</label>
                        </c:when>
                    </c:choose>
                    <div class="col-10">
                        <input type="text" class="form-control" value="${message.nickname}" id="nickname" readonly/>
                    </div>
                </div>

                <!-- 제목 -->
                <div class="row mb-3">
                    <label class="col-2 col-form-label text-end">제목</label>
                    <div class="col-10">
                        <input type="text" class="form-control" value="${message.title}" readonly/>
                    </div>
                </div>

                <!-- 내용 -->
                <div class="row mb-3">
                    <label class="col-2 col-form-label text-end">내용</label>
                    <div class="col-10">
                        <textarea class="form-control" rows="10" style="resize: none"
                                  readonly>${message.content}</textarea>
                    </div>
                </div>
                <!-- 버튼 -->
                <c:choose>
                    <c:when test="${type eq 'sended'}">
                        <div class="row mt-5">
                            <div class="offset-3 col-9 text-end">
                                <button id="deleteBtn" class="btn btn-danger">삭제</button>
                            </div>
                        </div>
                    </c:when>
                    <c:when test="${type eq 'received'}">
                        <div class="row mt-5">
                            <div class="offset-3 col-9 text-end">
                                <button id="replyBtn" class="btn btn-success">답장</button>
                            </div>
                        </div>
                    </c:when>
                </c:choose>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="memberInfo" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title w-100 text-center">홍길동</h4>
            </div>
            <div class="modal-body">
                <div class="mb-3">
                    <h5>받은리뷰</h5>
                </div>
                <div class="bg-body-secondary mb-2 p-2">
                    <div class="mb-2 d-flex justify-content-between">
                        <span>사용자1</span>
                        <span>25-03-11</span>
                    </div>
                    <div>테스트 댓글1 입니다.</div>
                </div>
                <div class="bg-body-secondary mb-2 p-2">
                    <div class="mb-2 d-flex justify-content-between">
                        <span>사용자2</span>
                        <span>25-03-11</span>
                    </div>
                    <div>테스트 댓글2 입니다.</div>
                </div>
                <div class="bg-body-secondary mb-2 p-2">
                    <div class="mb-2 d-flex justify-content-between">
                        <span>사용자2</span>
                        <span>25-03-11</span>
                    </div>
                    <div>테스트 댓글3 입니다.</div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>


<script>
  $(function () {

    $('#nickName').on('click', function () {
      const modal = new bootstrap.Modal(document.getElementById('memberInfo'));
      modal.show()
    });

    $('#replyBtn').on('click', function() {
      const senderId = $('#senderId').val();
      window.location.href="/message/write?receiverId=" + senderId;
    })

    $('#deleteBtn').on('click', function() {
      const messageId = $('#messageId').val();

      $.ajax({
        url:'/message/delete',
        type:'DELETE',
        data: {
          messageId: messageId
        },
        success: function(res, textStatus, jqXHR) {
            if(jqXHR.status === 200) {
              alert('삭제 성공');
              window.location.href="/message/list?type=sended";
            }
        }
      });
    });
  });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq"
        crossorigin="anonymous"></script>
</body>
</html>d