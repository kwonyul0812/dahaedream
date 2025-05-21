<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>의뢰하기</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

    <style>
        body {
            background-color: #f3f5ff;
            font-family: 'Apple SD Gothic Neo', sans-serif;
        }

        .request-wrapper {
            max-width: 720px;
            margin: 50px auto;
            padding: 40px;
            background: white;
            border-radius: 20px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.05);
        }

        .request-title {
            font-size: 28px;
            font-weight: 700;
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        .form-label {
            font-weight: 600;
            margin-bottom: 8px;
            color: #444;
        }

        .form-control,
        .form-select {
            border-radius: 12px;
            padding: 14px;
            border: 1px solid #ddd;
            transition: all 0.3s ease;
        }

        .form-control:focus,
        .form-select:focus {
            border-color: #427bf5;
            box-shadow: 0 0 0 0.2rem rgba(66, 117, 245, 0.25);
        }

        textarea {
            resize: none;
        }

        .btn-submit {
            background-color: #428af5;
            color: white;
            padding: 12px 30px;
            font-weight: 600;
            border: none;
            border-radius: 10px;
            transition: background-color 0.3s ease;
        }

        .btn-submit:hover {
            background-color: #3e54e0;
        }

        .form-section {
            margin-bottom: 20px;
        }

        .address-group {
            display: flex;
            gap: 10px;
        }
    </style>
</head>
<body>

<jsp:include page="../../fragment/navbar.jsp"/>

<div class="request-wrapper">
    <div class="request-title">의뢰하기</div>

    <div class="form-section">
        <label class="form-label">제목</label>
        <input type="text" id="title" class="form-control" placeholder="제목을 입력하세요">
    </div>

    <div class="form-section">
        <label class="form-label">카테고리</label>
        <select id="categorySelect" class="form-select">
            <option selected disabled>카테고리를 선택하세요</option>
        </select>
    </div>

    <div class="form-section">
        <label class="form-label">진행 방법</label>
        <select id="onOff" class="form-select">
            <option selected disabled>선택하세요</option>
            <option value="online">온라인</option>
            <option value="offline">오프라인</option>
        </select>
    </div>

    <div class="form-section">
        <label class="form-label">기간</label>
        <input type="text" class="form-control" placeholder="예: 2주, 1개월 등">
    </div>

    <div class="form-section">
        <label class="form-label">이미지</label>
        <input type="file" class="form-control">
    </div>

    <div class="form-section">
        <label class="form-label">의뢰비</label>
        <input type="text" id="price" class="form-control" placeholder="예: 100,000원">
    </div>

    <div class="form-section">
        <label class="form-label">내용</label>
        <textarea id="content" class="form-control" rows="5" placeholder="상세 내용을 입력하세요"></textarea>
    </div>

    <div class="form-section">
        <label class="form-label">의뢰 장소</label>
        <div class="address-group">
            <button type="button" class="btn btn-primary">On/Off</button>
            <input type="text" class="form-control" placeholder="장소 주소를 입력하세요">
        </div>
    </div>

    <div class="text-center mt-4">
        <button class="btn btn-submit" onclick="fnSubmit()">의뢰 하기</button>
    </div>
</div>

<!-- Script -->
<script src="https://cdn.jsdelivr.net/npm/jwt-decode@4.0.0/build/jwt-decode.min.js"></script>
<script>
    let memberId = 0;
    getMember();
    function getMember() {
        fetch("/getMember.dox", {
            method : "POST",
            headers : { "Content-Type": "application/json" },
            body : JSON.stringify()
        })
            .then(res => res.json())
            .then(data => {
                console.log(data);
                memberId = data.memberId;
            })
    }

    function fnSubmit() {
        const categoryId = document.querySelector("#categorySelect").value;
        const title = document.querySelector("#title").value;
        const onOff = document.querySelector("#onOff").value;
        const price = document.querySelector("#price").value;
        const content = document.querySelector("#content").value;

        const data = { categoryId, title, onOff, price, content, memberId };

        if(data.memberId === 0) {
            alert("로그인해주세요.");
            return;
        }

        if (confirm('의뢰 하시겠습니까?')) {
            fetch("/client/insert.dox", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(data)
            })
                .then(res => res.json())
                .then(result => {
                    alert('등록되었습니다.');
                    location.href = '/request/list';
                })
                .catch(err => {
                    console.error(err);
                    alert("등록 중 오류가 발생했습니다.");
                });
        }
    }

    function fnGetCategory() {
        fetch("/common/category.dox", {
            method: "POST"
        })
            .then(res => res.json())
            .then(data => {
                const selectBox = document.querySelector("#categorySelect");
                data.categoryList.forEach(cat => {
                    const option = document.createElement("option");
                    option.value = cat.categoryId;
                    option.text = cat.categoryName;
                    selectBox.appendChild(option);
                });
            });
    }

    fnGetCategory();
</script>

</body>
</html>
