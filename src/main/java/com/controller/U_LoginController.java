package com.controller;

import com.DTO.ReplyDTO;
import com.util.LoginService;
import com.DTO.UserDTO;  // 변경 없음

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/login.do")
public class U_LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public U_LoginController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       req.getRequestDispatcher("/proj/views/login/LoginForm.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("u_id");
        String pw = req.getParameter("u_pw");
        String prevUrl = req.getParameter("prevUrl");

        LoginService loginService = new LoginService();
        UserDTO loginUser = loginService.getLoginUser(id, pw);  // LoginService 클래스의 메서드 호출

        if (loginUser != null) {
            HttpSession session = req.getSession();
            session.setAttribute("u_id", id);
            session.setAttribute("u_name", loginUser.getU_name());
            session.setAttribute("u_sfile", loginUser.getU_sfile());// 수정된 부분

            // 디버깅을 위한 출력문
            System.out.println("Login User ID: " + loginUser.getU_id());
            System.out.println("Login User ProfileImg: " + loginUser.getU_sfile());

            // alert 창 띄우고 페이지 리다이렉션
            resp.setContentType("text/html; charset=UTF-8");
            PrintWriter out = resp.getWriter();
            out.println("<script>");
            out.println("alert('" + session.getAttribute("u_name") + " 회원님, 로그인하셨습니다.');");
            out.println("location.href = '" + prevUrl + "';");
            out.println("</script>");
        } else {
            // 디버깅을 위한 출력문 (로그인 실패)
            System.out.println("Login failed for User ID: " + id);

            resp.setContentType("text/html; charset=UTF-8");
            PrintWriter out = resp.getWriter();
            out.println("<script>");
            out.println("alert('아이디 또는 비밀번호가 일치하지 않습니다.')");
            out.println("history.back()");
            out.println("</script>");
        }
    }
}
