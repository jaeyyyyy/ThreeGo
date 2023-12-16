package com.controller;

import com.DAO.SigunguDAO;
import com.DTO.SigunguDTO;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;

@WebServlet("/select.do")
public class SelectController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BufferedReader reader = req.getReader();
        String result = reader.readLine();
        System.out.println(result);

        String area = cropValue(result, "\"area\":\"");
        String sigungu = cropValue(result, "\"sigungu\":\"");
//        String cat1 = cropValue(result, "\"cat1\":\"");
//        String cat2 = cropValue(result, "\"cat2\":\"");
//        String cat3 = cropValue(result, "\"cat3\":\"");
//        String type = cropValue(result, "\"type\":\"");

        reader.close();

        if(sigungu != null) System.out.println("area: " + area);
        if(sigungu != null) System.out.println("sigungu: " + sigungu);

        SigunguDAO si_dao = new SigunguDAO();
        List<SigunguDTO> sigunguList = si_dao.selectList(area);
        for(SigunguDTO dto : sigunguList){
            System.out.println(dto.getSigungu_name());
        }

        si_dao.close();

        JSONObject json = new JSONObject();
        JSONArray dtoArr = new JSONArray();

        for(SigunguDTO dto : sigunguList){
            JSONObject dtoObj = new JSONObject();
            dtoObj.put("s_sigungucode", dto.getS_sigungucode());
            dtoObj.put("s_areacode", dto.getS_areacode());
            dtoObj.put("sigungu_name", dto.getSigungu_name());
            dtoArr.add(dtoObj);
        }

        json.put("sigunguList", dtoArr);

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
