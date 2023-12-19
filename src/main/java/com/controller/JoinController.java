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
        String pw1 = req.getParameter("pw1");
        String pw2 = req.getParameter("pw2");
        String name = req.getParameter("name");
        String email = req.getParameter("email");

        UserDAO dao = new UserDAO().getInstance();
        UserDTO dto = new UserDTO();
        dto.setU_id(id);
        dto.setU_pw1(pw1);
        dto.setU_pw2(pw2);
        dto.setU_name(name);
        dto.setU_email(email);
        int joinResult = dao.join(dto);

        if(joinResult == 1) {
            req.setAttribute("joinResult", joinResult);
            HttpSession session = req.getSession();
            session.setAttribute("sessionID",id);
//            resp.sendRedirect("/proj/views/index.jsp");
            JSFunction.alertLocation(resp,"회원가입이 완료되었습니다.","/proj/views/index.jsp");
            System.out.println("회원가입완료");
        } else {
            req.setAttribute("joinResult",0);
            req.getRequestDispatcher("/join/join.do").forward(req,resp);
            System.out.println("회원가입실패");
        }


//        // 패스워드 확인
//        if (pw1.equals(pw2)) {
//            UserDAO dao = new UserDAO();
//            // 회원가입 처리(DB에 저장 등)
//
//            // 회원가입 후 메인 페이지로 이동
//            resp.sendRedirect("/main.jsp"); // 적절한 경로로 변경
//
//        } else {
//            req.setAttribute("msg", "패스워드가 일치하지 않습니다.");
//            RequestDispatcher dis = req.getRequestDispatcher("join_fail.jsp");
//            dis.forward(req, resp);
//        }
    }
}
