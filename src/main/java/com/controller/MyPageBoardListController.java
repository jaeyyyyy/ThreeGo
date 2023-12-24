package com.controller;

import com.DAO.BoardDAO;
import com.DAO.UserDAO;
import com.DTO.BoardDTO;
import com.DTO.UserDTO;
import com.util.JSFunction;
import com.util.U_FileUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

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
            List<BoardDTO> myList = b_dao.selectMyList(u_id);

            req.setAttribute("dto",dto);
            req.setAttribute("myList",myList);

            b_dao.close();

            req.getRequestDispatcher("/proj/views/mypage/mypageBoardList.jsp").forward(req,resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 세션에서 로그인 된 유저 아이디 가져오기
        HttpSession session = req.getSession();
        String u_id = (String) session.getAttribute("u_id");

        // 프사 제외 해당 유저의 유저정보 가져오기
        String newName = req.getParameter("u_name");
        String newPass = req.getParameter("u_pw");
        String newEmail = req.getParameter("u_email");
        String newAbout = req.getParameter("u_about");
        String prevOfile = req.getParameter("prevOfile");
        String prevSfile = req.getParameter("prevSfile");


        // DAO 가져오기
        UserDAO dao = UserDAO.getInstance();
        // 폼값을 DTO에 저장
        UserDTO dto = dao.findUser(u_id);
        dto.setU_name(newName);
        dto.setU_pw(newPass);
        dto.setU_email(newEmail);
        dto.setU_about(newAbout);

        // 프사 부분
        // 파일 업로드 처리
        String saveDir = req.getServletContext().getRealPath("/upload");

        // 파일 업로드
        String oFileName = "";
        try {
            System.out.println("외않되");
            oFileName = U_FileUtil.uploadFile(req,saveDir);

        }catch (Exception e) {
            System.out.println("mypagecontroller dopost 오류");
            return;
        }

        // 파일명 변경
        if(oFileName != "") {
            String savedFileName = U_FileUtil.renameFile(saveDir, oFileName);

            dto.setU_ofile(oFileName);
            dto.setU_sfile(savedFileName);

            // 기존에 있던 파일 삭제
            U_FileUtil.deleteFile(req,"upload",prevSfile);

        } else {
            // 첨부파일이 없으면 기존 이름 유지
            dto.setU_ofile(prevOfile);
            dto.setU_sfile(prevSfile);
        }

        // updateUserInfo 값
        int result = dao.updateUserInfo(dto);

        req.setAttribute("dto",dto);


        if (result > 0) {
            // 업데이트 성공
            // 마이페이지로 리다이렉트하거나 다른 작업 수행
            JSFunction.alertLocation(resp,"업데이트에 성공하였습니다.","/updateUser.do");
        } else {
            // 업데이트 실패
            // 에러 메시지를 사용하여 에러 페이지로 리다이렉트하거나 다른 작업 수행
            JSFunction.alertBack(resp,"업데이트에 실패하였습니다.");
        }
    }
}
