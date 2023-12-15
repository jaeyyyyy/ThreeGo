package com.controller;

import com.DAO.SigunguDAO;
import com.DTO.SigunguDTO;
import org.json.simple.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/select.do")
public class SelectController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String area = req.getParameter("area");
        String sigungu = req.getParameter("sigungu");
        String cat1 = req.getParameter("cat1");
        String cat2 = req.getParameter("cat2");
        String cat3 = req.getParameter("cat3");
        String type = req.getParameter("type");

        System.out.println("area: " + area);
        System.out.println("sigungu: " + sigungu);

        SigunguDAO si_dao = new SigunguDAO();
        List<SigunguDTO> sigunguList = si_dao.selectList("6");

        JSONObject json = new JSONObject();
        json.put("sigunguList", sigunguList);

        resp.setContentType("application/x-json; charset=utf-8");
        resp.getWriter().print(json);
    }
}
