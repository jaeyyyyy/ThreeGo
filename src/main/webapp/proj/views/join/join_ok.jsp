<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");

    // 1.변수선언
    String url = "jdbc:oracle:thin:@localhost:1521:ORCL";
    String id = "test";
    String pwd = "bitc5600";

    Connection con = null;
    PreparedStatement psmt = null;

    String sql = "insert into members values(?, ?, ?, ?, ?, ?, ?)";

    try{
        // 1. 드라이버 로드
        Class.forName("oracle.jdbc.driver.OracleDriver");

        // 2. conn 생성
        con = DriverManager.getConnection(url, id, pw);



        // 4. sql문 실행
        int result = psmt.executeUpdate();

        if(result == 1){ // 성공
            response.sendRedirect("join_success.jsp");
        } else{ // 실패
            response.sendRedirect("join_fail.jsp");
            System.out.println("join 실패");
        }

    } catch(Exception e){
        System.out.println("join  예외 발생");
        e.printStackTrace();
    } finally{
        try{
            if(con != null) con.close();
            if(psmt != null) psmt.close();
        } catch(Exception e){
            e.printStackTrace();
        }
    }
%>