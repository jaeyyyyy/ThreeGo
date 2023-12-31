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
    <!-- jquery-->
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../../proj/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../proj/resources/assets/css/style.css?after" rel="stylesheet" />
    <link href="../proj/views/common/commonstyle.css?after" rel="stylesheet"/>
    <title>회원가입</title>
    <link rel = "icon" href="image/wave.ico">

    <!-- 자바스크립트(유효성검사 해당) -->
<%--    <script src ="signUpjs3.js"></script>--%>

</head>
<body>

<%--<c:if test="${ joinResult == 0}"></c:if>--%>

<jsp:include page="../common/header.jsp"/>
<div class="sub-header">
    <div class="container pt-5 pl-5">
        <h3 class="display-6 text-white">마이페이지</h3>
    </div>
</div>
<div id="wrap" class="container position-relative pt-5 pb-5">
    <form action="/join/join.do" method ="post" name="joinForm" onsubmit="return joinUser(this)">
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
                <div class="userInput mb-5">
                    <h4 class="list">아이디</h4>
                    <div class="input-group">
                        <!-- 아이디 입력 -->
                        <input type="text" name="id" class="form-control form-control-sm" maxlength="20" placeholder="아이디를 입력하세요."/>
                        <!--아이디 중복확인-->
                        <input type="button" value="중복 확인" class="btn btn-primary btn-sm" id="idCheckBtn">
                        <%--                    <!--아이디 중복확인-->--%>
<%--                        <button type="button" onclick="joinUser()" name="dbCheckId" class="btn btn-primary btn-sm">중복 확인</button>--%>
<%--                        <button type="button" onclick="checkDuplicateId()" name="dbCheckId" class="btn btn-primary btn-sm">중복 확인</button>--%>
<%--                        <input type="hidden" name="idDuplication" value="idUncheck"/>--%>
                    </div>
                </div>

                <div class="userInput mb-5">
                    <!-- 비밀번호 입력 -->
                    <div class="pw_box">
                        <h4 class="list">비밀번호</h4>
                        <div class="pw_info">※알파벳 대문자, 소문자, 숫자와 특수문자[!@#$%^*+=-]를 모두 포함하는 8~15자리로 작성하여 주십시오.</div>
                    </div>
                    <input type="password" name="pw" id="pw" class="form-control form-control-sm" maxlength="20" placeholder="비밀번호를 입력하세요.">
                </div>

                <!-- 비밀번호 재확인 입력 -->
                <div class="userInput mb-5">
                    <h4 class="list">비밀번호 재확인</h4>
                    <input type="password" name="pwconfirm" id="pwconfirm" class="form-control form-control-sm" maxlength="20" placeholder="입력한 비밀번호를 확인해주세요.">
                </div>

                <!-- 성명 입력 -->
                <div class="userInput mb-5">
                    <h4 class="list">성명</h4>
                    <input type="text" name="name" id="name" class="form-control form-control-sm" maxlength="20" placeholder="이름을 입력해주세요.">
                </div>

                <!-- 이메일 입력 -->
                <div class="userInput mb-5">
                    <h4 class="list">이메일</h4>
                    <div class="input-group">
                        <input type="email" name="email" id="emailCheck" class="form-control form-control-sm" placeholder="이메일을 입력해주세요.">
                        <!--이메일 인증-->
                        <input type="button" value="인증하기" class="btn btn-primary btn-sm" id="emailCheckBtn">
                    </div>
                </div>

                <%-- 가입버튼--%>
                <div class="col text-center mb-5">
                    <input type="submit" value="가입" id="joinBtn" class="btn btn-primary btn-md">
                </div>
            </div>
        </div>
    </form>
</div>
<!--footer-->
<jsp:include page="../common/footer.jsp"/>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    let emailCheck = false;
    let idCheck = false;

    document.getElementById('joinBtn').addEventListener('click', function() {
        // 간단한 유효성 검사
        let reg_pw = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
        let id = document.getElementsByName('id')[0].value;
        let pw = document.getElementsByName('pw')[0].value;
        let pwconfirm = document.getElementsByName('pwconfirm')[0].value;
        let name = document.getElementsByName('name')[0].value;
        let email = document.getElementsByName('email')[0].value;

        if(id === ""){
            alert('아이디를 입력해주십시오.');
            event.preventDefault(); // 폼 제출 막기
            document.getElementsByName('id')[0].focus();
        }else if(pw === ""){
            alert('비밀번호를 입력해주십시오.');
            event.preventDefault(); // 폼 제출 막기
            document.getElementsByName('pw')[0].focus();
        }else if(pwconfirm === ""){
            alert('비밀번호 재확인을 입력해주십시오.');
            event.preventDefault(); // 폼 제출 막기
            document.getElementsByName('pwconfirm')[0].focus();
        }else if(name === ""){
            alert('성명을 입력해주십시오.');
            event.preventDefault(); // 폼 제출 막기
            document.getElementsByName('name')[0].focus();
        }else if(email === ""){
            alert('이메일을 입력해주십시오.');
            event.preventDefault(); // 폼 제출 막기
            document.getElementsByName('email')[0].focus();
        }else if(!idCheck){
            alert('아이디 중복을 확인하여 주십시오.');
            event.preventDefault(); // 폼 제출 막기
            document.getElementsByName('id')[0].focus();
        }else if(!reg_pw.test(pw)){
            alert('비밀번호 양식을 다시 확인하여 주십시오.');
            event.preventDefault(); // 폼 제출 막기
            document.getElementsByName('pw')[0].focus();
        }else if(pw != null && pwconfirm != null && pw !== pwconfirm) {
            alert('비밀번호와 비밀번호 재입력 값이 같아야 합니다.');
            event.preventDefault(); // 폼 제출 막기
            document.getElementsByName('pw')[0].focus();
        }else if(!emailCheck){
            alert('이메일을 인증하여 주십시오.');
            event.preventDefault(); // 폼 제출 막기
            document.getElementsByName('email')[0].focus();
        }
    });

    document.getElementById('emailCheckBtn').addEventListener('click',function() {
        let regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
        let testEmails = document.getElementsByName('email')[0].value;

        if(!regExp.test(testEmails)) {
            emailCheck = false;
            alert('이메일 형식이 올바르지 않습니다.');
        } else {
            emailCheck = true;
            alert('적절한 이메일 주소 입니다.');
        }
    })

    document.getElementById('idCheckBtn').addEventListener('click',function() {
        $.ajax({
            url: '/validation.do',
            type: 'GET',
            data : {
                inputId : $('input[name=id]').val(),
                mode : 'id'
            },
            success(data){
                console.log(data)
                let check = data == 'true' ? true : false;
                if(check){
                    alert('이미 사용중인 아이디 입니다.');
                    idCheck = false;
                    $('input[name=id]').focus();
                }else {
                    alert('사용할 수 있는 아이디 입니다.');
                    idCheck = true;
                }
            }
        })
    })

</script>


</body>
</html>
