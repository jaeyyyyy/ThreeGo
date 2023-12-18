package com.controller;

import com.DAO.*;
import com.DTO.*;

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

@WebServlet("/info/area.do")
public class InfoController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        AreaDAO ar_dao = new AreaDAO();
        Cat1DAO cat1_dao = new Cat1DAO();
        C_TypeDAO c_type_dao = new C_TypeDAO();

        List<AreaDTO> areaList = ar_dao.selectList();
        List<Cat1DTO> cat1List = cat1_dao.selectList();
        List<C_TypeDTO> c_typeList = c_type_dao.selectList();

        ar_dao.close();
        cat1_dao.close();
        c_type_dao.close();

        req.setAttribute("areaList", areaList);
        req.setAttribute("cat1List", cat1List);
        req.setAttribute("c_typeList", c_typeList);


        req.getRequestDispatcher("/proj/views/tourinfo/area.jsp").forward(req, resp);

    }

}
