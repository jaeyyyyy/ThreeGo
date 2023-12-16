<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Bootstrap icons-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css" type="text/css" />
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display:ital@0;1&family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../../../proj/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../../proj/resources/assets/css/style.css?after" rel="stylesheet" />
    <title>Title</title>
    <script type="text/javascript">
        function validateForm(form){
            if(!form.pass.value){
                alert("비밀번호를 입력 하세요");
                return false;
            }
        }
    </script>
</head>
<body>
<!-- header-->
<jsp:include page="../common/header.jsp"/>
<form name="writeFrm" method="post" action="/mvcboard/pass.do" onsubmit="return validateForm(this);">
    <input type="hidden" name="idx" value="${param.idx}">
    <input type="hidden" name="mode" value="${param.mode}">
    <table border="1" width="90%">
        <tr>
            <td>비밀번호</td>
            <td><input type="password" name="pass" style="width: 100px;"/></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit">검증</button>
                <button type="reset">RESET</button>
                <button type="button" onclick="location.href='../mvcboard/list.do';">목록</button>
            </td>
        </tr>
    </table>
</form>
<!--footer-->
<jsp:include page="../common/footer.jsp"/>
</body>
</html>