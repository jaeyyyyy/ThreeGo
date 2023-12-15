package com.data;

import com.common.JDBConnect;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class TouritemDAO extends JDBConnect {
    public TouritemDAO() {  super();  }

    public int selectCount(Map<String,Object> map){
        int totalCount = 0;

        int andCount = map.size() - 1;

        String query = "SELECT COUNT(*) FROM touritem";
        if(map.size() > 0){
            query += " WHERE ";
            if(map.containsKey("area")){
                query += "area = " + map.get("area") + " ";
                if(andCount-- > 0) query += "AND ";
            }
            if(map.containsKey("sigungu")){
                query += "sigungu = " + map.get("sigungu") + " ";
                if(andCount-- > 0) query += "AND ";
            }
            if(map.containsKey("cat1")){
                query += "cat1 = " + map.get("cat1") + " ";
                if(andCount-- > 0) query += "AND ";
            }
            if(map.containsKey("cat2")){
                query += "cat2 = " + map.get("cat2") + " ";
                if(andCount-- > 0) query += "AND ";
            }
            if(map.containsKey("cat3")){
                query += "cat3 = " + map.get("cat3") + " ";
                if(andCount > 0) query += "AND ";
            }
            if(map.containsKey("type")){
                query += "type = " + map.get("type") + " ";
            }
        }

        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);
            rs.next();
            totalCount = rs.getInt(1);
        }catch (Exception e ){
            e.printStackTrace();
            System.out.println("selectCount 오류 발생");
        }

        return totalCount;
    }

    public List<TouritemDTO> selectList(Map<String,Object>map){
        //쿼리 결과를 담을 변수
        List<TouritemDTO> bbs = new ArrayList<TouritemDTO>();

        int andCount = map.size() - 1;

        //쿼리문 작성
        String query = "SELECT * FROM touritem";
        if(map.size() > 0){
            query += " WHERE ";
            if(map.containsKey("area")){
                query += "area = " + map.get("area") + " ";
                if(andCount > 0) query += "AND ";
                andCount--;
            }
            if(map.containsKey("sigungu")){
                query += "sigungu = " + map.get("sigungu") + " ";
                if(andCount > 0) query += "AND ";
                andCount--;
            }
            if(map.containsKey("cat1")){
                query += "cat1 = " + map.get("cat1") + " ";
                if(andCount > 0) query += "AND ";
                andCount--;
            }
            if(map.containsKey("cat2")){
                query += "cat2 = " + map.get("cat2") + " ";
                if(andCount > 0) query += "AND ";
                andCount--;
            }
            if(map.containsKey("cat3")){
                query += "cat3 = " + map.get("cat3") + " ";
                if(andCount > 0) query += "AND ";
            }
            if(map.containsKey("type")){
                query += "type = " + map.get("type") + " ";
            }
        }
        query += " ORDER BY contentid DESC";

        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()){
                //게시물 하나의 내용을 저장
                TouritemDTO dto = new TouritemDTO();

                dto.setContentid(rs.getString("contentid"));
                dto.setCat1(rs.getString("cat1"));
                dto.setCat2(rs.getString("cat2"));
                dto.setCat3(rs.getString("cat3"));
                dto.setAreacode(rs.getString("areacode"));
                dto.setContenttypeid(rs.getString("contenttypeid"));
                dto.setAddr1(rs.getString("addr1"));
                dto.setAddr2(rs.getString("addr2"));
                dto.setFirstimage(rs.getString("firstimage"));
                dto.setMapx(rs.getString("mapx"));
                dto.setMapy(rs.getString("mapy"));
                dto.setMlevel(rs.getString("mlevel"));
                dto.setSigungucode(rs.getString("sigungucode"));
                dto.setTel(rs.getString("tel"));
                dto.setTitle(rs.getString("title"));

                bbs.add(dto);
            }


        }catch (Exception e ){
            e.printStackTrace();
            System.out.println("selectList 오류 발생");
        }

        return bbs;
    }

    public int insertTouritem(TouritemDTO dto){
        int result = 1;

        try {
            //쿼리 작성
            String query = "INSERT INTO touritem ("
                    + "contentid, cat1, cat2, cat3, areacode, contenttypeid, "
                    + "addr1, addr2, firstimage, mapx, mapy, mlevel, sigungucode, tel, title)"
                    + "VALUES("
                    + "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            psmt = con.prepareStatement(query);
            psmt.setString(1,dto.getContentid());
            psmt.setString(2,dto.getCat1());
            psmt.setString(3,dto.getCat2());
            psmt.setString(4,dto.getCat3());
            psmt.setString(5,dto.getAreacode());
            psmt.setString(6,dto.getContenttypeid());
            psmt.setString(7,dto.getAddr1());
            psmt.setString(8,dto.getAddr2());
            psmt.setString(9,dto.getFirstimage());
            psmt.setString(10,dto.getMapx());
            psmt.setString(11,dto.getMapy());
            psmt.setString(12,dto.getMlevel());
            psmt.setString(13,dto.getSigungucode());
            psmt.setString(14,dto.getTel());
            psmt.setString(15,dto.getTitle());

            result = psmt.executeUpdate();
        }catch (Exception e){
            System.out.println("insertTouritem 메소드 오류 발생");
            e.printStackTrace();
        }


        return result;
    }

    @Override
    public void close() {
        try {
            if(rs !=null) rs.close();
            if(stmt !=null) stmt.close();
            if(psmt != null) psmt.close();
            if(con != null) con.close();

            System.out.println("관광지 - JDBC 자원 해제");
        }catch (Exception e){
            e.printStackTrace();
        }
    }

}