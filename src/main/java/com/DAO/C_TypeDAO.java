package com.DAO;

import com.DTO.C_TypeDTO;
import com.common.JDBConnect;

import java.util.ArrayList;
import java.util.List;

public class C_TypeDAO extends JDBConnect {

    public List<C_TypeDTO> selectList(){
        //쿼리 결과를 담을 변수
        List<C_TypeDTO> c_typeList = new ArrayList<C_TypeDTO>();

        //쿼리문 작성
        String query = "SELECT * FROM t_c_type ORDER BY contenttypeid ASC";

        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()){
                //게시물 하나의 내용을 저장
                C_TypeDTO dto = new C_TypeDTO();

                dto.setContenttypeid(rs.getInt("contenttypeid"));
                dto.setCtype_name(rs.getString("ctype_name"));

                c_typeList.add(dto);
            }


        }catch (Exception e ){
            e.printStackTrace();
            System.out.println("selectList 오류 발생");
        }

        return c_typeList;
    }

    public int insertArea(C_TypeDTO dto){
        int result = 1;

        try {
            //쿼리 작성
            String query = "INSERT INTO t_c_type ("
                    + " contenttypeid, ctype_name)"
                    + " VALUES(?,?)";
            psmt = con.prepareStatement(query);
            psmt.setInt(1,dto.getContenttypeid());
            psmt.setString(2,dto.getCtype_name());

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

            System.out.println("컨텐츠타입 - JDBC 자원 해제");
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
