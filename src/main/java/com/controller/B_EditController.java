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

@WebServlet("/community/edit.do")
@MultipartConfig(maxFileSize = 1048576, maxRequestSize = 10485760)
public class B_EditController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String b_id = req.getParameter("b_id");
        BoardDAO dao = new BoardDAO();
        BoardDTO dto = dao.selectView(b_id);

        req.setAttribute("dto", dto);
        req.getRequestDispatcher("/proj/views/community/edit.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 파일 업로드 처리
        String saveDir = req.getServletContext().getRealPath("/upload");

        // 파일 업로드
        String originalFileName = "";
        try {
            originalFileName = FileUtil.uploadFile(req, saveDir);
        } catch (Exception e) {
            JSFunction.alertBack(resp,"파일 업로드 완료");
            return;
        }

        // DB에 UPDATE 데이터 입력
        String b_id = req.getParameter("b_id");
        String prevOfile = req.getParameter("prevOfile");
        String prevSfile = req.getParameter("prevSfile");
        String u_name = req.getParameter("u_name");
        String b_title = req.getParameter("b_title");
        String b_content = req.getParameter("b_content");

        System.out.println("b_id: " + b_id);
        System.out.println("u_name :" + u_name);
        System.out.println("b_title: " + b_title);
        System.out.println("b_content: " + b_content);

        // DTO에 저장
        BoardDTO dto = new BoardDTO();
        dto.setB_id(b_id);
        dto.setU_name(u_name);
        dto.setB_title(b_title);
        dto.setB_content(b_content);

        // 원본 파일명과 저장된 파일 이름 설정
        if(originalFileName != "") {
            String savedFileName = FileUtil.renameFile(saveDir, originalFileName);

            dto.setB_ofile(originalFileName);
            dto.setB_sfile(savedFileName);

            // 기존에 있던 파일 삭제
            FileUtil.deleteFile(req,"upload",prevSfile);

        } else {
            // 첨부파일이 없으면 기존 이름 유지
            dto.setB_ofile(prevOfile);
            dto.setB_sfile(prevSfile);
        }

        // DB에 내용 수정 반영
        BoardDAO dao = new BoardDAO();
        int result = dao.updatePost(dto);
        dao.close();

        if(result == 1) {
            resp.sendRedirect("../community/view.do?b_id=" + b_id);
        } else {
            JSFunction.alertLocation(resp, "비밀번호 검증 다시 해주세요", "../community/view.do?b_id=" + b_id);
        }
    }
}