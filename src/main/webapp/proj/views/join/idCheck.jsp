<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>idCheck</title>
</head>
<body>
<%
//result 값이 null이거나 true/false
    Object result = request.getAttribute("idCheck");
    String userId = (String)request.getAttribute("userId");
%>

<% if(result == null){ %>
<form action="idCheck.do" method="get">
    <input type="text" name="userId" value="<%=userId %>" placeholder="중복 체크할 ID를 입력하세요">
    <input type="submit" value="중복 체크">
</form>
<% if((boolean)result){ %>
<span style="color: red">해당 ID는 이미 사용 중입니다.</span>
<%}else{ %>
<span style="color: blue">해당 ID는 사용 가능합니다.</span>
<button onclick="userId();">사용하기</button>

<script>
    function userId(){
        window.opener.document.getElementById('userId').value='<%=userId%>';
        window.close();
}
</script>
<%} %>
<%} %>

</body>
</html>
