package com.controller;

import com.DAO.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/JoinController.do")
public class JoinController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //한글 처리
        req.setCharacterEncoding("UTF-8");

        // view Page에서 보내온 데이터 받기
        String id = req.getParameter("id");
        String pw1 = req.getParameter("pw1");
        String pw2 = req.getParameter("pw2");
        String name = req.getParameter("name");
        String email = req.getParameter("email");

        // 패스워드 확인
        if (pw1.equals(pw2)) {
            UserDAO dao = new UserDAO();
            // 회원가입 처리(DB에 저장 등)

            // 회원가입 후 메인 페이지로 이동
            resp.sendRedirect("/main.jsp"); // 적절한 경로로 변경

        } else {
            req.setAttribute("msg", "패스워드가 일치하지 않습니다.");
            RequestDispatcher dis = req.getRequestDispatcher("join_fail.jsp");
            dis.forward(req, resp);
        }
    }
}
