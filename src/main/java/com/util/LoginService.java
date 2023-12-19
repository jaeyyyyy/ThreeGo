package com.util;

import com.DAO.LoginDAO;
import com.DTO.UserDTO;
import com.common.DBConnPool;

import java.sql.Connection;

public class LoginService extends DBConnPool {
    public UserDTO getLoginUser(String id, String pw) {
        LoginDAO loginDAO = LoginDAO.getInstance();
        UserDTO loginUser = loginDAO.setLoginUser(id, pw);

        return loginUser;
    }
}
