package com.controller;

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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String pw = req.getParameter("pw");

        LoginService loginService = new LoginService();
        UserDTO loginUser = loginService.getLoginUser(id, pw);  // LoginService 클래스의 메서드 호출

        if (loginUser != null) {
            HttpSession session = req.getSession();
            session.setAttribute("id", id);
            resp.sendRedirect("LoginForm.jsp");
        } else {
            resp.setContentType("text/html; charset=UTF-8");
            PrintWriter out = resp.getWriter();
            out.println("<script>");
            out.println("alert('로그인 실패')");
            out.println("history.back()");
            out.println("</script>");
        }
    }
}
