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
<jsp:include page="mypageConfirm.jsp"/>
<div class="container position-relative">

    <div class="row">
        <div class="col-md-4">
            <h1 style="font-weight: 700;">${dto.u_name}님,</h1>
            <h3 style="font-weight: 500;">환영합니다.</h3>
            <a href="/updateUser.do">
                <button class="btn btn-primary">정보 수정하기</button>
            </a>

        </div>
        <div class="col-md-8">

            <!-- 정보 수정 폼 -->

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
