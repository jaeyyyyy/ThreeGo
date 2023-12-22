<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <link rel = "icon" href="image/wave.ico">
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
<script>

</script>

<jsp:include page="../common/header.jsp"/>
<div class="sub-header">
    <div class="container pt-5 pl-5">
        <h3 class="display-6 text-white">회원정보 수정</h3>
    </div>
</div>
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
                        <input type="text" id="u_email" name="u_email" class="form-control form-control-sm" value="${dto.u_email}">
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
                                    <img class="my-prof-img" src="../../../proj/resources/assets/img/no_profimg.png')" />
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="input-group">
                        <input type="hidden" name="prevOfile" value="${dto.u_ofile}">
                        <input type="hidden" name="prevSfile" value="${dto.u_sfile}">
                        <input type="file" id="u_ofile" name="u_ofile">
                        <input type="button" id="u_ofile_del" name="u_ofile_del" value="파일 삭제">
                    </div>
                </div>

                <!--자기소개-->
                <div class="userInput mb-5">
                    <h4 class="list">자기소개</h4>
                    <div class="input-group">
                        <textarea type="text" id="u_about" name="u_about" class="form-control" rows="3">${dto.u_about}</textarea>
                    </div>
                </div>

                <button id="editBtn" type="submit" class="btn btn-primary btn-sm">정보 수정</button>
            </div>
        </div>
    </form>
</div>
<script>
    document.getElementById('editBtn').addEventListener('click', function() {
        // 간단한 유효성 검사
        var pw = document.getElementsByName('u_pw')[0].value;
        var pwConfirm = document.getElementsByName('u_pwConfirm')[0].value;

        if (pw != null && pwConfirm != null && pw !== pwConfirm) {
            alert('비밀번호와 비밀번호 재입력 값이 같아야 합니다.');
            event.preventDefault(); // 폼 제출 막기
        }
    });
</script>
</body>
</html>
