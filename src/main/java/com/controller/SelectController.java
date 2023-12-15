package com.controller;

import com.DAO.SigunguDAO;
import com.DTO.SigunguDTO;
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
import java.util.List;

@WebServlet("/select.do")
public class SelectController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BufferedReader reader = req.getReader();

        String area = cropValue(reader.readLine());
        String sigungu = cropValue(reader.readLine());
        String cat1 = cropValue(reader.readLine());
        String cat2 = cropValue(reader.readLine());
        String cat3 = cropValue(reader.readLine());
        String type = cropValue(reader.readLine());

        reader.close();

        System.out.println("area: " + area);
        System.out.println("sigungu: " + sigungu);

        SigunguDAO si_dao = new SigunguDAO();
        List<SigunguDTO> sigunguList = si_dao.selectList(area);
        for(SigunguDTO dto : sigunguList){
            System.out.println(dto.getSigungu_name());
        }

        si_dao.close();

        JSONObject json = new JSONObject();
//        json.put("area", area);
        json.put("sigunguList", sigunguList);

        resp.setContentType("application/x-json; charset=utf-8");
        resp.getWriter().print(json);
    }

    public String cropValue(String valueStr){
        if(valueStr == null) return null;
        int start = valueStr.indexOf(":") + 2;
        int end = valueStr.lastIndexOf("\"");
        return valueStr.substring(start,end);
    }
}
