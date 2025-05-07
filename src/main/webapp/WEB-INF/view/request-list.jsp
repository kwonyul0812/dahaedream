<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <title>의뢰목록</title>

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
</head>
<body class="bg-light">

<jsp:include page="../fragment/navbar.jsp"/>

<div class="container py-5">
    <h1 class="mb-4 text-center">의뢰목록</h1>
    <button class="btn btn-outline-primary" onclick="location.href='/client/add'">의뢰하러가기</button>
    <div id="request-list" class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">

    </div>
</div>

</body>
</html>
<script>


    function getRequestList() {
        fetch("/client/select.dox", {
            method : "POST"
        })
            .then(res => res.json())
            .then(data => {
                console.log(data.list);
                const listContainer = document.getElementById("request-list");
                listContainer.innerHTML = "";

                data.list.forEach(item => {

                    const col = document.createElement("div");
                    col.className = "col";

                    const card = document.createElement("div");
                    card.className = "card h-100 shadow-sm";

                    const img = document.createElement("img");
                    img.className = "card-img-top";
                    img.alt = "썸네일 이미지";

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
                    button.onclick = () => location.href = `/client/info?requestId=\${item.requestId}`;

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



