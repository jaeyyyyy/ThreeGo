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

        String cat1_name = dao.showCat1Name(dto);
        String cat2_name = dao.showCat2Name(dto);
        String cat3_name = dao.showCat3Name(dto);

        System.out.println(cat1_name);
        System.out.println(cat2_name);
        System.out.println(cat3_name);

        String category = "";
        if(!cat1_name.isEmpty()) category += cat1_name;
        if(!cat2_name.isEmpty()) category += (" > " + cat2_name);
        if(!cat3_name.isEmpty()) category += (" > " + cat3_name);

        req.setAttribute("content", dto);
        req.setAttribute("category", category);

        req.getRequestDispatcher("/proj/views/tourinfo/content.jsp").forward(req, resp);
    }
}
