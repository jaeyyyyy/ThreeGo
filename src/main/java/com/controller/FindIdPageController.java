package com.controller;

import com.DAO.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/findId.do")
public class FindIdPageController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/proj/views/login/FindId.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String u_email = req.getParameter("u_email");

        UserDAO dao = UserDAO.getInstance();
        String findId = dao.findId(u_email);

        req.setAttribute("findId", findId);
        req.setAttribute("u_email", u_email);
        req.getRequestDispatcher("/proj/views/login/FindIdResult.jsp").forward(req,resp);
    }
}
