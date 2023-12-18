package com.controller;

import com.DAO.TouritemDAO;
import com.DTO.TouritemDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/info/content.do")
public class T_ContentController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String contentid = req.getParameter("contentid");

        TouritemDAO dao = new TouritemDAO();
        TouritemDTO dto = dao.selctView(contentid);

        req.setAttribute("content", dto);

        req.getRequestDispatcher("/proj/views/tourinfo/content.jsp").forward(req, resp);
    }
}
