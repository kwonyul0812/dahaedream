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
    <c:import url="/WEB-INF/fragment/messagebar.jsp"/>

    <div style="flex-grow: 1; height: 500px">
        <div class="d-flex flex-column justify-content-center align-items-center">
            <h4 class="text-center mt-5 mb-5">받은 쪽지</h4>

            <div style="width: 50%">

                <!-- 받는 이 -->
                <div class="row mb-3">
                    <label class="col-2 col-form-label text-end">보낸 사람</label>
                    <div class="col-10">
                        <input type="text" class="form-control" value="홍길동" id="nickName" readonly/>
                    </div>
                </div>

                <!-- 제목 -->
                <div class="row mb-3">
                    <label class="col-2 col-form-label text-end">제목</label>
                    <div class="col-10">
                        <input type="text" class="form-control" value="의뢰 관련하여 문의 드립니다." readonly/>
                    </div>
                </div>

                <!-- 내용 -->
                <div class="row mb-3">
                    <label class="col-2 col-form-label text-end">내용</label>
                    <div class="col-10">
                        <textarea class="form-control" rows="10" style="resize: none" readonly>비용 협상을 하고 싶습니다.</textarea>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="memberInfo" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title w-100 text-center">홍길동</h4>
            </div>
            <div class="modal-body">
                <div class="mb-3">
                    <h5>받은리뷰</h5>
                </div>
                <div class="bg-body-secondary mb-2 p-2">
                    <div class="mb-2 d-flex justify-content-between">
                        <span>사용자1</span>
                        <span>25-03-11</span>
                    </div>
                    <div>테스트 댓글1 입니다.</div>
                </div>
                <div class="bg-body-secondary mb-2 p-2">
                    <div class="mb-2 d-flex justify-content-between">
                        <span>사용자2</span>
                        <span>25-03-11</span>
                    </div>
                    <div>테스트 댓글2 입니다.</div>
                </div>
                <div class="bg-body-secondary mb-2 p-2">
                    <div class="mb-2 d-flex justify-content-between">
                        <span>사용자2</span>
                        <span>25-03-11</span>
                    </div>
                    <div>테스트 댓글3 입니다.</div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>


<script>
    $(function() {
      $('#nickName').on('click', function() {
        const modal = new bootstrap.Modal(document.getElementById('memberInfo'));
        modal.show()
      });
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq"
        crossorigin="anonymous"></script>
</body>
</html>