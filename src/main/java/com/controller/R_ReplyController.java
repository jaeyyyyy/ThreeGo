package com.controller;

import com.DAO.ReplyDAO;
import com.DTO.ReplyDTO;
import com.util.JSFunction;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;

@WebServlet("/community/reply.do")
public class R_ReplyController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        ReplyDAO dao = new ReplyDAO();

        BufferedReader reader = req.getReader();
        String result = reader.readLine();
        JSONParser parser = new JSONParser();
        JSONObject data;

        try {
            data = (JSONObject) parser.parse(result);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

        String b_id = (String) data.get("b_id");
        String content = (String) data.get("content");
        content = content.replaceAll("\\r?\\n", "<br/>");

        // 바로 위 레벨의 댓글(= 상위 댓글, 부모 댓글/reply, comment 포함)의 레벨과 순서
        int prev_re_level = Integer.parseInt((String) data.get("re_level"));
        int prev_re_order = Integer.parseInt((String) data.get("re_order"));
        String prev_re_num = (String) data.get("re_num");

        // 상위 댓글 번호가 부모 댓글 번호
        // 상위 댓글과 같은 ref로 묶임
        // 작성하는 댓글의 레벨은 상위 댓글의 레벨 + 1
        int re_parent = Integer.parseInt(prev_re_num);
        int re_ref = Integer.parseInt((String) data.get("re_ref"));
        int re_level = prev_re_level + 1;
        // 대댓글(reply) 작성 떄 마다 부모 댓글부터 같은 ref의 최상위 댓글(0 level)까지 모두 자식 댓글의 수 +1
        dao.addChild(re_parent);
        // 현재 작성하는 댓글의 순서는 부모 댓글의 순서 + 부모 댓글의 자식댓글 수
        int re_order = prev_re_order + dao.showChild(re_parent);
        String u_id = (String) session.getAttribute("u_id");

        reader.close();

        int totalCount = dao.totalCount(b_id);


        int insertReply = dao.insertReply(b_id, u_id, content, re_ref, re_order, re_level, re_parent);

        if(insertReply > 0){
            System.out.println("댓글이 정상적으로 등록되었습니다.");

            JSONObject json = new JSONObject();
            JSONArray replyArr = new JSONArray();

            List<ReplyDTO> replyList = dao.selectReplyList(b_id);

            for(ReplyDTO dto : replyList){
                JSONObject dtoObj = new JSONObject();
                dtoObj.put("b_id", dto.getB_id());
                dtoObj.put("re_num", dto.getRe_num());
                dtoObj.put("u_id", dto.getU_id());
                dtoObj.put("re_content", dto.getRe_content());
                dtoObj.put("re_regdate", dto.getRe_regdate());
                dtoObj.put("re_modifydate", dto.getRe_modifydate());
                dtoObj.put("re_del", dto.getRe_del());
                dtoObj.put("re_ref", dto.getRe_ref());
                dtoObj.put("re_order", dto.getRe_order());
                dtoObj.put("re_level", dto.getRe_level());
                dtoObj.put("re_parent", dto.getRe_parent());
                dtoObj.put("re_child", dto.getRe_child());
                dtoObj.put("u_name", dto.getU_name());
                dtoObj.put("u_sfile", dto.getU_sfile());
                replyArr.add(dtoObj);
            }

            json.put("totalCount",totalCount);
            json.put("replyList", replyArr);

            System.out.println(json);

            resp.setContentType("application/x-json; charset=utf-8");
            resp.getWriter().print(json.toJSONString());
        }else {
            JSFunction.alertBack(resp, "댓글 등록에 실패하였습니다.");
        }
    }
}
