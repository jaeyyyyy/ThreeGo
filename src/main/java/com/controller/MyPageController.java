package com.controller;

import com.DTO.BoardDTO;
import com.DTO.UserDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/mypage.do")
public class MyPageController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 사용자가 로그인이 되어 있는지 확인
        HttpSession session = req.getSession();
        String u_id = (String) session.getAttribute("u_id");

        if(u_id == null) {
            // 로그인 되지 않은 경우 로그인 페이지로 리다이렉트
            resp.sendRedirect("/login.do");
        } else {
            // 로그인 된 경우 마이페이지로 이동
            req.getRequestDispatcher("/proj/views/mypage/mypage.jsp").forward(req,resp);
        }
    }

//    @Override
//    private void showMyPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        UserDTO dto = new UserDTO();
//
//        HttpSession session = req.getSession();
//        String userId = (String) session.getAttribute("u_id");
//    }
}
