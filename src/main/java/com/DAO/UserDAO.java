package com.DAO;
import com.DTO.UserDTO;
import com.bean.UserBean;
import com.common.DBConnPool;

import java.sql.DriverManager;
import java.util.Vector;

public class UserDAO extends DBConnPool {


    //회원 한사람에 대한 정보를 저장하는 메소드
    public void insertMember(UserBean bean) {
        try {
            //쿼리 준비
            String sql = "INSERT INTO member VALUES(?, ?, ?, ?, ?)";

            //쿼리 실행창 객체 선언
            psmt = con.prepareStatement(sql);

            //?에 하나씩 대입
            psmt.setString(1, bean.getId());
            psmt.setString(2, bean.getPw1());
            psmt.setString(3, bean.getPw2());
            psmt.setString(4, bean.getName());
            psmt.setString(5, bean.getEmail());

            psmt.executeQuery();
            con.close();
        } catch (Exception e) {
            System.out.println("회원 저장실패");
            e.printStackTrace();
        }
    }

    //회원의 정보 리턴 Vector에 넣어준다. Vector는 ArrayList와 비슷.
    public Vector<UserBean> getAllMember() {
        Vector<UserBean> v = new Vector<>();
        try {
            //쿼리 준비
            String sql = "SELECT * FROM member";
            //쿼리실행창 객체 선언
            psmt = con.prepareStatement(sql);
            //쿼리실행
            rs = psmt.executeQuery();
            //반복문 돌면서 회원 정보 저장
            while (rs.next()) {
                UserBean bean = new UserBean();
                bean.setId(rs.getString(1));
                bean.setPw1(rs.getString(2));
                bean.setPw2(rs.getString(3));
                bean.setName(rs.getString(4));
                bean.setEmail(rs.getString(5));
                //벡터에 빈클래스 저장
                v.add(bean);

            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("정보 리턴 실패 ");
        }

        return v;


    }
}
