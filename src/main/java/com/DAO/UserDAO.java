package com.DAO;
import com.DTO.UserDTO;
import com.common.DBConnPool;

public class UserDAO extends DBConnPool {

    public UserDAO(){
        super();
    }

    //받아온 파라미터로 아이디/패스워드 일치하는 회원정보 반환
    public UserDTO getUserDTO(String uid, String upass){

        UserDTO dto = new UserDTO(); //회원정보 DTO 객체 생성
        String sql = "SELECT * FROM user WHERE u_id =? AND u_pw =?";

        try {
            //쿼리 실행
            psmt = con.prepareStatement(sql);
            psmt.setString(1,uid);
            psmt.setString(2,upass);
            rs = psmt.executeQuery(); //쿼리문 실행

            if(rs.next()){
                //쿼리 결과를 DTO 저장한 뒤 반환
                dto.setId(rs.getString("id"));
                dto.setPass(rs.getString("pass"));
                dto.setName(rs.getString("name"));
                dto.setEmail(rs.getString("email"));
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        return dto;
    }


}
