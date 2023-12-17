package com.controller;

import com.DAO.TouritemDAO;
import com.DTO.TouritemDTO;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/tour_list.do")
public class T_ListController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String area = req.getParameter("area");
        String sigungu = req.getParameter("sigungu");
        String cat1 = req.getParameter("cat1");
        String cat2 = req.getParameter("cat2");
        String cat3 = req.getParameter("cat3");
        String type = req.getParameter("type");

        int page = Integer.parseInt(req.getParameter("page"));
        int perPage = 16;

        Map<String, Object> map = new HashMap<>();

        if(area != null) map.put("area", area);
        if(sigungu != null) map.put("sigungu", sigungu);
        if(cat1 != null) map.put("cat1", "'"+ cat1 +"'");
        if(cat2 != null) map.put("cat2", "'"+ cat2 +"'");
        if(cat3 != null) map.put("cat3", "'"+ cat3 +"'");
        if(type != null) map.put("type", type);

        TouritemDAO ti_dao = new TouritemDAO();
        int totalCount = ti_dao.selectCount(map);
        List<TouritemDTO> touritemList = ti_dao.selectListPage(map, page, perPage);

        JSONObject json = new JSONObject();
        JSONArray touritemArr = new JSONArray();

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
            touritemArr.add(dtoObj);
        }

        json.put("totalCount", totalCount);
        json.put("touritemList", touritemArr);

        resp.setContentType("application/x-json; charset=utf-8");
        resp.getWriter().print(json);
    }
}
