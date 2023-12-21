package com.controller;

import com.DAO.UserDAO;
import com.DTO.UserDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class UpdateUserInfoController extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        String u_id = (String) session.getAttribute("u_id");

        String newName = req.getParameter("newName");
        String newEmail = req.getParameter("newEmail");


        UserDAO dao = UserDAO.getInstance();

        UserDTO dto = dao.findUser(u_id);
        dto.setU_id(u_id);
        dto.setU_name(newName);
        dto.setU_email(newEmail);

        int result = dao.updateUserInfo(dto);

        if (result > 0) {
            // 업데이트 성공
            // 마이페이지로 리다이렉트하거나 다른 작업 수행
            resp.sendRedirect("mypage");
        } else {
            // 업데이트 실패
            // 에러 메시지를 사용하여 에러 페이지로 리다이렉트하거나 다른 작업 수행
            resp.sendRedirect("mypage?error=1");
        }
    }
}

