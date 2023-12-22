<%@ page import="com.DAO.UserDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <!--jquery-->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Bootstrap icons-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css" type="text/css" />
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display:ital@0;1&family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../../../proj/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../../proj/resources/assets/css/style.css?after" rel="stylesheet" />
    <link href="../../proj/views/common/commonstyle.css?after" rel="stylesheet"/>

    <title>마이페이지</title>

</head>
<body>
<!-- header-->
<jsp:include page="../common/header.jsp"/>

<div class="container position-relative">

    <div class="row">
        <div class="col-md-4">
            <h1 style="font-weight: 700;">${dto.u_name}님,</h1>
            <h3 style="font-weight: 500;">환영합니다.</h3>
            <button class="btn btn-primary">정보 수정하기</button>
        </div>
        <div class="col-md-8">

            <!-- 정보 수정 폼 -->
            <form name="writeFrm" action="../mypage.do" method="post" enctype="multipart/form-data" onsubmit="return editUserInfo(this);" >
                <label for="u_id">아이디:</label>
                <input type="text" id="u_id" name="u_id" value="${dto.u_id}" readonly><br>

                <label for="u_name">이름:</label>
                <input type="text" id="u_name" name="u_name" value="${dto.u_name}"><br>

                <label for="u_pw">비밀번호:</label>
                <input type="text" id="u_pw" name="u_pw" value="${dto.u_pw}"><br>

                <label for="u_email">이메일:</label>
                <input type="text" id="u_email" name="u_email" value="${dto.u_email}"><br>

                <label for="u_ofile">사진:</label>
                <c:choose>
                    <c:when test="${not empty dto.u_ofile == true}">
                        <img src="../../../upload/${dto.u_sfile}" />
                    </c:when>
                    <c:otherwise>
                        <img src="../../../proj/resources/assets/img/no_profimg.png" />
                    </c:otherwise>
                </c:choose>


                <input type="hidden" name="prevOfile" value="${dto.u_ofile}">
                <input type="hidden" name="prevSfile" value="${dto.u_sfile}">
                <input type="file" id="u_ofile" name="u_ofile"><br>

                <label for="u_email">자기소개:</label>
                <textarea type="text" id="u_about" name="u_about">${dto.u_about}</textarea><br>

                <button type="submit" class="btn btn-primary btn-sm">정보 수정</button>
            </form>
        </div>
    </div>
</div>
<!--footer-->
<jsp:include page="../common/footer.jsp"/>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function editUserInfo() {
        alert('회원 정보가 변경되었습니다.');
    }
</script>
</body>
</html>
