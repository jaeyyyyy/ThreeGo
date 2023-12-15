package com.common;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBConnPool {
    public Connection con;  //데이터베이스 연결을 담당
    public Statement stmt; //파라미터 없는경우 쿼리문 실행할때 사용
    public PreparedStatement psmt; //파라미터가 있는 동적 쿼리문을 실행할때 사용
    public ResultSet rs; //쿼리 결과문을 담을 때 사용

    //기본 생성자
    public DBConnPool(){
        try {
            //커넥션 풀 얻기
            Context initCtx = new InitialContext();
            //JNDI에서 이름과 객체를 연결해주는 Context
            //JNDI 이용하기 위해 만들어 주는 객체

            Context ctx = (Context) initCtx.lookup("java:comp/env");
            //"java:comp/env >> 루트 디렉토리

            DataSource source = (DataSource)ctx.lookup("dbcp_myoracle");
            //루트 디렉토리에 위치한 dbcp_myoracle 자원을 가져옴

            //커넥션풀에서 연결 얻어오기
            con = source.getConnection();
            System.out.println("DB 커넥션 풀 연결 성공");

        }catch (Exception e){
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

            System.out.println("DB 커넥션풀 자원 반납");
        }catch (Exception e){
            e.printStackTrace();
        }
    }

}
