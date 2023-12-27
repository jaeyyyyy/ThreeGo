package com.controller;

import com.DAO.BoardDAO;
import com.DAO.ReplyDAO;
import com.DAO.UserDAO;
import com.DTO.BoardDTO;
import com.DTO.ReplyDTO;
import com.DTO.UserDTO;
import com.util.BoardPage;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

            //뷰에 전달할 맵 생성
            Map<String, Object> map = new HashMap<>();

            map.put("u_id",u_id);

            int totalCount = re_dao.totalMyCount(u_id);

            //페이징 처리
            ServletContext app = getServletContext();

            int pageSize = Integer.parseInt(app.getInitParameter("POSTS_PER_PAGE"));
            int blockPage = Integer.parseInt(app.getInitParameter("POSTS_PER_BLOCK"));

            //현재 페이지 확인
            int pageNum = 1;
            String pageTemp = req.getParameter("pageNum");
            if(pageTemp != null && !pageTemp.equals("")){
                pageNum = Integer.parseInt(pageTemp);
            }

            int start = (pageNum - 1) * pageSize + 1;
            int end = pageNum * pageSize;

            map.put("start", start);
            map.put("end", end);
            //페이징 처리 끝

            List<ReplyDTO> myReplyList = re_dao.selectMyReplyListPage(map);

            //뷰에 전달할 변수 추가
            String pagingImg = BoardPage.pagingStr(totalCount,pageSize,blockPage,pageNum, map,"../mypage/replylist.do");
            map.put("pagingImg", pagingImg);
            map.put("totalCount", totalCount);
            map.put("pageSize", pageSize);
            map.put("pageNum", pageNum);

            req.setAttribute("myReplyList", myReplyList);
            req.setAttribute("map", map);

            re_dao.close();

            req.getRequestDispatcher("/proj/views/mypage/mypageReplyList.jsp").forward(req,resp);
        }
    }
}
