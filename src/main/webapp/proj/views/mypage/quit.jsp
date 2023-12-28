<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    정말 탈퇴하시겠습니까? 탈퇴 시 계정은 삭제되며 복구되지 않습니다.
탈퇴하시려면 비밀번호를 입력하세요.
    <form action="/quit.do" method="post" >
        <input type="password" id="u_pw" name="u_pw" class="form-control form-control-sm" maxlength="20">

        <button id="quitBtn" type="submit" class="btn btn-primary btn-sm">탈퇴하기</button>
    </form>

</body>
</html>
