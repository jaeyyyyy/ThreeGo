package com.controller;

import com.DAO.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/join/idcheck")
public class IdCheckController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String inputId = req.getParameter("inputId");

        UserDAO dao = UserDAO.getInstance();

        boolean result = dao.checkDuplicateId(inputId);

        resp.getWriter().print(result);
    }
}
