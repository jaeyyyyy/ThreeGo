package com.DTO;

import java.util.Date;

public class BoardDTO {
    private String b_id;
    private String u_id;
    private String u_name;
    private String b_title;
    private String b_content;
    private Date b_postdate;
    private String b_ofile;
    private String b_sfile;
    private int b_visitcount;

    // 리스트 출력 시 추천수 표시용
    private int b_likescount;

    public String getB_id() {
        return b_id;
    }

    public void setB_id(String b_id) {
        this.b_id = b_id;
    }

    public String getU_id() {
        return u_id;
    }

    public void setU_id(String u_id) {
        this.u_id = u_id;
    }

    public String getU_name() {
        return u_name;
    }

    public void setU_name(String u_name) {
        this.u_name = u_name;
    }

    public String getB_title() {
        return b_title;
    }

    public void setB_title(String b_title) {
        this.b_title = b_title;
    }

    public String getB_content() {
        return b_content;
    }

    public void setB_content(String b_content) {
        this.b_content = b_content;
    }

    public Date getB_postdate() {
        return b_postdate;
    }

    public void setB_postdate(Date b_postdate) {
        this.b_postdate = b_postdate;
    }

    public String getB_ofile() {
        return b_ofile;
    }

    public void setB_ofile(String b_ofile) {
        this.b_ofile = b_ofile;
    }

    public String getB_sfile() {
        return b_sfile;
    }

    public void setB_sfile(String b_sfile) {
        this.b_sfile = b_sfile;
    }

    public int getB_visitcount() {
        return b_visitcount;
    }

    public void setB_visitcount(int b_visitcount) {
        this.b_visitcount = b_visitcount;
    }


    // 리스트 출력 시 추천수 표시용 게터세터


    public int getB_likescount() { return b_likescount; }

    public void setB_likescount(int b_likescount) {
        this.b_likescount = b_likescount;
    }
}
