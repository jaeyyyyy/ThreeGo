<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.DAO.BoardDAO" %>
<%@ page import="com.DTO.BoardDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

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

    <title>게시판 글 작성하기</title>
    <script>
        function validateForm(form){
            if(form.b_writer.value == ""){
                alert("작성자를 입력 하세요");
                form.name.focus();
                return false;
            }
            if(form.b_title.value == ""){
                alert("제목을 입력 하세요");
                form.title.focus();
                return false;
            }
            if(form.b_content.value == ""){
                alert("내용을 입력 하세요");
                form.content.focus();
                return false;
            }
            if(form.pass.value == ""){
                alert("비밀번호를 입력 하세요");
                form.pass.focus();
                return false;
            }
        }
    </script>
</head>
<body>
<!-- header-->
<jsp:include page="../common/header.jsp"/>
<div class="sub-header">
    <div class="container pt-5 pl-5">
        <h3 class="display-6 text-white">게시판</h3>
    </div>
</div>
<div class="container position-relative pt-5 pb-5">
    <form name="writeFrm" method="post" enctype="multipart/form-data" action="../community/write.do" onsubmit="return validateForm(this);">

            <c:if test="${not empty sessionScope.u_id}">
                <input type="hidden" name="u_id" class="form-control form-control-sm" value="${u_id}" />

                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">작성자</label>
                    <div class="col-sm-10">
                        <input type="text" name="u_name" class="form-control form-control-sm" value="${u_name}" readonly />
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">제목</label>
                    <div class="col-sm-10">
                        <input type="text" name="b_title" class="form-control form-control-sm"/>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">내용</label>
                    <div class="col-sm-10">
                        <textarea name="b_content" class="form-control" rows="5"></textarea>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">첨부 파일</label>
                    <div class="col-sm-10">
                        <input type="file" name="b_ofile"/>
                    </div>
                </div>

                <div class="text-center">
                    <div class="btn-group pt-5" role="group" aria-label="Basic example">
                        <button type="submit" class="btn btn-primary btn-sm">작성완료</button>
                        <button type="reset" class="btn btn-secondary btn-sm">다시입력</button>
                        <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='../community/list.do';">목록보기</button>
                    </div>
                </div>
            </c:if>
    </form>
</div>

<!--footer-->
<jsp:include page="../common/footer.jsp"/>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>