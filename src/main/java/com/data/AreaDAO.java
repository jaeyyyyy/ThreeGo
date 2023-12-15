package com.data;

import com.common.JDBConnect;

import java.util.ArrayList;
import java.util.List;


public class AreaDAO extends JDBConnect {
    public AreaDAO() { super(); }

    public List<AreaDTO> selectList(){
        //쿼리 결과를 담을 변수
        List<AreaDTO> areaList = new ArrayList<AreaDTO>();

        //쿼리문 작성
        String query = "SELECT * FROM t_area ORDER BY j_areacode ASC";

        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()){
                //게시물 하나의 내용을 저장
                AreaDTO dto = new AreaDTO();

                dto.setJ_areacode(rs.getInt("j_areacode"));
                dto.setJ_area_name(rs.getString("j_area_name"));

                areaList.add(dto);
            }


        }catch (Exception e ){
            e.printStackTrace();
            System.out.println("selectList 오류 발생");
        }

        return areaList;
    }

    public int insertArea(AreaDTO dto){
        int result = 1;

        try {
            //쿼리 작성
            String query = "INSERT INTO t_area ("
                    + " j_areacode, j_area_name)"
                    + " VALUES(?,?)";
            psmt = con.prepareStatement(query);
            psmt.setInt(1,dto.getJ_areacode());
            psmt.setString(2,dto.getJ_area_name());

            result = psmt.executeUpdate();
        }catch (Exception e){
            System.out.println("insertArea 메소드 오류 발생");
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

            System.out.println("지역 - JDBC 자원 해제");
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
