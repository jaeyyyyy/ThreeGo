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

    //검색 조건에 맞는 게시물 개수 반환
    public int selectCount(Map<String,Object> map){
        int totalCount = 0;
        String query = "SELECT COUNT(*) FROM board";
        if(map.get("searchWord")!= null){
            query += " WHERE "  + map.get("searchFiled") + " "
                    +" LIKE '%" + map.get("searchWord") + "%'";
        }
        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);
            rs.next();
            totalCount = rs.getInt(1);
        }catch (Exception e ){
            e.printStackTrace();
            System.out.println("selectCount 오류 발생");
        }

        return totalCount;
    }

    public List<BoardDTO> selectList(Map<String,Object>map){
        //쿼리 결과를 담을 변수
        List<BoardDTO> bbs = new ArrayList<BoardDTO>();

        //쿼리문 작성
        String query = "SELECT * FROM board";
        if(map.get("searchWord")!= null){
            query += " WHERE "  + map.get("searchFiled") + " "
                    +" LIKE '%" + map.get("searchWord") + "%'";
        }
        query += " ORDER BY num DESC";

        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()){
                //게시물 하나의 내용을 저장
                BoardDTO dto = new BoardDTO();

                dto.setNum(rs.getString("num"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setId(rs.getString("id"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setVisitcount(rs.getString("visitcount"));

                bbs.add(dto);
            }


        }catch (Exception e ){
            e.printStackTrace();
            System.out.println("selectList 오류 발생");
        }

        return bbs;
    }

    //페이징 처리한 게시물 리스트
    public List<BoardDTO> selectListPage(Map<String,Object>map){
        //쿼리 결과를 담을 변수
        List<BoardDTO> bbs = new ArrayList<BoardDTO>();

        //쿼리문 작성
        String query = "SELECT * FROM ("
                + " SELECT Tb.*, ROWNUM rNUM FROM ("
                + " SELECT * FROM board";
        if(map.get("searchWord")!= null){
            query += " WHERE "  + map.get("searchFiled") + " "
                    +" LIKE '%" + map.get("searchWord") + "%'";
        }
        query += " ORDER BY num DESC"
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

                dto.setNum(rs.getString("num"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setId(rs.getString("id"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setVisitcount(rs.getString("visitcount"));

                bbs.add(dto);
            }


        }catch (Exception e ){
            e.printStackTrace();
            System.out.println("selectList 오류 발생");
        }

        return bbs;
    }

    //게시글 작성
    public int insertWrite(BoardDTO dto){
        int result =0;

        try {
            //쿼리 작성
            String query = "INSERT INTO board ( "
                    + "num, title,content, id,visitcount)"
                    + "VALUES( "
                    + "seq_board_num.nextval, ?,?,?,0)";
            psmt = con.prepareStatement(query);
            psmt.setString(1,dto.getTitle());
            psmt.setString(2,dto.getContent());
            psmt.setString(3,dto.getId());

            result = psmt.executeUpdate();
        }catch (Exception e){
            System.out.println("insertWrite 메소드 오류 발생");
            e.printStackTrace();
        }


        return result;
    }

    //게시글 작성
    public BoardDTO selectView(String num){
        BoardDTO dto = new BoardDTO();

        //쿼리 작성
        String query = "SELECT B.*, M.name "
                + "FROM board B"
                + " INNER JOIN member M"
                + " ON B.id = M.id"
                + " WHERE num = ?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, num);
            rs = psmt.executeQuery();

            if(rs.next()){
                dto.setNum(rs.getString("num"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setId(rs.getString("id"));
                dto.setName(rs.getString("name"));
                dto.setVisitcount(rs.getString("visitcount"));
                dto.setPostdate(rs.getDate("postdate"));
            }
        }catch (Exception e){
            System.out.println("selectView 오류 발생");
            e.printStackTrace();
        }

        return dto;
    }

    //조회수 증가
    public void updateViewCount(String num){
        //쿼리문
        String query = "UPDATE board SET "
                +"visitcount = visitcount +1"
                +" WHERE num =?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, num);
            rs = psmt.executeQuery();
        }catch (Exception e){
            System.out.println("updateViewCount 오류 발생");
            e.printStackTrace();
        }
    }

    //게시글 수정
    public int updateEdit(BoardDTO dto){
        int result = 0;

        String query = "UPDATE board SET "
                +"title = ? , content = ?"
                +" WHERE num =?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getTitle());
            psmt.setString(2, dto.getContent());
            psmt.setString(3, dto.getNum());
            result = psmt.executeUpdate();
        }catch (Exception e){
            System.out.println("updateEdit 오류 발생");
            e.printStackTrace();
        }

        return result;
    }


    //게시글 삭제
    public int deletePost(BoardDTO dto){
        int result = 0;

        String query = "DELETE FROM board WHERE num = ?";

        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getNum());
            result = psmt.executeUpdate();
        }catch (Exception e){
            System.out.println("deletePost 오류 발생");
            e.printStackTrace();
        }

        return result;
    }
}
