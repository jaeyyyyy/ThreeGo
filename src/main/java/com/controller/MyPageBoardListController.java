package com.controller;

import com.DAO.BoardDAO;
import com.DAO.UserDAO;
import com.DTO.BoardDTO;
import com.DTO.UserDTO;
import com.util.BoardPage;
import com.util.JSFunction;
import com.util.U_FileUtil;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/mypage/boardlist.do")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, //1mb
        maxRequestSize = 1024 * 1024 * 10 // 10mb
)
public class MyPageBoardListController extends HttpServlet {
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

            BoardDAO b_dao = new BoardDAO();

            //뷰에 전달할 맵 생성
            Map<String, Object> map = new HashMap<>();
            map.put("u_id", u_id);

            int totalCount = b_dao.selectMyCount(map);

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

            System.out.println("start: " + start);
            System.out.println("end: " + end);
            //페이징 처리 끝

            List<BoardDTO> myList = b_dao.selectMyListPage(map);

            //뷰에 전달할 변수 추가
            String pagingImg = BoardPage.pagingStr(totalCount,pageSize,blockPage,pageNum, map,"../mypage/boardlist.do");
            map.put("pagingImg", pagingImg);
            map.put("totalCount", totalCount);
            map.put("pageSize", pageSize);
            map.put("pageNum", pageNum);

            System.out.println(map.get(pagingImg));

            req.setAttribute("dto",dto);
            req.setAttribute("map", map);
            req.setAttribute("myList",myList);

            b_dao.close();

            req.getRequestDispatcher("/proj/views/mypage/mypageBoardList.jsp").forward(req,resp);
        }
    }
}
