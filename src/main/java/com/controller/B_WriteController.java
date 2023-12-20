package com.controller;

import com.DAO.BoardDAO;
import com.DTO.BoardDTO;
import com.util.FileUtil;
import com.util.JSFunction;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.regex.Pattern;

@WebServlet("/community/write.do")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1mb
        maxRequestSize = 1024 * 1024 * 10 //10mb
)
public class B_WriteController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/proj/views/community/write.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 파일 업로드 처리
        String saveDir = req.getServletContext().getRealPath("/upload");

        // 파일 업로드
        String oFileName = "";
        try {
            oFileName = FileUtil.uploadFile(req,saveDir);
        }catch (Exception e) {
            System.out.println("WriteController doPost 오류 발생");
        }



        // 폼값을 DTO에 저장
        BoardDTO dto = new BoardDTO();
        dto.setU_id(req.getParameter("u_id"));
        dto.setU_name(req.getParameter("u_name"));
        dto.setB_title(req.getParameter("b_title"));
        dto.setB_content(req.getParameter("b_content"));



        if(oFileName != "") {
            // 파일명 변경
            String savedFileName = FileUtil.renameFile(saveDir, oFileName);
            dto.setB_ofile(oFileName);
            dto.setB_sfile(savedFileName);
        }

        // DAO를 통해 DB에 게시글 저장
        BoardDAO dao = new BoardDAO();
        int result = dao.insertWrite(dto);
        dao.close();

        if(result == 1) { // 글쓰기 완료
            resp.sendRedirect("../community/list.do");
        } else {
            JSFunction.alertLocation(resp,"글쓰기에 실패했습니다.","../community/write.do");
        }
    }
}
