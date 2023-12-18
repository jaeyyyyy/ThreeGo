package com.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/logout.do")
public class U_LogoutController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public U_LogoutController(){
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //로그아웃을 처리하기 위한 Servlet doGet 메소드

        // 1. 세션 가져오기
        HttpSession session= req.getSession();
        // 2. 세션 파기
        session.invalidate();
        // 일반적인 로그아웃은 session을 찾아서 파기만 하면 된다.
        // 그런데 로그아웃에 대한 시점을 저장하고 싶다면 -> session에서 데이터(ID값)를 찾아서 DB 에 기록을 해야한다.

        // 3. 메인페이지로 이동
        resp.sendRedirect("/");
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       doGet(req, resp);
    }
}
