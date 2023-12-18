//package com.controller;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import java.io.IOException;
//import java.lang.reflect.Member;
//
//@WebServlet("/login.do")
//public class U_LoginController extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//
//    public U_LoginController(){
//        super();
//    }
//
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        // 로그인을 처리하기 위한 Servlet
//        // 1. 2개의 값을 가져와야한다 (userId, userPwd)
//        String userId = req.getParameter("userId");
//        String userPwd = req.getParameter("userPwd");
//
//        // check(데이터 잘 넘어 왔나)
//        /*
//         * System.out.println("보내온 ID : "+userId);
//         * System.out.println("보내온 PW : "+userPwd);
//         */
//
//        // 2. 비즈니스 로직 처리
//        MemberService mService = new MemberServiceImpl();
//
//        Member m = mService.selectOneMember(userId, userPwd);
//
//        if (m != null) { // 로그인 성공
//
//            HttpSession session = req.getSession(true);
//            session.setAttribute("member", m);
//
//            //로그인 성공시 sendRedirect 메소드를 통하여 메인페이지로 이동
//            // sendRedirect 메소드는 사용자의 URL을 변경시켜주는 response 객체의 메소드
//            resp.sendRedirect("/");
//
//        } else { // 로그인 실패
//
//            // RequestDispatcher를 이용하면 URL을 변경하지 않고, 이동할 수 있다.
//            // 이때 pageContext.forward 처럼 request와 response 객체를 가지고 이동할 수 있다.
//            RequestDispatcher view = req.getRequestDispatcher("/login_fail.jsp");
//
//            view.forward(req, resp);
//        }
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        doGet(req, resp);
//    }
//}
