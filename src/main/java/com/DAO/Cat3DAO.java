package com.DAO;

import com.common.JDBConnect;
import com.DTO.Cat3DTO;

import java.util.ArrayList;
import java.util.List;

public class Cat3DAO extends JDBConnect {
    public Cat3DAO() {  super();  }

    public List<Cat3DTO> selectList(String cat1, String cat2){
        //쿼리 결과를 담을 변수
        List<Cat3DTO> cat3List = new ArrayList<Cat3DTO>();

        //쿼리문 작성
        String query = "SELECT * FROM t_cat3"
                + " WHERE cat1 = '" + cat1 + "'"
                + " AND cat2 = '" + cat2 + "'"
                + " ORDER BY cat3 ASC";

        System.out.println(query);

        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()){
                //게시물 하나의 내용을 저장
                Cat3DTO dto = new Cat3DTO();

                dto.setCat3(rs.getString("cat3"));
                dto.setCat2(rs.getString("cat2"));
                dto.setCat1(rs.getString("cat1"));
                dto.setCat3_name(rs.getString("cat3_name"));

                cat3List.add(dto);
            }


        }catch (Exception e ){
            e.printStackTrace();
            System.out.println("selectList 오류 발생");
        }

        return cat3List;
    }

    public int insertCat3(Cat3DTO dto){
        int result = 1;

        try {
            //쿼리 작성
            String query = "INSERT INTO t_cat3 ("
                    + " cat3, cat2, cat1, cat3_name)"
                    + " VALUES(?,?,?,?)";
            psmt = con.prepareStatement(query);
            psmt.setString(1,dto.getCat3());
            psmt.setString(2,dto.getCat2());
            psmt.setString(3,dto.getCat1());
            psmt.setString(4,dto.getCat3_name());

            result = psmt.executeUpdate();
        }catch (Exception e){
            System.out.println("insertCat3 메소드 오류 발생");
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

            System.out.println("소분류 - JDBC 자원 해제");
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
