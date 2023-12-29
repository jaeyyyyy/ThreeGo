<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form method="get" action="/sendmail.do">
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
                    <input type="submit">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
