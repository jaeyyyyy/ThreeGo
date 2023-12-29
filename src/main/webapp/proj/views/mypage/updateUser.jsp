<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <!--jquery-->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Bootstrap icons-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css" type="text/css" />
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display:ital@0;1&family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../../proj/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../proj/resources/assets/css/style.css?after" rel="stylesheet" />
    <link href="../proj/views/common/commonstyle.css?after" rel="stylesheet"/>
    <title>회원 정보 수정</title>

</head>
<body>


<jsp:include page="../common/header.jsp"/>
<div class="sub-header">
    <div class="container pt-5 pl-5">
        <h3 class="display-6 text-white">회원정보 수정</h3>
    </div>
</div>



<c:if test="${not empty sessionScope.u_id and sessionScope.u_id eq dto.u_id}">
<div id="wrap" class="container position-relative pt-5 pb-5">
    <form name="writeFrm" action="/mypage.do" method="post" enctype="multipart/form-data" onsubmit="return editUserInfo(this);" >
        <div id="header">
            <h1 class="text-center">
                회원정보 수정
            </h1>
            <p class="text-center">회원정보를 수정해주세요.</p>
        </div>

        <div id="container">
            <div class="row_group">
                <!--아이디 입력-->
                <div class="userInput mb-5">
                    <h4 class="list">아이디</h4>
                    <div class="input-group">
                        <input type="text" id="u_id" name="u_id" class="form-control form-control-sm" value="${dto.u_id}" readonly>
                    </div>
                </div>

                <!-- 이름 입력 -->
                <div class="userInput mb-5">
                    <h4 class="list">이름</h4>
                    <div class="input-group">
                        <input type="text" id="u_name" name="u_name" class="form-control form-control-sm" value="${dto.u_name}">
                    </div>
                </div>

                <!-- 비밀번호 입력 -->
                <div class="userInput mb-5">
                    <h4 class="list">비밀번호</h4>
                    <div class="pw_info">※알파벳 대문자, 소문자, 숫자와 특수문자[!@#$%^*+=-]를 모두 포함하는 8~15자리로 작성하여 주십시오.</div>
                    <div class="input-group">
                        <input type="password" id="u_pw" name="u_pw" class="form-control form-control-sm" maxlength="20" value="${dto.u_pw}"><br>
                    </div>
                </div>

                <!-- 비밀번호 재확인 -->
                <div class="userInput mb-5">
                    <h4 class="list">비밀번호 재확인</h4>
                     <div class="input-group">
                        <input type="password" id="u_pwConfirm" class="form-control form-control-sm" maxlength="20" name="u_pwConfirm">
                    </div>
                </div>

                <!--이메일-->
                <div class="userInput mb-5">
                    <h4 class="list">이메일</h4>
                    <div class="input-group">
                        <input type="text" id="u_email" name="u_email" class="form-control form-control-sm" value="${dto.u_email}" readonly >
                    </div>
                </div>

                <!--사진-->
                <div class="userInput mb-5">
                    <h4 class="list">사진</h4>
                    <div class="input-group">
                        <c:choose>
                            <c:when test="${not empty dto.u_ofile == true}">
                                <div class="prof-img mt-5">
                                    <img class="my-prof-img" src="../../../upload/${dto.u_sfile}" />
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="prof-img mt-5">
                                    <img class="my-prof-img" src="../proj/resources/assets/img/no_profimg.png" />
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="input-group">
                        <input type="hidden" name="prevOfile" value="${dto.u_ofile}">
                        <input type="hidden" name="prevSfile" value="${dto.u_sfile}">
                        <input type="file" id="u_ofile" name="u_ofile">
<%--                        <button type="button" onclick="deleteImg();">파일 삭제</button>--%>
                    </div>
                </div>

                <!--자기소개-->
                <div class="userInput mb-5">
                    <h4 class="list">자기소개</h4>
                    <div class="input-group">
                        <textarea type="text" id="u_about" name="u_about" class="form-control" rows="3">${dto.u_about}</textarea>

                    </div>
                </div>

                <div class="text-center">
                    <button id="editBtn" type="submit" class="btn btn-primary btn-sm">정보 수정</button>
<%--                    <button id="quitBtn" type="button" class="btn btn-secondary btn-sm" onclick="location.href='/quit.do'">회원 탈퇴</button>--%>
                </div>

            </div>
        </div>
    </form>

    <!-- Button to Open the Modal -->
    <button type="button" id="quitBtn" class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#quitModal">회원 탈퇴</button>
<form action="/updateUser/quit.do" method="post">
    <!-- The Modal -->
    <div class="modal" id="quitModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">정말 탈퇴하시겠습니까? </h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    탈퇴 시 계정은 삭제되며 복구되지 않습니다.<br>
                    탈퇴하시려면 비밀번호를 입력하세요.
                    <input type="password" id="q_pw" name="q_pw" class="form-control form-control-sm" maxlength="20">
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">탈퇴하기</button>
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
                </div>

            </div>
        </div>
    </div>
</form>

</c:if>


</div>
    <!--footer-->
    <jsp:include page="../common/footer.jsp"/>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        let emailCheck = false;


        document.getElementById('editBtn').addEventListener('click', function() {
            // 간단한 유효성 검사
            let reg_pw = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
            let pw = document.getElementsByName('u_pw')[0].value;
            let pwConfirm = document.getElementsByName('u_pwConfirm')[0].value;

            if (pw != null && pwConfirm != null && pw !== pwConfirm) {
                alert('비밀번호와 비밀번호 재입력 값이 같아야 합니다.');
                event.preventDefault(); // 폼 제출 막기
            } else if (!reg_pw.test(pwConfirm)){
                alert('비밀번호 양식을 다시 확인하여 주십시오.');
                event.preventDefault(); // 폼 제출 막기
                document.getElementsByName('pw')[0].focus();
            }
        });
    </script>
</body>
</html>
