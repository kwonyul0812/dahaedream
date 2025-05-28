<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div style="width: 100%; height: 50px; background-color: greenyellow" class="d-flex justify-content-end align-items-center">
    <span class="fs-4 me-5" id="pointText"></span>
</div>
<script>
  $(function () {
    $.ajax({
      url: '/mypage/getPoint',
      type: 'GET',
      success: function(data) {
        $('#pointText').text('보유포인트 : ' + data + 'p');
      }
    })
  })
</script>