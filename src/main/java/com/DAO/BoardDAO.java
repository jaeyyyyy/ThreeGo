package com.DAO;

import com.common.DBConnPool;
import java.util.Map;
import com.DTO.BoardDTO;
import java.util.List;
import java.util.ArrayList;

public class BoardDAO extends DBConnPool {
    public BoardDAO(){
        super();
    }

    //게시물 개수 반환
    public int selectCount(Map<String,Object> map){
        int totalCount = 0;

        String query = "SELECT COUNT(*) FROM boardtable";
        if(map.get("searchWord")!= null){
            query += " WHERE "  + map.get("searchFiled") + " "
                    +" LIKE '%" + map.get("searchWord") + "%'";
        }
        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);
            rs.next();
            totalCount = rs.getInt(1);
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("selectCount 오류 발생");
        }

        return totalCount;
    }
    //게시물 목록 반환
    public List<BoardDTO> selectListPage(Map<String,Object>map){
        //쿼리 결과를 담을 변수
        List<BoardDTO> bbs = new ArrayList<BoardDTO>();

        //쿼리문 작성
        String query = "SELECT * FROM ("
                + " SELECT Tb.*, ROWNUM rNUM FROM ("
                + " SELECT * FROM boardtable";
        if(map.get("searchWord")!= null){
            query += " WHERE "  + map.get("searchFiled") + " "
                    +" LIKE '%" + map.get("searchWord") + "%'";
        }
        query += " ORDER BY b_id DESC"
                +" ) Tb"
                +" )"
                +" WHERE rNUM BETWEEN ? AND ? ";

        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, map.get("start").toString());
            psmt.setString(2, map.get("end").toString());
            rs = psmt.executeQuery();

            while (rs.next()){
                //게시물 하나의 내용을 저장
                BoardDTO dto = new BoardDTO();

                dto.setB_id(rs.getString("b_id"));
                dto.setU_id(rs.getString("u_id"));
                dto.setB_writer(rs.getString("b_writer"));
                dto.setB_title(rs.getString("b_title"));
                dto.setB_content(rs.getString("b_content"));
                dto.setB_postdate(rs.getDate("b_postdate"));
                dto.setB_ofile(rs.getString("b_ofile"));
                dto.setB_sfile(rs.getString("b_sfile"));
                dto.setPass(rs.getString("pass"));
                dto.setB_visitcount(rs.getInt("b_visitcount"));
                bbs.add(dto);
            }


        }catch (Exception e ){
            e.printStackTrace();
            System.out.println("selectListPage 오류 발생");
        }

        return bbs;
    }

    //게시글 작성
    public int insertWrite(BoardDTO dto){
        int result = 0;

        try {
            //쿼리 작성
            String query = "INSERT INTO boardtable ( "
                    + "b_id,u_id,b_writer,b_title,b_content,b_ofile,b_sfile,pass)"
                    + "VALUES( "
                    + "seq_board_num.nextval, ?,?,?,?,?,?,?)";
            psmt = con.prepareStatement(query);
            psmt.setString(1,dto.getU_id());
            psmt.setString(2,dto.getB_writer());
            psmt.setString(3,dto.getB_title());
            psmt.setString(4,dto.getB_content());
            psmt.setString(5,dto.getB_ofile());
            psmt.setString(6,dto.getB_sfile());
            psmt.setString(7,dto.getPass());
            result = psmt.executeUpdate();
        }catch (Exception e){
            System.out.println("insertWrite 메소드 오류 발생");
            e.printStackTrace();
        }
        return result;
    }


    //게시글 조회
    public BoardDTO selectView(String b_id){
        BoardDTO dto = new BoardDTO();

        //쿼리 작성
        String query = "SELECT * "
                + " FROM boardtable "
                + " WHERE b_id = ?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, b_id);
            rs = psmt.executeQuery();

            if(rs.next()){
                dto.setB_id(rs.getString("b_id"));
                dto.setU_id(rs.getString("u_id"));
                dto.setB_writer(rs.getString("b_writer"));
                dto.setB_title(rs.getString("b_title"));
                dto.setB_content(rs.getString("b_content"));
                dto.setB_postdate(rs.getDate("b_postdate"));
                dto.setB_ofile(rs.getString("b_ofile"));
                dto.setB_sfile(rs.getString("b_sfile"));
                dto.setPass(rs.getString("pass"));
                dto.setB_visitcount(rs.getInt("b_visitcount"));


            }
        }catch (Exception e){
            System.out.println("selectView 오류 발생");
            e.printStackTrace();
        }

        return dto;
    }

    //조회수 증가
    public void updateViewCount(String b_id){
        //쿼리문
        String query = "UPDATE boardtable SET "
                +"b_visitcount = b_visitcount +1"
                +" WHERE b_id =?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, b_id);
            rs = psmt.executeQuery();
        }catch (Exception e){
            System.out.println("updateViewCount 오류 발생");
            e.printStackTrace();
        }
    }

    // 입력한 비밀번호가 지정한 idx 게시물의 비밀번호와 일치하는 지 확인
    public boolean confirmPassword(String pass, String b_id) {
        boolean isCorr = true;

        try {
            String sql = "SELECT COUNT(*) FROM boardtable WHERE pass =? AND b_id =?";
            psmt = con.prepareStatement(sql);
            psmt.setString(1, pass);
            psmt.setString(2, b_id);
            rs = psmt.executeQuery();

            rs.next();
            if(rs.getInt(1) == 0) {
                isCorr = false;
            }

        } catch (Exception e) {
            isCorr = false;
            System.out.println("confirmPassword 오류 발생");
            e.printStackTrace();
        }

        return isCorr;
    }

    // true 이면 게시글 삭제
    public int deletePost(String b_id) {
        int result = 0;
        try {
            String query = "DELETE FROM boardtable WHERE b_id =?";
            psmt = con.prepareStatement(query);
            psmt.setString(1, b_id);
            result = psmt.executeUpdate();

        }catch (Exception e) {
            System.out.println("deletePost 오류 발생");
            e.printStackTrace();
        }

        return result;
    }

    // 게시글 수정
    public int updatePost(BoardDTO dto) {
        int result = 0;
        try {
            // 쿼리문 작성
            String query = " UPDATE boardtable "
                    + " SET b_title=?, b_name=?, b_content=?, b_ofile=?, b_sfile=? "
                    + " WHERE b_id=? AND pass=? ";
            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getB_title());
            psmt.setString(2, dto.getU_id());
            psmt.setString(3,dto.getB_content());
            psmt.setString(4, dto.getB_ofile());
            psmt.setString(5, dto.getB_sfile());
            psmt.setString(6, dto.getB_id());
            psmt.setString(7, dto.getPass());

            result = psmt.executeUpdate();

        } catch (Exception e) {
            System.out.println("updatePost 오류 발생");
            e.printStackTrace();
        }

        return result;
    }
}
