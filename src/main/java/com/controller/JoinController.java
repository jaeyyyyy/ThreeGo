package com.controller;

import com.DAO.UserDAO;
import com.DTO.UserDTO;
import com.util.JSFunction;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/join/join.do")
public class JoinController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/proj/views/join/join.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //한글 처리
        req.setCharacterEncoding("UTF-8");

        // view Page에서 보내온 데이터 받기
        String id = req.getParameter("id");
        String pw = req.getParameter("pw");
        String pwconfirm = req.getParameter("pwconfirm");
        String name = req.getParameter("name");
        String email = req.getParameter("email");

        // 추가된 부분: 모든 필드가 비어있지 않은지 검사


        if(id == null || id.isEmpty()) {
            JSFunction.alertBack(resp,"아이디를 입력해주세요");
            return;
        } else if(pw == null || pw.isEmpty()) {
            JSFunction.alertBack(resp,"비밀번호를 입력해주세요");
            return;
        } else if(pwconfirm == null || pwconfirm.isEmpty()) {
            JSFunction.alertBack(resp,"비밀번호를 재확인해주세요");
            return;
        } else if(name == null || name.isEmpty()) {
            JSFunction.alertBack(resp, "이름을 입력해주세요");
            return;
        } else if(email == null || email.isEmpty()) {
            JSFunction.alertBack(resp,"이메일을 입력해주세요");
            return;
        }


        UserDAO dao = new UserDAO().getInstance();


        // 중복 아이디 검사
        if (dao.checkDuplicateId(id)) {
            // 중복된 아이디가 있는 경우
            JSFunction.alertLocation(resp, "이미 사용 중인 아이디입니다. 다른 아이디를 입력해주세요.", "/join/join.do");
            return;
        }
        UserDTO dto = new UserDTO();
        dto.setU_id(id);
        dto.setU_pw(pw);
        dto.setU_name(name);
        dto.setU_email(email);
        int joinResult = dao.join(dto);

        if (joinResult == 1) {
            req.setAttribute("joinResult", joinResult);
            HttpSession session = req.getSession();
            session.setAttribute("sessionID", id);
            JSFunction.alertLocation(resp, "회원가입이 완료되었습니다.", "/proj/views/index.jsp");
            System.out.println("회원가입 완료");
        } else {
            req.setAttribute("joinResult", 0);
            req.getRequestDispatcher("/join/join.do").forward(req, resp);
            System.out.println("회원가입 실패");
        }



    }
}


