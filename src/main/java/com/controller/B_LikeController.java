package com.controller;

import com.DAO.LikesDAO;
import org.json.simple.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/like.do")
public class B_LikeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String loginId = (String) session.getAttribute("u_id");
        String b_id = req.getParameter("b_id");
        boolean check = req.getParameter("check").equals("true");

        Map<String, String> map = new HashMap<>();
        map.put("u_id", loginId);
        map.put("b_id",b_id);

        LikesDAO lk_dao = new LikesDAO();

        int result = 0;

        if(check){
            result = lk_dao.deleteLikes(map);
        }else {
            result = lk_dao.insertLikes(map);
        }

        if(result > 0){
            boolean like_check = lk_dao.checkLikes(map);
            int like_count = lk_dao.countLikes(b_id);

            lk_dao.close();

            JSONObject likesInfo = new JSONObject();

            likesInfo.put("like_check", like_check);
            likesInfo.put("like_count", like_count);

            resp.setContentType("application/x-json; charset=utf-8");
            resp.getWriter().print(likesInfo);
        }else {
            System.out.println("좋아요 업데이트 실패");
        }
    }
}
