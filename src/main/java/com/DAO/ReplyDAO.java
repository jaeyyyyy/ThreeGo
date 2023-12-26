package com.DAO;

import com.DTO.ReplyDTO;
import com.common.JDBConnect;

import java.util.ArrayList;
import java.util.List;

public class ReplyDAO extends JDBConnect {

    public ReplyDAO() {  super();  }

    //게시글의 총 댓글 수
    public int totalCount(String b_id){
        int totalCnt = 0;

        String query = "SELECT COUNT(*) FROM REPLY r WHERE b_id = ?";

        try{
            psmt = con.prepareStatement(query);
            psmt.setString(1, b_id);
            rs = psmt.executeQuery();
            rs.next();
            totalCnt = rs.getInt(1);
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("totalCount 오류 발생");
        }

        return totalCnt;
    }

    // 현재 댓글(대댓글reply 제외) 개수
    public int commentCount(String b_id){
        int commentCnt = 0;

        String query = "SELECT COUNT(re_ref) FROM reply r WHERE b_id = ? AND re_level = 0";

        try{
            psmt = con.prepareStatement(query);
            psmt.setString(1,b_id);
            rs = psmt.executeQuery();
            rs.next();
            commentCnt = rs.getInt(1);
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("commentCount 오류 발생");
        }

        return commentCnt;
    }

    // 자식 댓글의 개수를 업데이트하고 그 값을 반환
    public void addChild(int re_parent){
        int result = 0;
        int grand_parent = 0;

        String selectQuery = "SELECT re_parent FROM reply WHERE re_num = ?";

        try{
            psmt = con.prepareStatement(selectQuery);
            psmt.setInt(1, re_parent);
            rs = psmt.executeQuery();
            rs.next();
            grand_parent = rs.getInt(1);
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("addChild-select 오류 발생");
        }


        String updateQuery = "UPDATE reply SET re_child = re_child+1 WHERE re_num = ?";

        try{
            psmt = con.prepareStatement(updateQuery);
            psmt.setInt(1, re_parent);
            result = psmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("addChild-update 오류 발생");
        }

        if(grand_parent > 0){
            addChild(grand_parent);
        }
    }

    public int showChild(int re_parent){
        int child = 0;
        String selectQuery = "SELECT re_child FROM reply WHERE re_num = ?";

        try{
            psmt = con.prepareStatement(selectQuery);
            psmt.setInt(1, re_parent);
            rs = psmt.executeQuery();
            rs.next();
            child = rs.getInt(1);
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("showChild 오류 발생");
        }

        return child;
    }



//    // 하위 레벨의 reply 최대값
//    public int maxReplyStep(String b_id, int re_ref, int re_level){
//        int replyCnt = 0;
//
//        String query = "SELECT MAX(re_step) FROM REPLY r WHERE b_id = ? AND re_ref = ? AND re_level = ?";
//
//        try{
//            psmt = con.prepareStatement(query);
//            psmt.setString(1,b_id);
//            psmt.setInt(2,re_ref);
//            psmt.setInt(3,re_level);
//            rs = psmt.executeQuery();
//            rs.next();
//            replyCnt = rs.getInt(1) + 1;
//        }catch (Exception e){
//            e.printStackTrace();
//            System.out.println("maxReplyStep 오류 발생");
//        }
//
//        return replyCnt;
//    }

//    public int stepCount(String b_id, int re_ref, int re_step, int re_level){
//        int step = 0;
//
//        String subquery = "SELECT re_num, re_step, LEAD(re_step,1,?)"
//                + " OVER(ORDER BY re_ref ASC, re_step ASC) as next_step  FROM reply r"
//                + " WHERE B_ID = ? AND RE_REF = ? AND RE_LEVEL = ?";
//
//        String query = "SELECT sub.next_step FROM (" + subquery + ") sub WHERE re_step = ?";
//
////        int replyCount = maxReplyStep(b_id, re_ref, re_level);
//
//        try{
//            psmt = con.prepareStatement(query);
//            psmt.setInt(1, (re_step + 1));
//            psmt.setString(2,b_id);
//            psmt.setInt(3,re_ref);
//            psmt.setInt(4,(re_level));
//            psmt.setInt(5,re_step);
//            rs = psmt.executeQuery();
//            rs.next();
//            step = rs.getInt(1);
//        }catch (Exception e){
//            e.printStackTrace();
//            System.out.println("stepcount 오류 발생");
//        }
//
//        System.out.println(step);
//
//        return step;
//    }

    public int insertComment(String b_id, String u_id, String re_content, int re_ref){
        int result = 0;

        String query = "INSERT INTO reply (b_id, u_id, re_content, re_ref)"
                    + " VALUES (?, ?, ?, ?)";
        try{
            psmt = con.prepareStatement(query);
            psmt.setString(1, b_id);
            psmt.setString(2, u_id);
            psmt.setString(3, re_content);
            psmt.setInt(4, re_ref);
            result = psmt.executeUpdate();

        }catch (Exception e){
            e.printStackTrace();
            System.out.println("insertComment 오류 발생");
        }
        return result;
    }

    public int insertReply(String b_id, String u_id, String content, int re_ref, int re_order, int re_level, int re_parent){
        int result = 0;

        if(re_level > 1){
            String updateQuery = "UPDATE reply SET re_order = re_order+1"
                    + " WHERE b_id = ? AND re_ref = ? AND re_order >= ?";

            try {
                psmt = con.prepareStatement(updateQuery);
                psmt.setString(1, b_id);
                psmt.setInt(2, re_ref);
                psmt.setInt(3, re_order);
                rs = psmt.executeQuery();
            }catch (Exception e){
                e.printStackTrace();
                System.out.println("insertReply - update 오류 발생");
            }
        }

        String insertQuery = "INSERT INTO reply (b_id, u_id, re_content, re_ref, re_order, re_level, re_parent)"
                    + " VALUES (?, ?, ?, ?, ?, ?, ?)";

        try{
            psmt = con.prepareStatement(insertQuery);
            psmt.setString(1, b_id);
            psmt.setString(2, u_id);
            psmt.setString(3, content);
            psmt.setInt(4, re_ref);
            psmt.setInt(5, re_order);
            psmt.setInt(6, re_level);
            psmt.setInt(7, re_parent);
            result = psmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("insertReply 오류 발생");
        }

        return result;
    }

    public List<ReplyDTO> selectReplyList(String b_id){
        List<ReplyDTO> replyList = new ArrayList<ReplyDTO>();

        String subquery = "SELECT * FROM reply WHERE b_id = ?"
                    + " ORDER BY re_ref ASC, re_order ASC";

        String query = "SELECT b_id, re_num, r.u_id, u.u_name, u.u_sfile, re_content,"
                    + " re_regdate, re_modifydate, re_del, re_ref, re_order, re_level, re_parent, re_child"
                    + " FROM (" + subquery + ") r"
                    + " INNER JOIN USERS u"
                    + " ON r.u_id = u.u_id";

        System.out.println(query);

        try{
            psmt = con.prepareStatement(query);
            psmt.setString(1, b_id);
            rs = psmt.executeQuery();

            while (rs.next()){
                ReplyDTO dto = new ReplyDTO();

                dto.setB_id(rs.getString("b_id"));
                dto.setRe_num(rs.getString("re_num"));
                dto.setU_id(rs.getString("u_id"));
                dto.setRe_content(rs.getString("re_content"));
                dto.setRe_regdate(rs.getDate("re_regdate"));
                dto.setRe_modifydate(rs.getDate("re_modifydate"));
                dto.setRe_del(rs.getString("re_del"));
                dto.setRe_ref(rs.getInt("re_ref"));
                dto.setRe_order(rs.getInt("re_order"));
                dto.setRe_level(rs.getInt("re_level"));
                dto.setRe_parent(rs.getInt("re_parent"));
                dto.setRe_child(rs.getInt("re_child"));

                dto.setU_name(rs.getString("u_name"));
                dto.setU_sfile(rs.getString("u_sfile"));
                replyList.add(dto);
            }
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("selectReplyList 오류 발생");
        }
        return replyList;
    }

    public int updateReply(ReplyDTO dto){
        int result = 0;

        String query = "UPDATE reply SET re_content = ?, re_modifydate = SYSDATE"
                    + " WHERE re_num = ?";

        try{
            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getRe_content());
            psmt.setString(2, dto.getRe_num());
            result = psmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("updateReply 오류 발생");
        }

        return result;
    }

    // db상에서 실제 삭제하는 것이 아니라 re_del 컬럼에 'Y'를 저장.
    // re_del이 'Y'인 댓글은 '삭제된 댓글입니다.' 메세지로 대체하여 출력.
    public int deleteReply(String re_num){
        int result = 0;

        String query = "UPDATE reply SET re_del = 'Y'"
                + " WHERE re_num = ?";

        try{
            psmt = con.prepareStatement(query);
            psmt.setString(1, re_num);
            result = psmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("deleteReply 오류 발생");
        }

        return result;
    }
}
