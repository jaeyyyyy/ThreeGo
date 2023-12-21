package com.controller;

import com.DAO.UserDAO;
import com.DTO.BoardDTO;
import com.DTO.UserDTO;
import com.util.JSFunction;

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

            UserDAO dao = UserDAO.getInstance();
            UserDTO dto = dao.findUser(u_id);

            req.setAttribute("dto",dto);

            req.getRequestDispatcher("/proj/views/mypage/mypage.jsp").forward(req,resp);
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        String u_id = (String) session.getAttribute("u_id");

        String newName = req.getParameter("u_name");
        String newPass = req.getParameter("u_pw1");
        String newEmail = req.getParameter("u_email");

        UserDAO dao = UserDAO.getInstance();

        UserDTO dto = dao.findUser(u_id);
        dto.setU_name(newName);
        dto.setU_pw1(newPass);
        dto.setU_pw2(newPass);
        dto.setU_email(newEmail);

        int result = dao.updateUserInfo(dto);

        req.setAttribute("dto",dto);

        if (result > 0) {
            // 업데이트 성공
            // 마이페이지로 리다이렉트하거나 다른 작업 수행
            resp.sendRedirect("/mypage.do");
        } else {
            // 업데이트 실패
            // 에러 메시지를 사용하여 에러 페이지로 리다이렉트하거나 다른 작업 수행
            JSFunction.alertBack(resp,"업데이트에 실패하였습니다.");
        }
    }
}
