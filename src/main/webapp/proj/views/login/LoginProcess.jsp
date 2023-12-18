<%@ page import="com.membership.MemberDAO" %>
<%@ page import="com.membership.MemberDTO" %>
<%@ page import="com.DTO.UserDTO" %>
<%@ page import="com.DAO.UserDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
    //로그인 폼에서 받아온 파라메터
    String userId = request.getParameter("user_id");
    String userPwd = request.getParameter("user_pwd");

    UserDAO dao = new UserDAO();
    UserDTO memberDTO = dao.getUserDTO(userId, userPwd);
    dao.close();


    //로그인 성공 여부에 따른 처리
    if(memberDTO.getId() != null){
        //로그인 성공
        session.setAttribute("UserId", memberDTO.getId());
        session.setAttribute("UserName", memberDTO.getName());
        response.sendRedirect("LoginForm.jsp");
    }else{
        //로그인 실패
        request.setAttribute("LoginErrMsg", "아이디 /패스워드를 확인하세요");
        request.getRequestDispatcher("LoginForm.jsp").forward(request,response);
    }

%>