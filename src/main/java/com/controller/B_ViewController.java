package com.controller;

import com.DAO.BoardDAO;
import com.DAO.ReplyDAO;
import com.DTO.BoardDTO;
import com.DTO.ReplyDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebServlet("/community/view.do")
public class B_ViewController extends HttpServlet {
        @Override
        protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            BoardDAO dao = new BoardDAO();
            String b_id = req.getParameter("b_id");
            dao.updateViewCount(b_id);
            BoardDTO dto = dao.selectView(b_id);
            dao.close();

            // 줄바꿈 처리
            dto.setB_content(dto.getB_content().replace("\r\n","<br/>"));

            // 첨부파일 확장자 추출, 이미지 타입 확인
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

            ReplyDAO re_dao = new ReplyDAO();
            int replyTotal = re_dao.totalCount(b_id);
            List<ReplyDTO> replyList = re_dao.selectReplyList(b_id);


            // 뷰로 포워드
            req.setAttribute("dto",dto);
            req.setAttribute("isImage",isImage);
            req.setAttribute("replyTotal", replyTotal);
            req.setAttribute("replyList", replyList);
            req.getRequestDispatcher("/proj/views/community/view.jsp").forward(req,resp);
        }
}
