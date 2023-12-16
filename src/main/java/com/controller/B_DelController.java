package com.controller;

import com.DAO.BoardDAO;
import com.DTO.BoardDTO;
import com.util.FileUtil;
import com.util.JSFunction;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet("/del.do")
public class B_DelController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("mode",req.getParameter("mode"));
        req.getRequestDispatcher("/proj/views/community/delete.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 매개변수
        String idx = req.getParameter("idx");
        String mode = req.getParameter("mode");
        String pass = req.getParameter("pass");

        // 비밀번호 확인
        BoardDAO dao = new BoardDAO();
        boolean confirmed = dao.confirmPassword(pass, idx);
        dao.close();

        if(confirmed) {
            if(mode.equals("edit")) {
                HttpSession session = req.getSession();
                session.setAttribute("pass", pass);
                resp.sendRedirect("../edit.do?idx=" + idx);
            } else if(mode.equals("delete")) {
                dao = new BoardDAO();
                BoardDTO dto = dao.selectView(idx);
                int result = dao.deletePost(idx);
                dao.close();
                if(result == 1) {
                    String savedFileName = dto.getSfile();
                    FileUtil.deleteFile(req,"/upload", savedFileName);
                }
                JSFunction.alertLocation(resp,"삭제되었습니다.","../list.do");
            }
        } else {
            JSFunction.alertBack(resp, "비밀번호 검증 실패");
        }
    }
}