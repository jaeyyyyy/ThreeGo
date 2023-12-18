<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>

<%
    boolean result =(boolean)request.getAttribute("result");
%>

<%if(result){ %>
<h1>회원 가입을 축하합니다. Congratulation!</h1>
<a href="/">메인페이지로 이동</a>
<%}else{ %>
<script>
    alert('회원가입에 실패하였습니다.\n지속적인 문제 발생시 \n관리자에게 문의해주세요');
    location.replace('/');
</script>
<%} %>
</body>
</html>