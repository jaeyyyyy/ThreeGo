package com.controller;

import com.DAO.BoardDAO;
import com.DTO.BoardDTO;
import com.util.FileUtil;
import com.util.JSFunction;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet("/community/del.do")
public class B_DelController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("mode", req.getParameter("mode"));
        req.getRequestDispatcher("/proj/views/community/delete.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String b_id = req.getParameter("b_id");
        String mode = req.getParameter("mode");

//        BoardDTO dto = BoardDAO.getInstance().getB_id(b_id);

        BoardDTO boardDTO = new BoardDTO();
        BoardDAO dao = new BoardDAO();

        boardDTO = dao.selectView(b_id); //해당 게시글을 가져오기

        //로그인 된 사용자의 ID
        HttpSession session = req.getSession();
        String sessionId = session.getAttribute("u_id").toString();
        System.out.println(sessionId); // 아이디 출력되는 거 확인
        System.out.println(boardDTO.getU_id()); // 0되는데? 못가져오는데?
        System.out.println(boardDTO.getB_sfile()); // 이것도? dto에 접근을 못하는데??ㅜㅠㅠㅜㅠㅠㅠㅠㅠㅠㅠㅠㅠ


        int delResult = 0;
        boardDTO.setB_id(b_id);
        delResult = dao.deletePost(boardDTO);
        dao.close();
        System.out.println(delResult);



        if (sessionId.equals(boardDTO.getU_id())) {
            if (delResult == 1) {
                String savedFileName = boardDTO.getB_sfile();
                FileUtil.deleteFile(req,"upload", savedFileName);
                JSFunction.alertLocation(resp,"삭제되었습니다.","../community/list.do");

            } else {
                JSFunction.alertBack(resp, "삭제 실패");
            }

        } else {
            //작성자 본인이 아니면 삭제 안됨
            JSFunction.alertBack(resp,"본인만 삭제가능 ");
        }
    }
}