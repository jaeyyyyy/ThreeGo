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
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("findUser 메서드 오류");
        }
        return userInfo;
    }

    public void modUser(UserDTO dto) {
        String u_id = dto.getU_id();
        String u_pw = dto.getU_pw();
        String u_name = dto.getU_name();
        String u_email = dto.getU_email();
        try {
            String query = "UPDATE users SET "
                    + " u_pw = ?, u_name = ?, u_email=?"
                    + " WHERE u_id=?";
            System.out.println(query);
            psmt = con.prepareStatement(query);
            psmt.setString(1,u_pw);
            psmt.setString(2,u_name);
            psmt.setString(3,u_email);
            psmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("modUser 메서드 오류");
        }
    }

    public void delUser(String u_id) {
        try {
            String query = "DELETE FROM user"
                    + "WHERE u_id=?";
            psmt = con.prepareStatement(query);
            psmt.setString(1,u_id);
        } catch (Exception e) {

        }
    }

    public boolean checkDuplicateId(String u_id) {
        try {
            // 쿼리 작성
            String query = "SELECT COUNT(*) FROM users WHERE u_id = ?";
            psmt = con.prepareStatement(query);
            psmt.setString(1, u_id);
            rs = psmt.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0; // count가 0보다 크면 중복된 아이디가 존재
            }

            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        }


        // 마이페이지 용
    public int updateUserInfo(UserDTO dto) {
        try {
            // 쿼리 작성
            String query = "UPDATE users SET u_name=?, u_pw=?, u_email=? WHERE u_id=?";
            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getU_name());
            psmt.setString(2, dto.getU_pw());
            psmt.setString(3, dto.getU_email());
            psmt.setString(4, dto.getU_id());
            result = psmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("updateUserInfo 메소드 오류 발생");
            e.printStackTrace();
        }
        return result;
    }


    }




