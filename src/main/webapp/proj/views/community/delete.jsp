<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
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
    <title>게시판 글 삭제하기</title>
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

<div class="container position-relative pt-5 pb-5">
    <form name="writeFrm" method="post" action="../community/del.do" onsubmit="return validateForm(this);">
        <input type="hidden" name="idx" value="${param.idx}">
        <input type="hidden" name="mode" value="${param.mode}">

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">비밀번호</label>
            <div class="col-sm-10">
                <input type="password" name="pass" class="form-control form-control-sm"/>
            </div>
        </div>

        <div class="text-center">
            <div class="btn-group pt-5" role="group" aria-label="Basic example">
                <button type="submit" class="btn btn-primary btn-sm">검증</button>
                <button type="reset" class="btn btn-secondary btn-sm">RESET</button>
                <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='../community/list.do';">목록보기</button>
            </div>
        </div>
    </form>
</div>



<!--footer-->
<jsp:include page="../common/footer.jsp"/>
</body>
</html>