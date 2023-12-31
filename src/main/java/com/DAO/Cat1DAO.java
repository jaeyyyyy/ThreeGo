package com.DAO;

import com.common.JDBConnect;
import com.DTO.Cat1DTO;

import java.util.ArrayList;
import java.util.List;

public class Cat1DAO extends JDBConnect {
    public Cat1DAO() {  super();  }

    public List<Cat1DTO> selectList(){
        //쿼리 결과를 담을 변수
        List<Cat1DTO> cat1List = new ArrayList<Cat1DTO>();

        //쿼리문 작성
        String query = "SELECT * FROM t_cat1 ORDER BY cat1 ASC";

        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()){
                //게시물 하나의 내용을 저장
                Cat1DTO dto = new Cat1DTO();

                dto.setCat1(rs.getString("cat1"));
                dto.setCat1_name(rs.getString("cat1_name"));

                cat1List.add(dto);
            }


        }catch (Exception e ){
            e.printStackTrace();
            System.out.println("selectList 오류 발생");
        }

        return cat1List;
    }

    public int insertCat1(Cat1DTO dto){
        int result = 1;

        try {
            //쿼리 작성
            String query = "INSERT INTO t_cat1 ("
                    + " cat1, cat1_name)"
                    + " VALUES(?,?)";
            psmt = con.prepareStatement(query);
            psmt.setString(1,dto.getCat1());
            psmt.setString(2,dto.getCat1_name());

            result = psmt.executeUpdate();
        }catch (Exception e){
            System.out.println("insertCat1 메소드 오류 발생");
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

            System.out.println("대분류 - JDBC 자원 해제");
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
