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

@WebServlet("/updateUser/quit.do")
public class U_QuitController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 사용자가 로그인이 되어 있는지 확인
        HttpSession session = req.getSession();
        String u_id = (String) session.getAttribute("u_id");
        System.out.println(u_id);
        String u_pw = req.getParameter("q_pw");
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
