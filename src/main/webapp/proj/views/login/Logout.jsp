<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    //1번 방법 : 회원 인증 정보 속성 삭제
//session.removeAttribute("UserId");
//session.removeAttribute("UserName");

//2번 방법 : 모든 속성 한꺼번에 삭제, 1번보다는 2번이 더 좋다.
    session.invalidate();

//속성 삭제 후 페이지 이동
    response.sendRedirect("LoginForm.jsp");
%>>