package com.controller;

import com.DAO.Cat2DAO;
import com.DAO.Cat3DAO;
import com.DAO.SigunguDAO;
import com.DAO.TouritemDAO;
import com.DTO.Cat2DTO;
import com.DTO.Cat3DTO;
import com.DTO.SigunguDTO;
import com.DTO.TouritemDTO;
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

@WebServlet("/select.do")
public class SelectController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BufferedReader reader = req.getReader();
        String result = reader.readLine();
//        JSONParser parser = new JSONParser();
//        JSONObject data = new JSONObject();
//        try {
//            data = (JSONObject) parser.parse(result);
//        } catch (ParseException e) {
//            throw new RuntimeException(e);
//        }
//        String area = (String) data.get("area");
//        String sigungu = (String) data.get("sigungu");

        String area = cropValue(result, "\"area\":\"");
        String sigungu = cropValue(result, "\"sigungu\":\"");
        String cat1 = cropValue(result, "\"cat1\":\"");
        String cat2 = cropValue(result, "\"cat2\":\"");
        String cat3 = cropValue(result, "\"cat3\":\"");
        String type = cropValue(result, "\"type\":\"");

        reader.close();

        Map<String, Object> map = new HashMap<>();

        if(area != null) map.put("area", area);
        if(sigungu != null) map.put("sigungu", sigungu);
        if(cat1 != null) map.put("cat1", "'"+ cat1 +"'");
        if(cat2 != null) map.put("cat2", "'"+ cat2 +"'");
        if(cat3 != null) map.put("cat3", "'"+ cat3 +"'");
        if(type != null) map.put("type", type);

        SigunguDAO si_dao = new SigunguDAO();
        Cat2DAO cat2_dao = new Cat2DAO();
        Cat3DAO cat3_dao = new Cat3DAO();

        List<SigunguDTO> sigunguList = si_dao.selectList(area);
        List<Cat2DTO> cat2List = cat2_dao.selectList(cat1);
        List<Cat3DTO> cat3List = cat3_dao.selectList(cat1, cat2);

        si_dao.close();
        cat2_dao.close();
        cat3_dao.close();

        JSONObject json = new JSONObject();
        JSONArray sigunguArr = new JSONArray();
        JSONArray cat2Arr = new JSONArray();
        JSONArray cat3Arr = new JSONArray();

        for(SigunguDTO dto : sigunguList){
            JSONObject dtoObj = new JSONObject();
            dtoObj.put("s_sigungucode", dto.getS_sigungucode());
            dtoObj.put("s_areacode", dto.getS_areacode());
            dtoObj.put("sigungu_name", dto.getSigungu_name());
            sigunguArr.add(dtoObj);
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

        json.put("sigunguList", sigunguArr);
        json.put("cat2List", cat2Arr);
        json.put("cat3List", cat3Arr);

        System.out.println(json);

        resp.setContentType("application/x-json; charset=utf-8");
        resp.getWriter().print(json);
    }

    public String cropValue(String result, String valueStr){
        int start = result.indexOf(valueStr) + valueStr.length();
        if(result.indexOf(valueStr) == -1) return null;
        int end = result.indexOf("\"", start+1);
        return result.substring(start,end);
    }
}
