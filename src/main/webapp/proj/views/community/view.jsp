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
    <link href="../common/commonstyle.css?after" rel="stylesheet"/>
    <title>게시판 글 상세보기</title>
</head>
<body>
<!-- header-->
<jsp:include page="../common/header.jsp"/>
<h2>파일 첨부형 게시판 - 상세 보기</h2>
<table border="1" width="90%">
    <col width="15%"/>
    <col width="35%"/>
    <col width="15%"/>
    <col width="*"/>

    <%--게시글 정보--%>
    <tr>
        <td>번호</td>
        <td>${dto.idx}</td>
        <td>작성자</td>
        <td>${dto.name}</td>
    </tr>
    <tr>
        <td>작성일</td>
        <td>${dto.postdate}</td>
        <td>조회수</td>
        <td>${dto.visitcount}</td>
    </tr>
    <tr>
        <td>제목</td>
        <td colspan="3">${dto.title}</td>
    </tr>
    <tr>
        <td>내용</td>
        <td colspan="3" height="100">
            ${dto.content}
            <c:choose>
                <c:when test="${not empty dto.ofile and isImage == true}">
                    <br><img src="../../../upload/${dto.sfile}" style="max-width: 100%"/>
                </c:when>
                <c:otherwise>
                    <br>사진이없어염<br>
                </c:otherwise>
            </c:choose>

        </td>
    </tr>
    <tr>
        <td>첨부파일</td>
        <td>
            <c:if test="${not empty dto.ofile}">
                ${dto.ofile}
                <a href="../community/download.do?ofile=${dto.ofile}&sfile=${dto.sfile}&idx=${dto.idx}">
                    [다운로드]
                </a>
            </c:if>
        </td>
        <td>다운로드 수</td>
        <td>${dto.downcount}</td>
    </tr>

    <%--하단 메뉴--%>
    <tr>
        <td colspan="4" align="center">
            <button type="button" onclick="location.href='../community/del.do?mode=edit&idx=${param.idx}';">수정</button>
            <button type="button" onclick="location.href='../community/del.do?mode=delete&idx=${param.idx}';">삭제</button>
            <button type="button" onclick="location.href='../community/list.do';">목록</button>
        </td>
    </tr>
</table>

<!--footer-->
<jsp:include page="../common/footer.jsp"/>
</body>
</html>