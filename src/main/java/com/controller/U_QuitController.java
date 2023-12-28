package com.controller;

import com.DAO.UserDAO;
import com.DTO.UserDTO;
import com.util.JSFunction;
import com.util.U_FileUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/quit.do")
public class U_QuitController extends HttpServlet {
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
            req.getRequestDispatcher("/proj/views/mypage/quit.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 사용자가 로그인이 되어 있는지 확인
        HttpSession session = req.getSession();
        String u_id = (String) session.getAttribute("u_id");
        System.out.println(u_id);
        String u_pw = req.getParameter("sign");
        System.out.println(u_pw);
        // DAO 가져오기
        UserDAO dao = UserDAO.getInstance();
        UserDTO dto = dao.findUser(u_id);


        if(u_pw.equals(dto.getU_pw())) {
            int delResult = 0;
            dto.setU_id(u_id);
            delResult = dao.delUser(dto);
            System.out.println(delResult);

            if(delResult == 1) {
                String savedFileName = dto.getU_sfile();
                U_FileUtil.deleteFile(req,"upload",savedFileName);
                JSFunction.alertLocation(resp,"탈퇴처리 되었습니다.","../proj/views/index.jsp");
                session.invalidate();
            } else {
                System.out.println("외않되노");
            }
        }
    }
}
