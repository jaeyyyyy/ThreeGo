package com.DAO;

import com.common.JDBConnect;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.DTO.UserDTO;

public class LoginDAO extends JDBConnect {
    private static LoginDAO loginDAO;

    public static LoginDAO getInstance() {
        if (loginDAO == null) {
            loginDAO = new LoginDAO();
        }
        return loginDAO;
    }

    public UserDTO setLoginUser(String id, String pw) {
        UserDTO loginUser = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;

        try {
            // 수정된 쿼리문
            psmt = con.prepareStatement("SELECT * FROM users WHERE U_ID=? AND U_PW=?");
            psmt.setString(1, id);
            psmt.setString(2, pw);

            rs = psmt.executeQuery();
            if (rs.next()) {
                loginUser = new UserDTO();
                loginUser.setU_id(rs.getString("u_id"));
                loginUser.setU_pw(rs.getString("u_pw"));
                loginUser.setU_name(rs.getString("u_name"));
                loginUser.setU_email(rs.getString("u_email"));
                loginUser.setU_ofile(rs.getString("u_ofile"));
                loginUser.setU_sfile(rs.getString("u_sfile"));
                loginUser.setU_about(rs.getString("u_about"));
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