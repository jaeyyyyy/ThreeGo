<%@ page import="com.DAO.UserDAO" %>
<%@ page import="com.DTO.UserDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
//로그인 폼으로부터 받은 아이디와 패스워드
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
        response.sendRedirect("login.jsp");
    }else{
        //로그인 실패
        request.setAttribute("LoginErrMsg", "아이디 /패스워드를 확인하세요");
        request.getRequestDispatcher("login.jsp").forward(request,response);
    }

%>