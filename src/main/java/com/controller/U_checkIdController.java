//package com.controller;
//
//import com.common.JDBConnect;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//
//@WebServlet("/checkDuplicateId")
//public class U_checkIdController extends HttpServlet {
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        resp.setContentType("text/plain");
//        PrintWriter out = resp.getWriter();
//        //클라이언트에서 전송된 아이디
//        String id = req.getParameter("id");
//        //JDBC 연결 및 쿼리 수행
//        JDBConnect jdbConnect = new JDBConnect();
//        try{
//            String sql = "SELECT COUNT(*) FROM USERS WHERE u_id = ?";
//            try(PreparedStatement psmt = jdbConnect.con.prepareStatement(sql)){
//                psmt.setString(1, id);
//                try (ResultSet rs = psmt.executeQuery()){
//                    if(rs.next()){
//                        int count =rs.getInt(1);
//                        if(count > 0){
//                            out.print("unavailable");
//                        }else{
//                            out.print("available");
//                        }
//                    }
//                }
//            }
//
//        }catch (Exception e){
//            System.out.println("id 검사 실패");
//            e.printStackTrace();
//        }finally {
//            jdbConnect.close();
//        }
//    }
//}
