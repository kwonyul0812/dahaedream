<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq"
            crossorigin="anonymous"></script>
    <title>의뢰하기</title>

</head>
<body>
<jsp:include page="../../fragment/navbar.jsp"/>
<div>
    <h1>의뢰하기</h1>
</div>
<div>
    제목 : <input type="text">
</div>
<div>
    하는 일  : <input type="text">
</div>
<div>
    방법 : <input type="text">
</div>
<div>
    기간 : <input type="text">
</div>
<div>
    이미지 : <input type="file">
</div>
<div>
    의뢰비 : <input type="text">
</div>
<div>
    내용 : <textarea></textarea>
</div>
<div>
    의뢰 장소 : <button>on/off</button>
</div>
<div>
    주소 : <input type="text">
</div>

</body>
</html>