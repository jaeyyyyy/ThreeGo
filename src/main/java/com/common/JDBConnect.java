package com.common;

import javax.servlet.ServletContext;
import java.sql.*;

public class JDBConnect {
    public Connection con;  //데이터베이스 연결을 담당
    public Statement stmt; //파라미터 없는경우 쿼리문 실행할때 사용
    public PreparedStatement psmt; //파라미터가 있는 동적 쿼리문을 실행할때 사용
    public ResultSet rs; //쿼리 결과문을 담을 때 사용


    //기본 생성자
    public JDBConnect(){
        try {
            Class.forName("oracle.jdbc.OracleDriver");

            //DB 연결
            String url = "jdbc:oracle:thin:@localhost:1521:ORCL";
            String id = "test";
            String pwd = "bitc5600";

            con = DriverManager.getConnection(url, id, pwd);

            System.out.println("DB 연결 성공");

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    //2번째 생성자
    public JDBConnect(String driver, String url, String id, String pwd){
        try {
            //드라이버 로드
            Class.forName(driver);

            con = DriverManager.getConnection(url, id, pwd);

            System.out.println("DB 연결 성공");

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    //3번째 생성자
    public JDBConnect(ServletContext app){
        try {
            String driver = app.getInitParameter("OracleDriver");
            Class.forName(driver);

            String url = app.getInitParameter("OracleURL");
            String id = app.getInitParameter("OracleId");
            String pwd = app.getInitParameter("OraclePwd");

            con = DriverManager.getConnection(url, id, pwd);
            System.out.println("DB 연결 성공 3");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //연결 해제
    public void close(){
        try {
            if(rs !=null) rs.close();
            if(stmt !=null) stmt.close();
            if(psmt != null) psmt.close();
            if(con != null) con.close();

            System.out.println("JDBC 자원 해제");
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
