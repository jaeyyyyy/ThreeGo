package com.DAO;

import com.common.JDBConnect;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.DTO.UserDTO;

public class LoginDAO extends JDBConnect {
    private static LoginDAO loginDAO;

    public static LoginDAO getInstance(){
        if(loginDAO == null){
            loginDAO = new LoginDAO();
        }
        return loginDAO;
    }

    public UserDTO setLoginUser(String id, String pw) {
        UserDTO loginUser = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;

        try {
            psmt = con.prepareStatement("SELECT * FROM user WHERE id=? AND pw=?");
            psmt.setString(1, id);
            psmt.setString(2, pw);

            rs = psmt.executeQuery();
            if (rs.next()) {
                loginUser = new UserDTO();
                loginUser.setU_id(rs.getString("id"));
                loginUser.setU_pw1(rs.getString("pw"));
                loginUser.setU_name(rs.getString("name"));
                loginUser.setU_email(rs.getString("email"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (psmt != null) {
                    psmt.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return loginUser;
    }
}