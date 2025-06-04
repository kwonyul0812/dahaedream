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
    <script src="https://cdn.jsdelivr.net/npm/dayjs@1/dayjs.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/dayjs@1/plugin/relativeTime.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/dayjs@1/locale/ko.js"></script>
    <style>
        body {
            background-color: #f3f5ff;
            font-family: 'Apple SD Gothic Neo', sans-serif;
        }

        .list:hover {
            cursor: pointer;
        }

        tr.unread td {
            color: blue;
        }

        .messageList-wrapper {
            flex-grow: 1;
            max-width: 900px;
            margin: 50px auto;
            padding: 50px;
            background: white;
            border-radius: 20px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.05);
        }

        .messageList-title {
            font-size: 28px;
            font-weight: 700;
            color: #333;
        }
    </style>
</head>
<body data-message-type="${type}">

<c:import url="/WEB-INF/fragment/navbar.jsp"/>


<div class="d-flex">
    <c:import url="/WEB-INF/fragment/messagebar.jsp"/>

    <div class="messageList-wrapper">
        <c:choose>
            <c:when test="${type eq 'sended'}">
                <div class="text-center messageList-title mb-5" id="messageType">보낸 쪽지</div>
            </c:when>
            <c:when test="${type eq 'received'}">
                <div class="text-center messageList-title mb-5" id="messageType">받은 쪽지</div>
            </c:when>
        </c:choose>
        <div>
            <table class="table table-hover text-center">
                <thead>
                <tr>
                    <c:choose>
                        <c:when test="${type eq 'sended'}">
                            <th class="w-20">받는 사람</th>
                        </c:when>
                        <c:when test="${type eq 'received'}">
                            <th class="w-20">보낸 사람</th>
                        </c:when>
                    </c:choose>
                    <th class="w-50">제목</th>
                    <th class="w-25">날짜</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="message" items="${messageList}">
                    <c:choose>
                        <c:when test="${type eq 'received' and message.isRead == false}">
                            <tr class="messageRow list unread" data-message-id="${message.messageId}">
                                <td>${message.nickname}</td>
                                <td>${message.title}</td>
                                <td><span class="time-text" data-senddate="${message.sendDate}"></span></td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <tr class="messageRow list" data-message-id="${message.messageId}">
                                <td>${message.nickname}</td>
                                <td>${message.title}</td>
                                <td><span class="time-text" data-senddate="${message.sendDate}"></span></td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<c:choose>
    <c:when test="${type eq 'sended'}">
        <input type="hidden" id="receiverId" value="${message.receiverId}"/>
    </c:when>
    <c:when test="${type eq 'received'}">
        <input type="hidden" id="senderId" value="${message.senderId}"/>
    </c:when>
</c:choose>

<script>
  dayjs.extend(dayjs_plugin_relativeTime);
  dayjs.locale('ko');

  // 모든 시간 텍스트를 변환
  document.querySelectorAll('.time-text').forEach(function (el) {
    const raw = el.dataset.senddate; // data-senddate 값
    const relative = dayjs(raw).fromNow(); // ex) "2시간 전"
    el.innerText = relative;
  });

  $(function () {
    $('.messageRow').on('click', function () {
      const type = $('body').data('message-type');
      const messageId = $(this).data('message-id');
      console.log(messageId);

      const url = '/message/read?messageId=' + messageId + '&type=' + type;
      window.location.href = url;
    })
  })
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq"
        crossorigin="anonymous"></script>
</body>
</html>