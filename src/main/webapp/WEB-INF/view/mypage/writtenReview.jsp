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
</head>
<body>

<c:import url="/WEB-INF/fragment/navbar.jsp"/>


<div class="d-flex">
    <c:import url="/WEB-INF/fragment/mypagebar.jsp"/>

    <div style="flex-grow: 1; height: 500px">
        <c:import url="/WEB-INF/fragment/pointbar.jsp"/>
        <div class="d-flex flex-column justify-content-center align-items-center">
            <h4 class="text-center mt-5 mb-5">내가 쓴 리뷰</h4>

            <div class="w-75">
                <table class="table text-center">
                    <thead>
                    <tr>
                        <th style="width: 15%">대상</th>
                        <th style="width: 60%">내용</th>
                        <th style="width: 10%">별점</th>
                        <th style="width: 20%"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr class="align-middle">
                        <td>김아무개</td>
                        <td>불친절 했어요</td>
                        <td>★</td>
                        <td>
                            <a href="#" role="button" class="btn btn-primary btn-edit">수정</a>
                            <button class="btn btn-danger">삭제</button>
                        </td>
                    </tr>
                    <tr class="align-middle">
                        <td>김똘똘</td>
                        <td>너무 친절해요</td>
                        <td>★★★★★</td>
                        <td>
                            <a href="#" role="button" class="btn btn-primary">수정</a>
                            <button class="btn btn-danger">삭제</button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>

        </div>
    </div>
</div>

<div class="modal fade" id="editModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title w-100 text-center">리뷰 수정</h5>
            </div>
            <div class="modal-body">
                <div class="mb-3">
                    <label for="editName" class="form-label">대상</label>
                    <input type="text" class="form-control" id="editName" readonly>
                </div>
                <div class="mb-3">
                    <label for="editContent" class="form-label">내용</label>
                    <textarea class="form-control" id="editContent" rows="3"></textarea>
                </div>
                <div class="mb-3">
                    <label for="editContent" class="form-label">별점</label>
                    <div class="w-100 text-center">★★★★★</div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="submit" class="btn btn-primary" id="saveEdit">수정</button>
            </div>
        </div>
    </div>
</div>

<script>
  $(function () {
    $('.btn-edit').on('click', function () {
      // 1. 클릭된 버튼이 포함된 행(tr)을 가져옴
      let $currentRow = $(this).closest('tr');

      // 2. 행에서 각 셀(td)의 값을 가져오기
      const name = $currentRow.find('td:eq(0)').text().trim();
      const content = $currentRow.find('td:eq(1)').text().trim();

      // 3. 모달 input에 값 채우기
      $('#editName').val(name);
      $('#editContent').val(content);

      // 4. 모달 띄우기
      const modal = new bootstrap.Modal(document.getElementById('editModal'));
      modal.show()
    });
  });

</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq"
        crossorigin="anonymous"></script>
</body>
</html>