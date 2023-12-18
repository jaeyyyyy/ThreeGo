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
    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>


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
                <!--에디터 적용할 컨테이너-->
                <textarea name="content" id="summernote"></textarea>
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

<script>
    $('#summernote').summernote({
        placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 120,
        toolbar: [
            ['style', ['style']],
            ['font', ['bold', 'underline', 'clear']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['table', ['table']],
            ['insert', ['link', 'picture', 'video']],
            ['view', ['fullscreen', 'codeview', 'help']]
        ],

        height : 400, // set editor height
        minHeight : null, // set minimum height of editor
        maxHeight : null, // set maximum height of editor
        focus : true,
        lang : 'ko-KR', // 기본 메뉴언어 US->KR로 변경,
        styleTags : [
            'span'
        ]

    });
</script>
</body>
</html>