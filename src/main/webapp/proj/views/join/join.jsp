<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="../../proj/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../proj/resources/assets/css/style.css?after" rel="stylesheet" />
    <link href="../proj/views/common/commonstyle.css?after" rel="stylesheet"/>
    <title>회원가입</title>
    <link rel = "icon" href="image/wave.ico">

    <!-- 자바스크립트(유효성검사 해당) -->
    <script src ="signUpjs3.js"></script>

</head>
<body>
<c:if test="${ joinResult == 0}">
    <script>
        function joinUser() {
            const joinForm = document.querySelector("#joinForm");
            const id = joinForm.id.value;
            const pw1 = joinForm.pw1.value;
            const pw2 = joinForm.pw2.value;
            const name = joinForm.name.value;
            const email = joinForm.email.value;

            if(id.length == 0 || id == "") {
                alert("아이디를 입력해주세요.");
                joinForm.id.focus();
            } else if (joinForm.idDuplication.value!="idCheck") {
                alert("아이디 중복체크를 해주세요.");
            } else if(pw1.length == 0 || pw1 == "") {
                alert("비밀번호를 입력해주세요.");
                joinForm.pw1.focus();
            } else if (pw2.length == 0 || pw2 == "") {
                alert("비밀번호를 다시 입력해주세요.");
                joinForm.pw2.focus();
            } else if (pw2 != pw1) {
                alert("입력하신 비밀번호가 다릅니다.");
                joinForm.pw2.focus();
            } else if(name.length == 0 || name == "") {
                alert("이름을 입력해주세요.");
                joinForm.name.focus();
            } else if(email.length == 0 || email == "") {
                alert("이메일을 입력해주세요.");
                joinForm.email.focus();
            }

        }

    </script>
</c:if>
<jsp:include page="../common/header.jsp"/>
<div id="wrap" class="wrapper">
    <form action="/join/join.do" method ="post" id="joinForm">
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
                        <input type="text" name="id" class="form-control form-control-sm" maxlength="20" placeholder="아이디를 입력하세요."/>
                        <%--                    <!--아이디 중복확인-->--%>
<%--                        <button type="button" onclick="joinUser()" name="dbCheckId" class="btn btn-primary btn-sm">중복 확인</button>--%>
                        <button type="button" onclick="checkDuplicateId()" name="dbCheckId" class="btn btn-primary btn-sm">중복 확인</button>

                        <input type="hidden" name="idDuplication" value="idUncheck"/>
                    </div>
                </div>

                <div class="userInput m-5">
                    <!-- 비밀번호 입력 -->
                    <h4 class="list">비밀번호</h4>
                    <input type="password" name="pw1" id="pw1" class="form-control form-control-sm" maxlength="20" placeholder="비밀번호를 입력하세요.">
                </div>

                <!-- 비밀번호 재확인 입력 -->
                <div class="userInput m-5">
                    <h4 class="list">비밀번호 재확인</h4>
                    <input type="password" name="pw2" id="pw2" class="form-control form-control-sm" maxlength="20" placeholder="입력한 비밀번호를 확인해주세요.">
                </div>

                <!-- 성명 입력 -->
                <div class="userInput m-5">
                    <h4 class="list">성명</h4>
                    <input type="text" name="name" id="name" class="form-control form-control-sm" maxlength="20" placeholder="이름을 입력해주세요.">
                </div>

                <!-- 이메일 입력 -->
                <div class="userInput m-5">
                    <h4 class="list">이메일</h4>
                    <div class="input-group">
                        <input type="email" name="email" id="emailCheck" class="form-control form-control-sm" placeholder="이메일을 입력해주세요.">
                        <!--이메일 인증-->
                        <input type="button" value="인증하기" class="btn btn-primary btn-sm" onclick="">
                    </div>
                </div>

                <%-- 가입버튼--%>
                <div class="col text-center">
<%--                <input type="submit" value="가입" id="joinBtn" class="btn btn-primary btn-md">--%>
                    <input type="button" value="가입" id="joinBtn" class="btn btn-primary btn-md" onclick="checkDuplicateIdAndJoin()">

                </div>


            </div>
        </div>
    </form>
</div>
<!--footer-->
<jsp:include page="../common/footer.jsp"/>

<script>
    document.getElementById('joinBtn').addEventListener('click', function() {
        // 간단한 유효성 검사
        var pw1 = document.getElementsByName('pw1')[0].value;
        var pw2 = document.getElementsByName('pw2')[0].value;

        if (pw1 !== pw2) {
            alert('비밀번호와 비밀번호 재입력 값이 같아야 합니다.');
            event.preventDefault(); // 폼 제출 막기
        }
    });
</script>

<%--//아이디 체크--%>
<script>
    function checkDuplicateId() {
        const id = document.querySelector("input[name='id']").value;

        // Ajax를 이용한 서버 통신
        const xhr = new XMLHttpRequest();
        xhr.open("POST", "/checkDuplicateId", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    const response = xhr.responseText;

                    if (response === "unavailable") {
                        alert("이미 사용 중인 아이디입니다. 다른 아이디를 입력해주세요.");
                        document.querySelector("input[name='idDuplication']").value = "idUncheck";
                    } else {
                        alert("사용 가능한 아이디입니다.");
                        document.querySelector("input[name='idDuplication']").value = "idCheck";
                    }
                } else {
                    alert("서버와의 통신에 문제가 발생했습니다.");
                }
            }
        };

        // 서버로 보낼 데이터 조합
        const data = "id=" + encodeURIComponent(id);

        // 데이터 전송
        xhr.send(data);
    }
</script>
<%--//가입불가로 만들기 --%>
<script>
    function checkDuplicateIdAndJoin() {
        const id = document.querySelector("input[name='id']").value;

        // Ajax를 이용한 서버 통신
        const xhr = new XMLHttpRequest();
        xhr.open("POST", "/checkDuplicateId", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    const response = xhr.responseText;

                    if (response === "unavailable") {
                        alert("이미 사용 중인 아이디입니다. 다른 아이디를 입력해주세요.");
                        document.querySelector("input[name='idDuplication']").value = "idUncheck";
                    } else {
                        // 아이디 중복이 아니면 가입 진행
                        document.querySelector("input[name='idDuplication']").value = "idCheck";
                        document.getElementById('joinForm').submit();
                    }
                } else {
                    alert("서버와의 통신에 문제가 발생했습니다.");
                }
            }
        };

        // 서버로 보낼 데이터 조합
        const data = "id=" + encodeURIComponent(id);

        // 데이터 전송
        xhr.send(data);
    }
</script>


</body>
</html>
