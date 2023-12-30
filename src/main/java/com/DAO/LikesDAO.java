package com.DAO;

import com.common.JDBConnect;

import java.util.Map;

public class LikesDAO extends JDBConnect {

    public LikesDAO() {
        super();
    }

    public int insertLikes(Map<String, String> map) {
        int result = 0;

        String query = "INSERT INTO likes (b_id, u_id) VALUES (?, ?)";

        try{
            psmt = con.prepareStatement(query);
            psmt.setString(1, map.get("b_id"));
            psmt.setString(2, map.get("u_id"));
            result = psmt.executeUpdate();
        }catch (Exception e){
            System.out.println("insertLikes 오류 발생");
            e.printStackTrace();
        }
        return result;
    }

    public int deleteLikes(Map<String, String> map) {
        int result = 0;

        String query = "DELETE FROM likes WHERE b_id = ? AND u_id = ?";

        try{
            psmt = con.prepareStatement(query);
            psmt.setString(1, map.get("b_id"));
            psmt.setString(2, map.get("u_id"));
            result = psmt.executeUpdate();
        }catch (Exception e){
            System.out.println("deleteLikes 오류 발생");
            e.printStackTrace();
        }
        return result;
    }

    public boolean checkLikes(Map<String, String> map) {
        boolean check = false;

        String query = "SELECT count(*) FROM likes WHERE b_id = ? AND u_id = ?";

        try{
            psmt = con.prepareStatement(query);
            psmt.setString(1, map.get("b_id"));
            psmt.setString(2, map.get("u_id"));
            rs = psmt.executeQuery();
            rs.next();
            if(rs.getInt(1) == 1) check = true;
        }catch (Exception e){
            System.out.println("checkLikes 오류 발생");
            e.printStackTrace();
        }
        return check;
    }

    public int countLikes(String b_id) {
        int count = 0;

        String query = "SELECT count(*) FROM likes WHERE b_id = ?";

        try{
            psmt = con.prepareStatement(query);
            psmt.setString(1, b_id);
            rs = psmt.executeQuery();
            rs.next();
            count = rs.getInt(1);
        }catch (Exception e){
            System.out.println("countLikes 오류 발생");
            e.printStackTrace();
        }

        return count;
    }
}
