package com.DAO;
import com.DTO.UserDTO;
import com.common.DBConnPool;

import java.sql.ResultSet;


public class UserDAO extends DBConnPool {

    private static UserDAO dao;
    private int result;

    public UserDAO() {
        super();
    }

    public static synchronized UserDAO getInstance() {
        if (dao == null) {
            dao = new UserDAO();
        }
        return dao;
    }

    // 가입하기
    public int join(UserDTO dto) {
        try {
            //쿼리 작성
            String query = "INSERT INTO users ( "
                    + "u_id,u_pw,u_name,u_email)"
                    + "VALUES( "
                    + "?,?,?,?)";
            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getU_id());
            psmt.setString(2, dto.getU_pw());
            psmt.setString(3, dto.getU_name());
            psmt.setString(4, dto.getU_email());
            result = psmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("join 메소드 오류 발생");
            e.printStackTrace();
        }
        return result;
    }

    // 아이디가 일치하는 유저 찾기
    public UserDTO findUser(String u_id) {
        UserDTO userInfo = new UserDTO();
        try {
            String query = "SELECT * FROM users WHERE u_id = ?";
            psmt = con.prepareStatement(query);
            psmt.setString(1,u_id);
            ResultSet rs = psmt.executeQuery();
            if(rs.next()) {
                userInfo.setU_id(rs.getString("u_id"));
                userInfo.setU_pw(rs.getString("u_pw"));
                userInfo.setU_name(rs.getString("u_name"));
                userInfo.setU_email(rs.getString("u_email"));
                userInfo.setU_ofile(rs.getString("u_ofile"));
                userInfo.setU_sfile(rs.getString("u_sfile"));
                userInfo.setU_about(rs.getString("u_about"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("findUser 메서드 오류");
        }
        return userInfo;
    }

    // 이메일 가입여부 확인 하기
    public boolean checkDuplicateEmail(String u_email) {
        int count = 0;
        try {
            // 쿼리 작성
            String query = "SELECT COUNT(*) FROM users WHERE u_email = ?";
            psmt = con.prepareStatement(query);
            psmt.setString(1, u_email);
            rs = psmt.executeQuery();
            rs.next();
            count = rs.getInt(1);
            if(count > 0) return true;

            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // 이메일이 일치하는 유저 찾기
    public String findId(String u_email) {
        String find_id = "";
        try {
            String query = "SELECT * FROM users WHERE u_email = ?";
            psmt = con.prepareStatement(query);
            psmt.setString(1,u_email);
            rs = psmt.executeQuery();
            rs.next();
            find_id = rs.getString(1);

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("findId 메서드 오류");
        }
        return find_id;
    }

    // 유저 삭제하기
    public int delUser(UserDTO dto) {
        int result = 0;
        try {
            String query = "DELETE FROM users WHERE u_id=?";
            psmt = con.prepareStatement(query);
            psmt.setString(1,dto.getU_id());
            result = psmt.executeUpdate();
            System.out.println("탈퇴완료");
        } catch (Exception e) {
            System.out.println("delUser 함수 오류");
            e.printStackTrace();
        }
        return result;
    }

    // 아이디 중복 확인 하기
    public boolean checkDuplicateId(String u_id) {
        int count = 0;
        try {
            // 쿼리 작성
            String query = "SELECT COUNT(*) FROM users WHERE u_id = ?";
            psmt = con.prepareStatement(query);
            psmt.setString(1, u_id);
            rs = psmt.executeQuery();
            rs.next();
            count = rs.getInt(1);
            if(count > 0) return true;

            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


        // 마이페이지에서 내 정보 수정하기
    public int updateUserInfo(UserDTO dto) {
        try {
            // 쿼리 작성
            String query = "UPDATE users SET u_name=?, u_pw=?, u_email=?, u_ofile=?, u_sfile=?, u_about=? WHERE u_id=?";
            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getU_name());
            psmt.setString(2, dto.getU_pw());
            psmt.setString(3, dto.getU_email());
            psmt.setString(4,dto.getU_ofile());
            psmt.setString(5, dto.getU_sfile());
            psmt.setString(6, dto.getU_about());
            psmt.setString(7, dto.getU_id());
            result = psmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("updateUserInfo 메소드 오류 발생");
            e.printStackTrace();
        }
        return result;
    }
}




