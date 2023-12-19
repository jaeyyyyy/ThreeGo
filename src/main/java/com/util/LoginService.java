package com.util;

import com.DAO.LoginDAO;
import com.DTO.UserDTO;
import com.common.DBConnPool;

import java.sql.Connection;

public class LoginService extends DBConnPool {
    public UserDTO getLoginUser(String id, String pw) {
        LoginDAO loginDAO = LoginDAO.getInstance();
        loginDAO.setConnection(this.setupConnection());  // JDBConnect에서 제공하는 연결을 사용합니다.
        UserDTO loginUser = loginDAO.setLoginUser(id, pw);

        return loginUser;
    }
}
