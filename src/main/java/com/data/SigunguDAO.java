package com.data;

import com.common.JDBConnect;

import java.util.ArrayList;
import java.util.List;

public class SigunguDAO extends JDBConnect {
    public SigunguDAO() {  super();  }

    public List<SigunguDTO> selectList(String areacode){
        //쿼리 결과를 담을 변수
        List<SigunguDTO>sigunguList = new ArrayList<SigunguDTO>();

        //쿼리문 작성
        String query = "SELECT * FROM t_sigungu"
                    + " WHERE s_areacode = " + areacode
                    + " ORDER BY s_sigungucode DESC";

        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()){
                //게시물 하나의 내용을 저장
                SigunguDTO dto = new SigunguDTO();

                dto.setS_sigungucode(rs.getInt("s_sigungucode"));
                dto.setS_areacode(rs.getInt("s_areacode"));
                dto.setSigungu_name(rs.getString("sigungu_name"));

                sigunguList.add(dto);
            }


        }catch (Exception e ){
            e.printStackTrace();
            System.out.println("selectList 오류 발생");
        }

        return sigunguList;
    }

    public int insertSigungu(SigunguDTO dto){
        int result = 1;

        try {
            //쿼리 작성
            String query = "INSERT INTO t_sigungu ("
                    + " s_sigungucode, s_areacode, sigungu_name )"
                    + " VALUES(?,?,?)";
            psmt = con.prepareStatement(query);
            psmt.setInt(1,dto.getS_sigungucode());
            psmt.setInt(2,dto.getS_areacode());
            psmt.setString(3,dto.getSigungu_name());

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

            System.out.println("시군구 - JDBC 자원 해제");
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
