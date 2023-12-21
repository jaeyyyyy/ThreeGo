package com.controller;

import com.DAO.TouritemDAO;
import com.DTO.TouritemDTO;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;

@WebServlet("/info/content.do")
public class T_ContentController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String contentid = req.getParameter("contentid");

        TouritemDAO dao = new TouritemDAO();
        TouritemDTO dto = dao.selectItem(contentid);

        String cat1_name = dao.showCat1Name(dto);
        String cat2_name = dao.showCat2Name(dto);
        String cat3_name = dao.showCat3Name(dto);

        String category = "";
        if(!cat1_name.isEmpty()) category += cat1_name;
        if(!cat2_name.isEmpty()) category += (" > " + cat2_name);
        if(!cat3_name.isEmpty()) category += (" > " + cat3_name);

        req.setAttribute("content", dto);
        req.setAttribute("category", category);
        req.setAttribute("cat3_name", cat3_name);

        // 추가 정보

        String endPoint = "https://apis.data.go.kr/B551011/KorService1/";
        String serviceKey = "oTDxn0pUfD9W2CYiwN1aH5IaiEsa%2Bk23JIEWxzyyGm%2FIYyM4%2FsYAdS0JSWOkITYE2IAla8ube%2FgTIe4T2X2IiA%3D%3D";
        String MobileOS = "ETC";
        String MobileApp = "TEST";
        String searchType ="";
        String contenttypeid = dto.getContenttypeid();
        int numOfRows = 100;

        URL url;
        String result = "";
        JSONArray subItemList = new JSONArray();

        if(contenttypeid.equals("25")){
            searchType = "detailInfo1";

            url = new URL(endPoint + searchType
                    + "?MobileOS=" + MobileOS
                    + "&MobileApp=" + MobileApp
                    + "&contentId=" + contentid
                    + "&contentTypeId=" + contenttypeid
                    + "&numOfRows=" + numOfRows
                    + "&serviceKey=" + serviceKey
                    + "&_type=json");
        }else{
            searchType = "locationBasedList1";
            String mapX = dto.getMapx();
            String mapY = dto.getMapy();
            int radius = 5000;

            url = new URL(endPoint + searchType
                    + "?numOfRows=" + numOfRows
                    + "&MobileOS=" + MobileOS
                    + "&MobileApp=" + MobileApp
                    + "&arrange=O"
                    + "&mapX=" + mapX
                    + "&mapY=" + mapY
                    + "&radius=" + radius
                    + "&contentTypeId=" + contenttypeid
                    + "&serviceKey=" + serviceKey
                    + "&_type=json");
        }

        JSONArray moreItem = new JSONArray();

        try{
            BufferedReader bf;

            bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

            result = bf.readLine();

            JSONParser jsonParser = new JSONParser();
            JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
            JSONObject response = (JSONObject)jsonObject.get("response");
            JSONObject body = (JSONObject)response.get("body");
            JSONObject items = (JSONObject)body.get("items");
            moreItem = (JSONArray)items.get("item");

            for(Object obj : moreItem){
                JSONObject subItem = (JSONObject) obj;
                String subContentId = "";
                if(contenttypeid.equals("25")){
                    subContentId = subItem.get("subcontentid").toString();
                }else {
                    subContentId = subItem.get("contentid").toString();
                }
                TouritemDTO sub_dto = dao.selectItem(subContentId);
                if(contenttypeid.equals("25")){
                    JSONObject json_dto = new JSONObject();
                    json_dto.put("title",sub_dto.getTitle());
                    json_dto.put("mapx",sub_dto.getMapx());
                    json_dto.put("mapy",sub_dto.getMapy());
                    subItemList.add(json_dto);
                }
                subItem.put("subimage",sub_dto.getFirstimage());
            }

        }catch(Exception e) {
            e.printStackTrace();
        }

        req.setAttribute("subItemList", subItemList);
        req.setAttribute("moreItem", moreItem);

        req.getRequestDispatcher("/proj/views/tourinfo/content.jsp").forward(req, resp);
    }
}
