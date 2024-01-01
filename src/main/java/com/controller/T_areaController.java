package com.controller;

import com.DAO.*;
import com.DTO.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/info/area.do")
public class T_areaController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 지역, 카테고리, 컨텐츠타입 리스트를 반환하여 동적으로 페이지를 구성하는 용도로 응답
        // 했으나 페이지를 정적으로 재구성하며 사용하지는 않음...(주석처리해도 무관)

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
