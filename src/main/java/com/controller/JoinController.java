package com.controller;


import com.DAO.UserDAO;
import com.bean.UserBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Proc.do")
public class JoinController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        reqPro(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        reqPro(req, resp);
    }

    protected void reqPro(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    //한글 처리
    req.setCharacterEncoding("UTF-8");

    UserBean bean = new UserBean();

    bean.setId(req.getParameter("id"));

    String pw1 = req.getParameter("pw1");
    String pw2 = req.getParameter("pw2");

    bean.setPw1(pw1);
    bean.setPw2(pw2);

    bean.setName(req.getParameter("name"));
    bean.setEmail(req.getParameter("email"));


//패스 1이랑 2는 같은지 확인하나봄
        if(pw1.equals(pw2)){
            UserDAO dao = new UserDAO();
            dao.insertMember(bean);
 
        }
    }
}
