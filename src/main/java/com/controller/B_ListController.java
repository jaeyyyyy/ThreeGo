package com.controller;

import com.DAO.BoardDAO;
import com.DTO.BoardDTO;
import com.util.BoardPage;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/community/list.do")
public class B_ListController extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //DAO 생성
        BoardDAO dao = new BoardDAO();


        //뷰에 전달할 맵 생성
        Map<String, Object> map = new HashMap<>();

        String searchField = req.getParameter("searchField");
        String searchWord = req.getParameter("searchWord");
        String sort = req.getParameter("sort");

        if(searchWord != null){
            map.put("searchField", searchField);
            map.put("searchWord", searchWord);
        }

        map.put("sort", sort);

        int totalCount = dao.selectCount(map);

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

        List<BoardDTO> boardList = dao.selectListPage(map);



        // 첨부파일이 있으면 첨부파일 출력하게 하기
        String b_id = req.getParameter("b_id");
        BoardDTO dto = dao.selectView(b_id);
        dao.close();

        String ext = null, fileName = dto.getB_sfile();
        if(fileName != null) {
            ext = fileName.substring(fileName.lastIndexOf(".")+1);
        }

        String[] mimeStr = {"png","jpg","gif"};
        List<String> mimeList = Arrays.asList(mimeStr);

        boolean isImage = false;
        if(mimeList.contains(ext)) {
            isImage = true;
        }


        //뷰에 전달할 변수 추가
        String pagingImg = BoardPage.pagingStr(totalCount,pageSize,blockPage,pageNum, map,"../community/list.do");
        map.put("pagingImg", pagingImg);
        map.put("totalCount", totalCount);
        map.put("pageSize", pageSize);
        map.put("pageNum", pageNum);

        req.setAttribute("boardList", boardList);
        req.setAttribute("map", map);
        req.setAttribute("isImage",isImage);
        req.getRequestDispatcher("/proj/views/community/bbs.jsp").forward(req, resp);
    }
}