package com.controller;

import com.DAO.UserDAO;
import com.DTO.UserDTO;
import com.util.MailSMTP;
import com.util.TempPassword;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/sendmail.do")
public class SendMailController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletContext application = req.getServletContext();

        String u_id = req.getParameter("u_id");

        UserDAO dao = UserDAO.getInstance();
        UserDTO findUser = dao.findUser(u_id);

        String u_email = findUser.getU_email();

        // map에 이메일 발송을 위한 정보 저장
        Map<String, String> emailInfo = new HashMap<>();
        emailInfo.put("from", "t3reego@gamil.com");
        emailInfo.put("to", u_email);
        emailInfo.put("subject", "[threeGo] 임시 비밀번호 발급 안내입니다.");
        emailInfo.put("format", "text/html;charset=UTF-8");

        // 메일 본문에 작성할 내용을 html파일에서 읽어와 저장할 문자열
        String htmlContent = "";

        try{
            String templatePath = application.getRealPath("/proj/views/common/mailFrom.html");
            BufferedReader br = new BufferedReader(new FileReader(templatePath));

            String oneLine;
            while ((oneLine = br.readLine()) != null){
                htmlContent += oneLine + "\n";
            }
            br.close();
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("메일 양식 오류 발생");
        }

        String userName = findUser.getU_name() + "(" + findUser.getU_id() + ")";
        // 임시 비밀번호 생성 후 유저의 비밀번호를 임시 비밀번호로 변경
        String tempPw = TempPassword.makeRandomPw(8);
        findUser.setU_pw(tempPw);
        int updateResult = dao.updateUserInfo(findUser);

        if(updateResult > 0){
            // html파일의 내용을 pw를 찾는 유저의 정보에 맞춰 replace
            htmlContent = htmlContent.replace("__username__", userName);
            htmlContent = htmlContent.replace("__temp-pw__", tempPw);

            emailInfo.put("content", htmlContent);

//        StringBuilder sb = new StringBuilder(email);
//        int idx_emailId_last = email.indexOf("@");


            try{
                MailSMTP smtpServer = new MailSMTP();
                smtpServer.emailSending(emailInfo);
                req.setAttribute("u_email",u_email);

                req.getRequestDispatcher("/proj/views/login/FindPwResult.jsp").forward(req,resp);
            }catch (Exception e){
                e.printStackTrace();
                System.out.println("메일 발송 오류 발생");
            }
        }else {
            System.out.println("임시비밀번호 업데이트 오류 발생");
        }
    }
}
