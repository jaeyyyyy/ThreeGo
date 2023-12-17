package com.DAO;

import com.common.JDBConnect;
import com.DTO.Cat2DTO;

import java.util.ArrayList;
import java.util.List;

public class Cat2DAO extends JDBConnect {
    public Cat2DAO() {  super();  }

    public List<Cat2DTO> selectList(String cat1){
        //쿼리 결과를 담을 변수
        List<Cat2DTO> cat2List = new ArrayList<Cat2DTO>();

        //쿼리문 작성
        String query = "SELECT * FROM t_cat2"
                + " WHERE cat1 = '" + cat1 +"'"
                + " ORDER BY cat2 ASC";

        System.out.println(query);

        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()){
                //게시물 하나의 내용을 저장
                Cat2DTO dto = new Cat2DTO();

                dto.setCat2(rs.getString("cat2"));
                dto.setCat1(rs.getString("cat1"));
                dto.setCat2_name(rs.getString("cat2_name"));

                cat2List.add(dto);
            }


        }catch (Exception e ){
            e.printStackTrace();
            System.out.println("selectList 오류 발생");
        }

        return cat2List;
    }

    public int insertCat2(Cat2DTO dto){
        int result = 1;

        try {
            //쿼리 작성
            String query = "INSERT INTO t_cat2 ("
                    + " cat2, cat1, cat2_name)"
                    + " VALUES(?,?,?)";
            psmt = con.prepareStatement(query);
            psmt.setString(1,dto.getCat2());
            psmt.setString(2,dto.getCat1());
            psmt.setString(3,dto.getCat2_name());

            result = psmt.executeUpdate();
        }catch (Exception e){
            System.out.println("insertCat2 메소드 오류 발생");
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

            System.out.println("중분류 - JDBC 자원 해제");
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
