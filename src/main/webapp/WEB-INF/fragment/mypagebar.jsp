<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    .mypage-bar {
        width: 200px;
        padding: 10px;
        margin-top: 25px;
    }

    .mypage-bar-btn {
        width: 100%;
        border-radius: 10px;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.05);
        font-size: 22px;
        margin-bottom: 5px;
    }
</style>

<div class="mypage-bar">
<%--    <a class="btn btn-primary mypage-bar-btn" href="/mypage/member" role="button">회원정보</a>--%>
<%--    <a class="btn btn-primary mypage-bar-btn" href="/mypage/receivedReview" role="button">내가 받은 리뷰</a>--%>
<%--    <a class="btn btn-primary mypage-bar-btn" href="/mypage/writtenReview" role="button">내가 쓴 리뷰</a>--%>
    <a class="btn btn-primary mypage-bar-btn" href="/mypage/point" role="button">포인트 충전</a>
    <a class="btn btn-primary mypage-bar-btn" href="/mypage/pointHistory" role="button">포인트 내역</a>
</div>

