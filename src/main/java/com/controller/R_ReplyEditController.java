package com.controller;

import com.DAO.ReplyDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/community/reply_edit.do")
public class R_ReplyEditController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String re_num = req.getParameter("re_num");
        String edit_content = req.getParameter("edit_content");

        edit_content = edit_content.replaceAll("\\r?\\n", "<br/>");

        ReplyDAO dao = new ReplyDAO();
        dao.updateReply(re_num, edit_content);
    }
}
