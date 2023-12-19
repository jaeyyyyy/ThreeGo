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
    <title>게시판 글 상세보기</title>
</head>
<body>
<!-- header-->
<jsp:include page="../common/header.jsp"/>

<div class="container position-relative pt-5 pb-5">
    <div class="jumbotron">
        <h3 class="display-4">${dto.title}</h3>
    </div>

    <div class="jumbotron">
        <p>글 번호 : ${dto.idx} 작성자 : ${dto.name} 작성일 : ${dto.postdate} 조회수 : ${dto.visitcount}</p>
        <hr class="my-4">
        <p>${dto.content}
            <c:if test="${not empty dto.ofile and isImage == true}">
                <br><img src="../../../upload/${dto.sfile}" style="max-width: 100%"/>
            </c:if></p>

        <c:if test="${not empty dto.ofile}">
            <hr class="my-4">
            ${dto.ofile}
            <a href="../community/download.do?ofile=${dto.ofile}&sfile=${dto.sfile}&idx=${dto.idx}">
                [다운로드]
            </a>
        </c:if>
    </div>

    <div class="text-center">
        <div class="btn-group pt-5" role="group" aria-label="Basic example">
            <button type="button" class="btn btn-primary btn-sm" onclick="location.href='../community/del.do?mode=edit&idx=${param.idx}';">수정</button>
            <button type="button" class="btn btn-primary btn-sm" onclick="location.href='../community/del.do?mode=delete&idx=${param.idx}';">삭제</button>
            <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='../community/list.do';">목록보기</button>
        </div>
    </div>
</div>


<!--footer-->
<jsp:include page="../common/footer.jsp"/>
</body>
</html>