package com.data;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;

public class InsertData {
    private static String endPoint = "https://apis.data.go.kr/B551011/KorService1/";
    private static String serviceKey = "oTDxn0pUfD9W2CYiwN1aH5IaiEsa%2Bk23JIEWxzyyGm%2FIYyM4%2FsYAdS0JSWOkITYE2IAla8ube%2FgTIe4T2X2IiA%3D%3D";
    private static String MobileOS = "ETC";
    private static String MobileApp = "TEST";


    //TOURITEM 데이터 추가
    public void tourItem() {
        String searchType = "areaBasedList1";
        int numOfRows = 51809;
        int totalData = 51809;
        int totalPage = totalData % numOfRows == 0 ? totalData / numOfRows : (totalData / numOfRows) + 1;

        String altImg = "https://images.unsplash.com/photo-1436491865332-7a61a109cc05?q=80&w=2074&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";

        // 파싱한 데이터를 저장할 변수
        String result = "";

        try {
            for(int pageNo = 1; pageNo <= totalPage; pageNo++){
                URL url = new URL(endPoint + searchType
                        + "?numOfRows=" + numOfRows
                        + "&pageNo=" + pageNo
                        + "&MobileOS=" + MobileOS
                        + "&MobileApp=" + MobileApp
                        + "&serviceKey=" + serviceKey
                        + "&_type=json");

                System.out.println(url);

                BufferedReader bf;

                bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

                result = bf.readLine();

                JSONParser jsonParser = new JSONParser();
                JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
                JSONObject response = (JSONObject)jsonObject.get("response");
                JSONObject body = (JSONObject)response.get("body");
                JSONObject items = (JSONObject)body.get("items");
                JSONArray item = (JSONArray)items.get("item");


                for(int i = 0; i < item.size(); i++){
                    TouritemDAO dao = new TouritemDAO();
                    TouritemDTO dto = new TouritemDTO();
                    JSONObject tourItem = (JSONObject)item.get(i);

                    String firstImage = ((String)tourItem.get("firstimage")).equals("") ? altImg : (String)tourItem.get("firstimage");

                    dto.setContentid((String)tourItem.get("contentid"));
                    dto.setCat1((String)tourItem.get("cat1"));
                    dto.setCat2((String)tourItem.get("cat2"));
                    dto.setCat3((String)tourItem.get("cat3"));
                    dto.setAreacode((String)tourItem.get("areacode"));
                    dto.setContenttypeid((String)tourItem.get("contenttypeid"));
                    dto.setAddr1((String)tourItem.get("addr1"));
                    dto.setAddr2((String)tourItem.get("addr2"));
                    dto.setFirstimage(firstImage);
                    dto.setMapx((String)tourItem.get("mapx"));
                    dto.setMapy((String)tourItem.get("mapy"));
                    dto.setMlevel((String)tourItem.get("mlevel"));
                    dto.setSigungucode((String)tourItem.get("sigungucode"));
                    dto.setTel((String)tourItem.get("tel"));
                    dto.setTitle((String)tourItem.get("title"));

                    dao.insertTouritem(dto);
                    dao.close();
                }
            }
        }catch(Exception e) {
            e.printStackTrace();
        }

    }

        //T_AREA, T_SIGUNGU 데이터 추가
    public void areaCode() throws Exception {
        String searchType = "areaCode1";
        int numOfRows = 17;
        int totalData = 17;
        int totalPage = totalData % numOfRows == 0 ? totalData / numOfRows : (totalData / numOfRows) + 1;

        // 파싱한 데이터를 저장할 변수
        String result = "";

        try {
            for(int pageNo = 1; pageNo <= totalPage; pageNo++){
                URL url = new URL(endPoint + searchType
                        + "?numOfRows=" + numOfRows
                        + "&pageNo=" + pageNo
                        + "&MobileOS=" + MobileOS
                        + "&MobileApp=" + MobileApp
                        + "&serviceKey=" + serviceKey
                        + "&_type=json");

                BufferedReader bf;

                bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

                result = bf.readLine();

                JSONParser jsonParser = new JSONParser();
                JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
                JSONObject response = (JSONObject)jsonObject.get("response");
                JSONObject body = (JSONObject)response.get("body");
                JSONObject items = (JSONObject)body.get("items");
                JSONArray item = (JSONArray)items.get("item");


                for(int i = 0; i < item.size(); i++){
                    AreaDAO dao = new AreaDAO();
                    AreaDTO dto = new AreaDTO();
                    JSONObject area = (JSONObject)item.get(i);

                    int areacode = Integer.parseInt((String)area.get("code"));

                    dto.setJ_areacode(areacode);
                    dto.setJ_area_name((String)area.get("name"));
                    dao.insertArea(dto);
                    dao.close();

                    sigunguCode(areacode);

                }
            }
        }catch(Exception e) {
            e.printStackTrace();
        }
    }

    public void sigunguCode(int areacode) throws Exception {
        String searchType = "areaCode1";
        int numOfRows = 300;

        // 파싱한 데이터를 저장할 변수
        String result = "";

        try {
            URL url = new URL(endPoint + searchType
                    + "?numOfRows=" + numOfRows
                    + "&pageNo=" + 1
                    + "&MobileOS=" + MobileOS
                    + "&MobileApp=" + MobileApp
                    + "&areaCode=" + areacode
                    + "&serviceKey=" + serviceKey
                    + "&_type=json");

            BufferedReader bf;

            bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

            result = bf.readLine();

            JSONParser jsonParser = new JSONParser();
            JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
            JSONObject response = (JSONObject)jsonObject.get("response");
            JSONObject body = (JSONObject)response.get("body");
            JSONObject items = (JSONObject)body.get("items");
            JSONArray item = (JSONArray)items.get("item");


            for(int i = 0; i < item.size(); i++){
                SigunguDAO dao = new SigunguDAO();
                SigunguDTO dto = new SigunguDTO();
                JSONObject sigungu = (JSONObject)item.get(i);

                dto.setS_sigungucode(Integer.parseInt((String)sigungu.get("code")));
                dto.setS_areacode(areacode);
                dto.setSigungu_name((String)sigungu.get("name"));

                dao.insertSigungu(dto);
                dao.close();
                }
        }catch(Exception e) {
            e.printStackTrace();
        }
    }

    public void categoryCode() throws Exception {
        String searchType = "categoryCode1";
        int numOfRows = 300;

        // 파싱한 데이터를 저장할 변수
        String result = "";

        try {
                URL url = new URL(endPoint + searchType
                        + "?numOfRows=" + numOfRows
                        + "&pageNo=" + 1
                        + "&MobileOS=" + MobileOS
                        + "&MobileApp=" + MobileApp
                        + "&serviceKey=" + serviceKey
                        + "&_type=json");


                BufferedReader bf;

                bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

                result = bf.readLine();

                JSONParser jsonParser = new JSONParser();
                JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
                JSONObject response = (JSONObject)jsonObject.get("response");
                JSONObject body = (JSONObject)response.get("body");
                JSONObject items = (JSONObject)body.get("items");
                JSONArray item = (JSONArray)items.get("item");


                for(int i = 0; i < item.size(); i++){
                    Cat1DAO dao = new Cat1DAO();
                    Cat1DTO dto = new Cat1DTO();
                    JSONObject cat = (JSONObject)item.get(i);

                    String cat1 = (String)cat.get("code");

                    dto.setCat1(cat1);
                    dto.setCat1_name((String)cat.get("name"));
                    dao.insertCat1(dto);
                    dao.close();

                    cat2(cat1);

                }

        }catch(Exception e) {
            e.printStackTrace();
        }
    }

    public void cat2(String cat1) throws Exception {
        String searchType = "categoryCode1";
        int numOfRows = 300;

        // 파싱한 데이터를 저장할 변수
        String result = "";

        try {
            URL url = new URL(endPoint + searchType
                    + "?numOfRows=" + numOfRows
                    + "&pageNo=" + 1
                    + "&MobileOS=" + MobileOS
                    + "&MobileApp=" + MobileApp
                    + "&cat1=" + cat1
                    + "&serviceKey=" + serviceKey
                    + "&_type=json");

            BufferedReader bf;

            bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

            result = bf.readLine();

            JSONParser jsonParser = new JSONParser();
            JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
            JSONObject response = (JSONObject)jsonObject.get("response");
            JSONObject body = (JSONObject)response.get("body");
            JSONObject items = (JSONObject)body.get("items");
            JSONArray item = (JSONArray)items.get("item");


            for(int i = 0; i < item.size(); i++){
                Cat2DAO dao = new Cat2DAO();
                Cat2DTO dto = new Cat2DTO();
                JSONObject cat = (JSONObject)item.get(i);

                String cat2 = (String)cat.get("code");

                dto.setCat2(cat2);
                dto.setCat1(cat1);
                dto.setCat2_name((String)cat.get("name"));
                dao.insertCat2(dto);
                dao.close();

                cat3(cat2, cat1);

            }

        }catch(Exception e) {
            e.printStackTrace();
        }
    }

    public void cat3(String cat2, String cat1) throws Exception {
        String searchType = "categoryCode1";
        int numOfRows = 300;

        // 파싱한 데이터를 저장할 변수
        String result = "";

        try {
            URL url = new URL(endPoint + searchType
                    + "?numOfRows=" + numOfRows
                    + "&pageNo=" + 1
                    + "&MobileOS=" + MobileOS
                    + "&MobileApp=" + MobileApp
                    + "&cat1=" + cat1
                    + "&cat2=" + cat2
                    + "&serviceKey=" + serviceKey
                    + "&_type=json");

            BufferedReader bf;

            bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

            result = bf.readLine();

            JSONParser jsonParser = new JSONParser();
            JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
            JSONObject response = (JSONObject)jsonObject.get("response");
            JSONObject body = (JSONObject)response.get("body");
            JSONObject items = (JSONObject)body.get("items");
            JSONArray item = (JSONArray)items.get("item");


            for(int i = 0; i < item.size(); i++){
                Cat3DAO dao = new Cat3DAO();
                Cat3DTO dto = new Cat3DTO();
                JSONObject cat = (JSONObject)item.get(i);

                String cat3 = (String)cat.get("code");

                dto.setCat3(cat3);
                dto.setCat2(cat2);
                dto.setCat1(cat1);
                dto.setCat3_name((String)cat.get("name"));
                dao.insertCat3(dto);
                dao.close();

            }

        }catch(Exception e) {
            e.printStackTrace();
        }
    }
}
