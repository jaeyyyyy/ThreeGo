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
    <title>게시판 글 작성하기</title>
    <script>
        function validateForm(form){
            if(form.name.value == ""){
                alert("작성자를 입력 하세요");
                form.name.focus();
                return false;
            }
            if(form.content.value == ""){
                alert("내용을 입력 하세요");
                form.content.focus();
                return false;
            }
            if(form.title.value == ""){
                alert("제목을 입력 하세요");
                form.title.focus();
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
<form name="writeFrm" method="post" enctype="multipart/form-data" action="../community/write.do" onsubmit="return validateForm(this);">
    <table border="1" width="90%">
        <tr>
            <td>작성자</td>
            <td><input type="text" name="name" style="width:150px;"/></td>
        </tr>
        <tr>
            <td>제목</td>
            <td><input type="text" name="title" style="width: 90%;"/></td>
        </tr>
        <tr>
            <td>내용</td>
            <td>
                <textarea name="content" style="width: 90%; height: 100px;"></textarea>
            </td>
        </tr>
        <tr>
            <td>첨부 파일</td>
            <td><input type="file" name="ofile"/></td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td>
                <input type="password" name="pass" style="width: 100px;"/>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit">작성완료</button>
                <button type="reset">다시입력</button>
                <button type="button" onclick="location.href='../community/list.do';">목록보기</button>
            </td>
        </tr>
    </table>
</form>
<!--footer-->
<jsp:include page="../common/footer.jsp"/>
</body>
</html>