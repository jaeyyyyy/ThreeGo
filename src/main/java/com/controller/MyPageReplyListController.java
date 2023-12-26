package com.controller;

import com.DAO.BoardDAO;
import com.DAO.ReplyDAO;
import com.DAO.UserDAO;
import com.DTO.BoardDTO;
import com.DTO.ReplyDTO;
import com.DTO.UserDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/mypage/replylist.do")
public class MyPageReplyListController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 사용자가 로그인이 되어 있는지 확인
        HttpSession session = req.getSession();
        String u_id = (String) session.getAttribute("u_id");

        if(u_id == null) {
            // 로그인 되지 않은 경우 로그인 페이지로 리다이렉트
            resp.sendRedirect("/login.do");
        } else {
            // 로그인 된 경우 내 댓글 리스트로 이동

            // 댓글 정보 가져오기
            ReplyDAO re_dao = new ReplyDAO();
            List<ReplyDTO> myReplyList = re_dao.selectMyReplyList(u_id);

            req.setAttribute("myReplyList", myReplyList);

            re_dao.close();

            req.getRequestDispatcher("/proj/views/mypage/mypageReplyList.jsp").forward(req,resp);
        }
    }
}
