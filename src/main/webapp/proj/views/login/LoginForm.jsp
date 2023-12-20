<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<!-- 코드언어 표시 == 웹 표준지침 준수 -->
<head>
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Bootstrap icons-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css" type="text/css" />
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display:ital@0;1&family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../../proj/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../proj/resources/assets/css/style.css" rel="stylesheet" />
    <title>로그인</title>
    <link rel = "icon" href="image/wave.ico">

    <!-- 자바스크립트(유효성검사 해당) -->
    <script src ="signUpjs3.js"></script>
    <!-- 다음 우편번호찾기 API -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<!-- header-->
<jsp:include page="../common/header.jsp"/>



<script>
    function validateForm(form){
        if(!form.u_id.value){
            alert("아이디 입력 하세요");
            return false;
        }
        if(!form.u_pw.value){
            alert("패스워드 입력 하세요");
            return false;
        }
    }
</script>

<form action="/login.do" method="post" name="loginFrm" onsubmit="return validateForm(this)">
    <div class="container position-relative pt-5 pb-5">
        <h1 class="text-center">로그인</h1>
        <div id="header">
            <p class="text-center">로그인에 필요한 정보를 기입해주세요.</p>
        </div>


        <%--아이디--%>
        <div class="userInput m-5">
            <h4 class="list">아이디</h4>
            <input type="text" name="u_id" class="form-control form-control-sm" maxlength="20" placeholder="아이디를 입력하세요."><br/>
        </div>
        <%--비밀번호--%>
        <div class="userInput m-5">
            <h4 class="list">비밀번호</h4>
            <input type="password" name="u_pw" class="form-control form-control-sm" maxlength="20" placeholder="비밀번호를 입력하세요."><br/>
        </div>
        <%--    로그인 버튼--%>
        <div class="col text-center">
            <input type="submit" value="로그인" class="btn btn-primary btn-md"><br/>
        </div>
    </div>
</form>


<!--footer-->
<jsp:include page="../common/footer.jsp"/>
</body>
</html>
