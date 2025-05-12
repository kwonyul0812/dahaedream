<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <title>수락대기중 의뢰</title>

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
    <h1 class="mb-4 text-center">수락대기중 의뢰</h1>
    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4" id="request-list">

    </div>
</div>

</body>
</html>
<script>
    function fnCancel() {
        if(confirm('취소하시겠습니까?')) {
            alert('취소하였습니다.');
        }

    }

    function getRequestList() {

        const token = localStorage.getItem('jwtToken');
        const decoded = token ? jwtDecode(token) : null;

        fetch("/solver/getRequest.dox", {
            method: "POST",
            headers: {
                'Content-Type': 'application/json'
            },
            body : JSON.stringify({solverId : decoded?.memberId})
        })
            .then(res => res.json())
            .then(data => {
                // data.list 가 배열인지 확인해서,
                // 배열이면 그대로, 아니면 (한 건이면) 배열로 감싸고,
                // null/undefined 면 빈 배열로 처리
                console.log(data);
                const items = data.list
                    ? (Array.isArray(data.list) ? data.list : [data.list])
                    : [];

                const listContainer = document.getElementById("request-list");
                listContainer.innerHTML = "";

                // items 는 항상 배열이므로 forEach 바로 사용 가능
                items.forEach(item => {
                    const col = document.createElement("div");
                    col.className = "col";

                    const card = document.createElement("div");
                    card.className = "card h-100 shadow-sm";

                    const img = document.createElement("img");
                    img.className = "card-img-top";
                    img.alt = "썸네일 이미지";
                    // 예: item.thumbnailUrl 이 있다면
                    if (item.thumbnailUrl) {
                        img.src = item.thumbnailUrl;
                    }

                    const body = document.createElement("div");
                    body.className = "card-body";
                    body.innerHTML = `
                <h5 class="card-title">\${item.title}</h5>
                <p class="card-text"><strong>\${item.price}P</strong></p>
                <p class="card-text"><strong>작성시간:</strong>\${item.createdAt}</p>
            `;

                    const footer = document.createElement("div");
                    footer.className = "card-footer p-0";

                    const button = document.createElement("button");
                    button.className = "btn btn-outline-primary";
                    button.textContent = "자세히 보기";
                    button.onclick = () => {
                        location.href = `/client/info?requestId=\${item.requestId}`;
                    };

                    const cancelBtn = document.createElement("button");
                    cancelBtn.className = "btn btn-outline-danger me-2";
                    cancelBtn.textContent = "취소";
                    cancelBtn.onclick = () => {if (confirm('정말 취소하시겠습니까?')) {
                        fetch(`/solver/cancel?requestId=\${item.requestId}`, { method: 'POST' })
                                    .then(res => {
                                        if (!res.ok) throw new Error(res.status);
                                            alert('취소되었습니다.');
                                            getRequestList(); // 리스트 갱신
                                        })
                                    .catch(err => console.error(err));
                                 }
                          };


                    const acceptBtn = document.createElement("button");
                    acceptBtn.className = "btn btn-outline-success";
                    acceptBtn.textContent = "수락";
                    acceptBtn.onclick = () => {
                        if (confirm('이 의뢰를 수락하시겠습니까?')) {
                            fetch(`/solver/accept?requestId=${item.requestId}`, { method: 'POST' })
                                .then(res => {
                                    if (!res.ok) throw new Error(res.status);
                                        alert('수락했습니다.');
                                        getRequestList(); // 리스트 갱신
                                       })
                                .catch(err => console.error(err));
                                }
                           };

                    footer.appendChild(cancelBtn);
                    footer.appendChild(acceptBtn);
                    footer.appendChild(button);
                    card.appendChild(img);
                    card.appendChild(body);
                    card.appendChild(footer);
                    col.appendChild(card);
                    listContainer.appendChild(col);
                });
            })
            .catch(err => {
                console.error("에러 발생:", err);
            });
    }

    getRequestList();


</script>
