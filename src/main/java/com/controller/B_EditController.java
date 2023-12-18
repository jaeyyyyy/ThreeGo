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
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/community/edit.do")
@MultipartConfig(maxFileSize = 1048576, maxRequestSize = 10485760)
public class B_EditController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idx = req.getParameter("idx");
        BoardDAO dao = new BoardDAO();
        BoardDTO dto = dao.selectView(idx);

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
        String idx = req.getParameter("idx");
        String prevOfile = req.getParameter("prevOfile");
        String prevSfile = req.getParameter("prevSfile");
        String name = req.getParameter("name");
        String title = req.getParameter("title");
        String content = req.getParameter("content");

        System.out.println("idx: " + idx);
        System.out.println("title: " + title);
        System.out.println("content: " + content);

        // 비밀번호는 session에서 가져옴
        HttpSession session = req.getSession();
        String pass = (String)session.getAttribute("pass");

        // DTO에 저장
        BoardDTO dto = new BoardDTO();
        dto.setIdx(idx);
        dto.setName(name);
        dto.setTitle(title);
        dto.setContent(content);
        dto.setPass(pass);

        // 원본 파일명과 저장된 파일 이름 설정
        if(originalFileName != "") {
            String savedFileName = FileUtil.renameFile(saveDir, originalFileName);

            dto.setOfile(originalFileName);
            dto.setSfile(savedFileName);

            // 기존에 있던 파일 삭제
            FileUtil.deleteFile(req,"upload",prevSfile);

        } else {
            // 첨부파일이 없으면 기존 이름 유지
            dto.setOfile(prevOfile);
            dto.setSfile(prevSfile);
        }

        // DB에 내용 수정 반영
        BoardDAO dao = new BoardDAO();
        int result = dao.updatePost(dto);
        dao.close();

        if(result == 1) {
            session.removeAttribute("pass");
            resp.sendRedirect("../community/view.do?idx=" + idx);
        } else {
            JSFunction.alertLocation(resp, "비밀번호 검증 다시 해주세요", "../community/view.do?idx=" + idx);
        }
    }
}