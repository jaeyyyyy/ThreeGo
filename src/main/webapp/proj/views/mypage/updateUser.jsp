<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
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
</body>
</html>
