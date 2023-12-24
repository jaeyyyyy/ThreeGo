package com.controller;

import com.DAO.ReplyDAO;
import com.util.JSFunction;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/community/reply_del.do")
public class R_ReplyDelController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String re_num = req.getParameter("re_num");
        ReplyDAO dao = new ReplyDAO();
        dao.deleteReply(re_num);
    }
}
