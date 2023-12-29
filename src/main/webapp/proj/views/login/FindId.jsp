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

    <title>아이디 찾기</title>

    <script>
        function checkEmail(){
            if($('input[name=u_email]').val() === ""){
                alert('이메일을 입력해주십시오.');
                $('input[name=u_email]').focus();
            }else {
                $.ajax({
                    url: '/validation.do',
                    type: 'GET',
                    data : {
                        inputEmail : $('input[name=u_email]').val(),
                        mode : 'email'
                    },
                    success(data){
                        console.log(data)
                        let check = data == 'true' ? true : false;
                        if(check){
                            $('#findId-frm').submit();
                        }else {
                            alert('입력한 메일의 가입 이력이 없습니다.');
                            $('input[name=u_email]').focus();
                        }
                    }
                })
            }
        }
    </script>
</head>
<body>
<form method="post" action="/findId.do" id="findId-frm">
    <table border="1" align="center">
        <tr>
            <th colspan="2">아이디 찾기</th>
        </tr>
        <tr>
            <td>가입시 사용한 이메일을 입력해주세요.</td>
            <td><input type="text" name="u_email"></td>
        </tr>
        <tr>
            <td colspan="2">
                <input id="findId-btn" type="button" value="확인" onclick="checkEmail()">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
