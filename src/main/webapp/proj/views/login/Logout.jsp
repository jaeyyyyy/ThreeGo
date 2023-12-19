<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%

//2번 방법 : 모든 속성 한꺼번에 삭제
    session.invalidate();

//속성 삭제 후 페이지 이동
    response.sendRedirect("/proj/views/index.jsp");

%>