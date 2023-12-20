package com.DAO;
import com.DTO.UserDTO;
import com.bean.UserBean;
import com.common.DBConnPool;

import java.sql.DriverManager;
import java.util.Vector;

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
                    + "u_id,u_pw1,u_pw2,u_name,u_email)"
                    + "VALUES( "
                    + "?,?,?,?,?)";
            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getU_id());
            psmt.setString(2, dto.getU_pw1());
            psmt.setString(3, dto.getU_pw2());
            psmt.setString(4, dto.getU_name());
            psmt.setString(5, dto.getU_email());
            result = psmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("join 메소드 오류 발생");
            e.printStackTrace();
        }
        return result;
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


    }




