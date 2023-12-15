<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
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
    <link href="../../resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../resources/assets/css/style.css?after" rel="stylesheet" />

    <title>회원가입</title>
    <link rel = "icon" href="image/wave.ico">
<%--    <style>--%>
<%--        /*@import url("signUpCss3.css");*/--%>
<%--    </style>--%>
    <!-- 자바스크립트(유효성검사 해당) -->
    <script src ="signUpjs3.js"></script>
    <!-- 다음 우편번호찾기 API -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<!-- header-->
<jsp:include page="../common/header.jsp"/>
<div id="wrap" class="wrapper">
    <form action="join_ok.jsp" method ="post" name="join" id="join">
        <!-- 회원가입 타이틀부분 -->
        <div id="header">
            <h1 class="text-center">
                <!--<span><img alt="프로젝트 메인 제목" src="#"></span>-->
                회원가입 정보 입력
            </h1>
            <p class="text-center">회원가입에 필요한 정보를 기입해주세요.</p>
        </div>

        <div id="container">
            <div class="row_group">
                <div class="userInput m-5">
                    <h4 class="list">아이디</h4>
                    <div class="input-group">
                        <!-- 아이디 입력 -->
                        <input type="text" id="id" class="form-control form-control-sm" maxlength="20" placeholder="아이디를 입력하세요.">
                        <!--아이디 중복확인-->
                        <input type="button" value="중복 확인" class="btn btn-primary btn-sm" onclick="">
                    </div>
                </div>

                <div class="userInput m-5">
                    <!-- 비밀번호 입력 -->
                    <h4 class="list">비밀번호</h4>
                    <input type="password" id="pw" class="form-control form-control-sm" maxlength="20" placeholder="비밀번호를 입력하세요.">
                </div>

                <!-- 비밀번호 재확인 입력 -->
                <div class="userInput m-5">
                    <h4 class="list">비밀번호 재확인</h4>
                    <input type="password" id="pwCheck" class="form-control form-control-sm" maxlength="20" placeholder="입력한 비밀번호를 확인해주세요.">
                </div>

                <!-- 성명 입력 -->
                <div class="userInput m-5">
                    <h4 class="list">성명</h4>
                    <input type="text" id="name" class="form-control form-control-sm" maxlength="20" placeholder="이름을 입력해주세요.">
                </div>

                <!-- 이메일 입력 -->
                <div class="userInput m-5">
                    <h4 class="list">비밀번호 재확인</h4>
                    <div class="input-group">
                        <input type="password" id="emailCheck" class="form-control form-control-sm" placeholder="이메일을 입력해주세요.">
                        <!--이메일 인증-->
                        <input type="button" value="인증하기" class="btn btn-primary btn-sm" onclick="">
                    </div>
                </div>

                <%-- 가입버튼--%>
                <div class="col text-center">
                    <input type="submit" value="가입" class="btn btn-primary btn-md">
                </div>


            </div>
        </div>

    </form>
</div>
<!--footer-->
<jsp:include page="../common/footer.jsp"/>
</body>
</html>
