package com.data;

import com.common.JDBConnect;

public class Cat1DAO extends JDBConnect {
    public Cat1DAO() {  super();  }

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
