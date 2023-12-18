package com.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login.do")
public class U_LoginController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // login.do로의 GET 요청 처리
        // 필요한 로직 수행...

        // 결과를 가지고 다시 idCheck.jsp로 포워딩
        request.getRequestDispatcher("/proj/views/join/idCheck.jsp").forward(request, response);
    }
}
