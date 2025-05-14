<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <title>의뢰내역</title>
    <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"
    ></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq"
            crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/jwt-decode@4.0.0/build/cjs/index.min.js"></script>

</head>
<body class="bg-light">

<jsp:include page="../../fragment/navbar.jsp"/>

<div class="container py-5">
    <h1 class="mb-4 text-center">의뢰 내역</h1>

    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4" id="requestList">

    </div>
</div>

</body>
</html>
<script>
    fnGet();

    function fnDelete(requestId) {

        if(confirm('삭제할까요?')) {
            fetch("/client/delete.dox", {
                method:"POST",
                headers : {'Content-Type': 'application/json'},
                body : JSON.stringify({requestId : requestId})
            })
                .then(res=>res.json())
                .then(data => {
                    console.log(data);
                    alert(data.message);
                    fnGet();
                })
        }
    }

    function fnGet() {
        const token = localStorage.getItem('jwtToken');
        const decoded = token ? jwtDecode(token) : null;

        fetch("/client/getRequest.dox", {
            method:"POST",
            headers : {'Content-Type': 'application/json'},
            body : JSON.stringify({memberId : decoded?.memberId})
        })
            .then(res => res.json())
            .then(data => {
                console.log(data);
                const items = data.list
                    ? (Array.isArray(data.list) ? data.list : [data.list])
                    : [];
                const container = document.getElementById('requestList');
                container.innerHTML = '';

                items.forEach(item => {
                    let button = '';

                    if (item.status == '대기중') {
                        button = `
                    <button class="btn btn-outline-primary" onclick="location.href='/client/info?requestId=\${item.requestId}'">수정</button>
                    <button class="btn btn-outline-danger" onclick="fnDelete(\${item.requestId})">삭제</button>
                `;
                    } else if (item.status == '진행중') {
                        button = `
                    <button class="btn btn-outline-secondary" disabled>수정 불가</button>
                `;
                    } else if (item.status == '완료') {
                        button = `
                    <button class="btn btn-success w-100" onclick="fnComplete(\${item.requestId})">완료 처리</button>
                `;
                    }

                    const cardHtml = `
                <div class="col">
                    <div class="card h-100 shadow-sm">
                        <img src="\${item.thumbnailUrl || ''}" class="card-img-top" alt="썸네일 이미지">
                        <div class="card-body">
                            <h5 class="card-title">\${item.title}</h5>
                            <p class="card-text"><strong>상태:</strong> \${item.status}</p>
                        </div>
                        <div class="card-footer p-0">
                            <div class="btn-group w-100" role="group">
                                \${button}
                            </div>
                        </div>
                    </div>
                </div>
            `;
                    container.insertAdjacentHTML('beforeend', cardHtml);
                })
            })
    }

    function fnComplete(request_id) {
        fetch("/client/completeRequest.dox", {
            method : "POST",
            headers : {'Content-Type': 'application/json'},
            body : JSON.stringify({requestId : request_id})
        })
            .then(res => res.json())
            .then(data => {
                console.log(data);
            })
    }

</script>
