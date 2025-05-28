<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <title>의뢰목록</title>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        body {
            background-color: #f3f4ff;
            font-family: 'Apple SD Gothic Neo', sans-serif;
        }

        h1 {
            font-weight: 700;
            color: #333;
            margin-bottom: 20px;
        }

        .btn-add {
            background-color: #4266f5;
            border: none;
            color: white;
            padding: 10px 20px;
            font-weight: 600;
            border-radius: 8px;
            transition: 0.3s;
        }

        .btn-add:hover {
            background-color: #3e84e0;
        }

        .card {
            border: none;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.05);
            transition: transform 0.2s ease;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card-img-top {
            height: 180px;
            object-fit: cover;
            background-color: #eee;
        }

        .card-title {
            font-size: 18px;
            font-weight: bold;
            color: #222;
        }

        .card-text {
            font-size: 15px;
            color: #555;
        }

        .card-footer {
            background: none;
            border-top: none;
            padding: 1rem;
            text-align: right;
        }

        .btn-view {
            background-color: white;
            border: 2px solid #4296f5;
            color: #428af5;
            font-weight: 600;
            border-radius: 6px;
            padding: 6px 14px;
            transition: 0.3s;
        }

        .btn-view:hover {
            background-color: #4281f5;
            color: white;
        }
    </style>
</head>
<body>

<jsp:include page="../fragment/navbar.jsp"/>

<div class="container py-5">
    <h1 class="text-center">의뢰 목록</h1>
    <div class="text-end mb-4">
        <button class="btn btn-add" onclick="location.href='/client/add'">+ 의뢰하러 가기</button>
    </div>

    <div id="request-list" class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4"></div>
</div>

<script>
    function getRequestList() {
        fetch("/client/select.dox", {
            method: "POST"
        })
            .then(res => res.json())
            .then(data => {
                const listContainer = document.getElementById("request-list");
                listContainer.innerHTML = "";

                data.list.forEach(item => {
                    const col = document.createElement("div");
                    col.className = "col";

                    const card = document.createElement("div");
                    card.className = "card h-100";

                    const img = document.createElement("img");
                    img.className = "card-img-top";
                    img.alt = "썸네일 이미지";
                    img.src = item.thumbnailUrl || "https://via.placeholder.com/400x200?text=No+Image";

                    const body = document.createElement("div");
                    body.className = "card-body";
                    body.innerHTML = `
                    <h5 class="card-title">\${item.title}</h5>
                    <p class="card-text"><strong>\${item.price}P</strong></p>
                    <p class="card-text"><small class="text-muted">작성: \${item.createdAt}</small></p>
                `;

                    const footer = document.createElement("div");
                    footer.className = "card-footer";

                    const button = document.createElement("button");
                    button.className = "btn btn-view";
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

</body>
</html>
