package com.controller;


import com.DAO.UserDAO;
import com.bean.UserBean;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/JoinController.do")
public class JoinController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        reqPro(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        reqPro(req, resp);
    }

    protected void reqPro(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    //한글 처리
    req.setCharacterEncoding("UTF-8");


        // view Page에서 보내온 테이터 받기
    String id = req.getParameter("id");
    String pw1 = req.getParameter("pw1");
    String pw2 = req.getParameter("pw2");
    String name = req.getParameter("name");
    String email = req.getParameter("email");

        //UserBean bean = new UserBean();
//    bean.setId(req.getParameter("id"));
//
//    String pw1 = req.getParameter("pw1");
//    String pw2 = req.getParameter("pw2");
//
//    bean.setPw1(pw1);
//    bean.setPw2(pw2);
//
//    bean.setName(req.getParameter("name"));
//    bean.setEmail(req.getParameter("email"));


//패스 1이랑 2는 같은지 확인하나봄
        if(pw1.equals(pw2)){
            UserDAO dao = new UserDAO();
//            dao.insertUser(bean);

            RequestDispatcher dis = req.getRequestDispatcher("/U_ListController.do");
            dis.forward(req, resp);
        }else{
            req.setAttribute("msg", "패스워드가 일치하지않습니다.");
            RequestDispatcher dis = req.getRequestDispatcher("join_fail.jsp");
            dis.forward(req, resp);
        }
    }


}
