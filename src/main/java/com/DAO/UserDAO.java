package com.DAO;
import com.DTO.UserDTO;
import com.bean.UserBean;
import com.common.DBConnPool;

import java.sql.DriverManager;
import java.util.Vector;

public class UserDAO extends DBConnPool {


    //회원 한사람에 대한 정보를 저장하는 메소드
    public void insertUser(UserBean bean) {
        try {
            //쿼리 준비
            String sql = "INSERT INTO user VALUES(?, ?, ?, ?, ?)";

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
    public Vector<UserBean> getAllUser() {
        Vector<UserBean> v = new Vector<>();
        try {
            //쿼리 준비
            String sql = "SELECT * FROM user";
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
    //회원가입 id 중복 확인
public int checkId(String id){//유저가 입력한 값을 매개변수로 한다
    String sql = "SELECT * FROM user where id=?";
//입력값이 테이블에 있는지 확인
    int idCheck = 0;
    try{
        psmt = con.prepareStatement(sql); //psmt에 위의 쿼리 저장 후 db에 연결 준비
        psmt.setString(1, id); //첫번째 ? 에 id 변수 셋팅
        System.out.println("DAO 내부  DB에 검색하는 id값(input에 쓴값) : " + id);

        rs = psmt.executeQuery(); //쿼리 실행 후 결과값 rs에 저장

        if(rs.next() || id.equals("")){
            idCheck=0; //이미 존재하는 경우 생성 불가
            System.out.println("Dao 내부_ id 중복");
        }else{
            idCheck = 1; //존재하지않는 경우 생성 가능
            System.out.println("DAO내부 _ id 중복 아님");
        }

    }catch (Exception e){
        e.printStackTrace();
    }finally {
        close();// 마지막으로 연결 다 끊기.
    }
    return idCheck; 


}

}


