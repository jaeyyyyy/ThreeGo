<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Bootstrap icons-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css" type="text/css" />
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display:ital@0;1&family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <!-- Core theme CSS (includes Bootstrap)-->
<%--    <link href="../../proj/resources/assets/css/bootstrap.min.css" rel="stylesheet" />--%>
<%--    <link href="../../proj/resources/assets/css/style.css" rel="stylesheet" />--%>
<%--    <link href="../proj/views/common/commonstyle.css?after" rel="stylesheet"/>--%>
    <!-- Jquery -->
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>

    <title>Title</title>

    <script>
        function checkId(){
            $.ajax({
                url: '/join/idcheck',
                type: 'GET',
                data : {
                    inputId : $('input[name=u_id]').val()
                },
                success(data){
                    console.log(data)
                    let check = data == 'true' ? true : false;
                    if(check){
                        $('#sendmail-frm').submit();
                    }else {
                        alert('존재하지 않는 아이디 입니다.');
                        $('input[name=id]').focus();
                    }
                }
            })
        }
    </script>
</head>
<body>
    <form method="get" action="/sendmail.do" id="sendmail-frm">
        <table border="1" align="center">
            <tr>
                <th colspan="2">비밀번호 찾기</th>
            </tr>
            <tr>
                <td>비밀번호를 찾으시려는 ID를 입력해주세요.</td>
                <td><input type="text" name="u_id"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input id="sendmail-btn" type="button" value="확인" onclick="checkId()">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
