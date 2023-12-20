<%@ page import="com.DAO.BoardDAO" %>
<%@ page import="com.DTO.BoardDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String b_id = request.getParameter("b_id");

    BoardDAO dao = new BoardDAO();
    dao.updateViewCount(b_id);
    BoardDTO dto = dao.selectView(b_id);
    dao.close();
%>

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
<script>
    function deletePost(){
        var confirmed = confirm("정말 삭제하시겠습니까?");
        if (confirmed) {
            var form = document.writeFrm;
            form.method = "post";
            form.action = "../community/del.do?mode=delete&b_id=${param.b_id}";
            form.submit();
        }else {
            alert("취소하였습니다.")
        }
    }
</script>


<!-- header-->
<jsp:include page="../common/header.jsp"/>
<form name="writeFrm">
    <div class="container position-relative pt-5 pb-5">
        <div class="jumbotron">
            <h3 class="display-4">${dto.b_title}</h3>
        </div>

        <div class="jumbotron">
            <p>글 번호 : ${dto.b_id} 작성자 : ${dto.u_name} 작성일 : ${dto.b_postdate} 조회수 : ${dto.b_visitcount}</p>
            <hr class="my-4">
            <p>${dto.b_content}
                <c:if test="${not empty dto.b_ofile and isImage == true}">
                    <br><img src="../../../upload/${dto.b_sfile}" style="max-width: 100%"/>
                </c:if></p>

            <c:if test="${not empty dto.b_ofile}">
                <hr class="my-4">
                ${dto.b_ofile}
                <a href="../community/download.do?b_ofile=${dto.b_ofile}&b_sfile=${dto.b_sfile}&b_id=${dto.b_id}">
                    [다운로드]
                </a>
            </c:if>
        </div>

        <div class="text-center">
            <div class="btn-group pt-5" role="group" aria-label="Basic example">
                <%
                    if(session.getAttribute("u_id") != null
                            && session.getAttribute("u_id").toString().equals(dto.getU_id())){
                %>

                <button type="button" class="btn btn-primary btn-sm" onclick="location.href='../community/edit.do?mode=edit&b_id=${param.b_id}';">수정</button>
                <%--            <button type="button" class="btn btn-primary btn-sm" onclick="location.href='../community/del.do?mode=delete&b_id=${param.b_id}';">삭제</button>--%>
                <button type="button" class="btn btn-primary btn-sm" onclick="deletePost();">삭제</button>
                <%
                    }
                %>

                <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='../community/list.do';">목록보기</button>
            </div>
        </div>
    </div>


</form>



<!--footer-->
<jsp:include page="../common/footer.jsp"/>
</body>
</html>