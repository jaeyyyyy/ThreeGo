package com.controller;

import com.DAO.BoardDAO;
import com.DTO.BoardDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebServlet("/proj/views/community/view.do")
public class B_ViewController extends HttpServlet {
        @Override
        protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            BoardDAO dao = new BoardDAO();
            String idx = req.getParameter("idx");
            dao.updateViewCount(idx);
            BoardDTO dto = dao.selectView(idx);
            dao.close();

            // 줄바꿈 처리
            dto.setContent(dto.getContent().replace("\r\n","<br/>"));

            // 첨부파일 확장자 추출, 이미지 타입 확인
            String ext = null, fileName = dto.getSfile();
            if(fileName != null) {
                ext = fileName.substring(fileName.lastIndexOf(".")+1);
            }

            String[] mimeStr = {"png","jpg","gif"};
            List<String> mimeList = Arrays.asList(mimeStr);

            boolean isImage = false;
            if(mimeList.contains(ext)) {
                isImage = true;
            }

            // 뷰로 포워드
            req.setAttribute("dto",dto);
            req.setAttribute("isImage",isImage);
            req.getRequestDispatcher("/proj/views/community/view.jsp").forward(req,resp);
        }
}
