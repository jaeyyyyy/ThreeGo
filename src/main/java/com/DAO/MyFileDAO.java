package com.DAO;

import com.DTO.MyFileDTO;
import com.common.DBConnPool;

import java.util.ArrayList;
import java.util.List;

public class MyFileDAO extends DBConnPool {
    // CRUD
    // 게시글 작성
    public int insertFile(MyFileDTO dto) {
        int applyResult = 0;
        try {
            String query = "INSERT INTO myfile ("
                    + "idx, title, cate, ofile, sfile)"
                    + "VALUES (seq_board_num.nextval, ?,?,?,?)";
            psmt = con.prepareStatement(query);
            psmt.setString(1,dto.getTitle());
            psmt.setString(2,dto.getCate());
            psmt.setString(3,dto.getOfile());
            psmt.setString(4,dto.getSfile());

            applyResult = psmt.executeUpdate();

        } catch(Exception e) {
            System.out.println("insert 파일 오류 발생");
            e.printStackTrace();
        }
        return applyResult;
    }

    // 게시글 리스트 불러오기


    // 쿼리문
    public List<MyFileDTO> myFileList() {
        List<MyFileDTO> fileList = new ArrayList<>();
        String query = "SELECT * FROM myfile ORDER BY idx DESC";
        try {
            psmt = con.prepareStatement(query);
            rs = psmt.executeQuery();

            while(rs.next()) {
                MyFileDTO dto = new MyFileDTO();
                dto.setIdx(rs.getString("idx"));
                dto.setTitle(rs.getString("title"));
                dto.setCate(rs.getString("cate"));
                dto.setOfile(rs.getString("ofile"));
                dto.setSfile(rs.getString("sfile"));
                dto.setPostdate(rs.getString("postdate"));

                fileList.add(dto);
            }
        } catch(Exception e) {
            System.out.println("MyFileList 오류 발생");
            e.printStackTrace();
        }
        return fileList;
    }
}
