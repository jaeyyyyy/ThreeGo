package com.controller;

import com.DAO.AreaDAO;
import com.DAO.SigunguDAO;
import com.DAO.TouritemDAO;
import com.DTO.AreaDTO;
import com.DTO.SigunguDTO;
import com.DTO.TouritemDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/info.do")
public class InfoController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        AreaDAO ar_dao = new AreaDAO();

        List<AreaDTO> areaList = ar_dao.selectList();

        ar_dao.close();

        req.setAttribute("areaList", areaList);

        req.getRequestDispatcher("/proj/views/tourinfo/info.jsp").forward(req, resp);

    }

}
