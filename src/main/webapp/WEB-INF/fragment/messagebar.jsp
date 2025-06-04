<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    .message-bar {
        width: 200px;
        padding: 10px;
        margin-top: 25px;
    }
    .message-bar-btn {
        width: 100%;
        border-radius: 10px;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.05);
        font-size: 22px;
        margin-bottom: 5px;
    }
</style>

<div class="message-bar">
            <a class="btn btn-primary message-bar-btn" href="/message/list?type=received" role="button">받은 쪽지</a>
            <a class="btn btn-primary message-bar-btn" href="/message/list?type=sended" role="button">보낸 쪽지</a>
            <a class="btn btn-primary message-bar-btn " href="/message/write" role="button">쪽지 쓰기</a>
</div>

