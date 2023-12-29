package com.controller;

import com.DAO.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/validation.do")
public class ValidationController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDAO dao = UserDAO.getInstance();
        String mode = req.getParameter("mode");
        boolean result = false;

        if(mode.equals("id")){
            String inputId = req.getParameter("inputId");
            result = dao.checkDuplicateId(inputId);

            resp.getWriter().print(result);
        }else if(mode.equals("email")) {
            String inputEmail = req.getParameter("inputEmail");
            result = dao.checkDuplicateEmail(inputEmail);

            resp.getWriter().print(result);
        }
    }
}
