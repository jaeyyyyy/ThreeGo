package com.controller;


import com.DAO.*;
import com.DTO.*;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/info/city.do")
public class cityController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String area = req.getParameter("area");

        Cat1DAO cat1_dao = new Cat1DAO();
        SigunguDAO si_dao = new SigunguDAO();
        C_TypeDAO c_type_dao = new C_TypeDAO();
        TouritemDAO ti_dao = new TouritemDAO();

        Map<String, Object> map = new HashMap<>();

        map.put("area", area);

        List<Cat1DTO> cat1List = cat1_dao.selectList();
        List<SigunguDTO> sigunguList = si_dao.selectList(area);
        List<C_TypeDTO> c_typeList = c_type_dao.selectList();
        List<TouritemDTO> touritemList = ti_dao.selectList(map);

        cat1_dao.close();
        si_dao.close();
        c_type_dao.close();
        ti_dao.close();

        req.setAttribute("cat1List", cat1List);
        req.setAttribute("sigunguList", sigunguList);
        req.setAttribute("c_typeList", c_typeList);
        req.setAttribute("touritemList", touritemList);

        req.getRequestDispatcher("/proj/views/tourinfo/city.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BufferedReader reader = req.getReader();
        String result = reader.readLine();
        JSONParser parser = new JSONParser();
        JSONObject data = new JSONObject();
        try {
            data = (JSONObject) parser.parse(result);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        String area = req.getParameter("area");
        String sigungu = (String) data.get("sigungu");
        String cat1 = (String) data.get("cat1");
        String cat2 = (String) data.get("cat2");
        String cat3 = (String) data.get("cat3");
        String type = (String) data.get("type");

        reader.close();

        Map<String, Object> map = new HashMap<>();

        if(area != null) map.put("area", area);
        if(sigungu != null) map.put("sigungu", sigungu);
        if(cat1 != null) map.put("cat1", "'"+ cat1 +"'");
        if(cat2 != null) map.put("cat2", "'"+ cat2 +"'");
        if(cat3 != null) map.put("cat3", "'"+ cat3 +"'");
        if(type != null) map.put("type", type);

        SigunguDAO si_dao = new SigunguDAO();
        Cat1DAO cat1_dao = new Cat1DAO();
        Cat2DAO cat2_dao = new Cat2DAO();
        Cat3DAO cat3_dao = new Cat3DAO();
        TouritemDAO ti_dao = new TouritemDAO();

        List<SigunguDTO> sigunguList = si_dao.selectList(area);
        List<Cat1DTO> cat1List = cat1_dao.selectList();
        List<Cat2DTO> cat2List = cat2_dao.selectList(cat1);
        List<Cat3DTO> cat3List = cat3_dao.selectList(cat1, cat2);
        List<TouritemDTO> touritemList = ti_dao.selectList(map);

        si_dao.close();
        cat1_dao.close();
        cat2_dao.close();
        cat3_dao.close();
        ti_dao.close();

        JSONObject json = new JSONObject();
        JSONArray sigunguArr = new JSONArray();
        JSONArray cat1Arr = new JSONArray();
        JSONArray cat2Arr = new JSONArray();
        JSONArray cat3Arr = new JSONArray();
        JSONArray touritemArr = new JSONArray();

        for(SigunguDTO dto : sigunguList){
            JSONObject dtoObj = new JSONObject();
            dtoObj.put("s_sigungucode", dto.getS_sigungucode());
            dtoObj.put("s_areacode", dto.getS_areacode());
            dtoObj.put("sigungu_name", dto.getSigungu_name());
            sigunguArr.add(dtoObj);
        }

        for(Cat1DTO dto : cat1List){
            JSONObject dtoObj = new JSONObject();
            dtoObj.put("cat1", dto.getCat1());
            dtoObj.put("cat1_name", dto.getCat1_name());
            cat1Arr.add(dtoObj);
        }

        for(Cat2DTO dto : cat2List){
            JSONObject dtoObj = new JSONObject();
            dtoObj.put("cat2", dto.getCat2());
            dtoObj.put("cat1", dto.getCat1());
            dtoObj.put("cat2_name", dto.getCat2_name());
            cat2Arr.add(dtoObj);
        }

        for(Cat3DTO dto : cat3List){
            JSONObject dtoObj = new JSONObject();
            dtoObj.put("cat3", dto.getCat3());
            dtoObj.put("cat2", dto.getCat2());
            dtoObj.put("cat1", dto.getCat1());
            dtoObj.put("cat3_name", dto.getCat3_name());
            cat3Arr.add(dtoObj);
        }

        for(TouritemDTO dto : touritemList){
            JSONObject dtoObj = new JSONObject();
            dtoObj.put("contentid", dto.getContentid());
            dtoObj.put("cat1", dto.getCat1());
            dtoObj.put("cat2", dto.getCat2());
            dtoObj.put("cat3", dto.getCat3());
            dtoObj.put("areacode", dto.getAreacode());
            dtoObj.put("contenttypeid", dto.getContenttypeid());
            dtoObj.put("addr1", dto.getAddr1());
            dtoObj.put("addr2", dto.getAddr2());
            dtoObj.put("firstimage", dto.getFirstimage());
            dtoObj.put("mapx", dto.getMapx());
            dtoObj.put("mapy", dto.getMapy());
            dtoObj.put("mlevel", dto.getMlevel());
            dtoObj.put("sigungucode", dto.getSigungucode());
            dtoObj.put("tel", dto.getTel());
            dtoObj.put("title", dto.getTitle());
        }

        json.put("sigunguList", sigunguArr);
        json.put("cat1List", cat1Arr);
        json.put("cat2List", cat2Arr);
        json.put("cat3List", cat3Arr);
        json.put("touritemList", touritemArr);

        System.out.println(json);

        resp.setContentType("application/x-json; charset=utf-8");
        resp.getWriter().print(json);
    }
}
