package com.data;

import com.common.JDBConnect;

public class Cat3DAO extends JDBConnect {
    public Cat3DAO() {  super();  }

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
