package com.DTO;

import java.util.Date;

public class ReplyDTO {
    private String b_id;
    private String re_num;
    private String u_id;
    private String re_content;
    private Date re_regdate;
    private Date re_modifydate;
    private String re_del;
    private int re_parent;
    private int re_child;
    private int re_ref;
    private int re_order;
    private int re_level;

    // 댓글 리스트 용 프로필 사진과 닉네임
    private String u_name;
    private String u_sfile;

    public String getB_id() {
        return b_id;
    }

    public void setB_id(String b_id) {
        this.b_id = b_id;
    }

    public String getRe_num() {
        return re_num;
    }

    public void setRe_num(String re_num) {
        this.re_num = re_num;
    }

    public String getU_id() {
        return u_id;
    }

    public void setU_id(String u_id) {
        this.u_id = u_id;
    }

    public String getRe_content() {
        return re_content;
    }

    public void setRe_content(String re_content) {
        this.re_content = re_content;
    }

    public Date getRe_regdate() {
        return re_regdate;
    }

    public void setRe_regdate(Date re_regdate) {
        this.re_regdate = re_regdate;
    }

    public Date getRe_modifydate() {
        return re_modifydate;
    }

    public void setRe_modifydate(Date re_modifydate) {
        this.re_modifydate = re_modifydate;
    }

    public String getRe_del() {
        return re_del;
    }

    public void setRe_del(String re_del) {
        this.re_del = re_del;
    }

    public int getRe_ref() {
        return re_ref;
    }

    public void setRe_ref(int re_ref) {
        this.re_ref = re_ref;
    }

    public int getRe_order() {
        return re_order;
    }

    public void setRe_order(int re_order) {
        this.re_order = re_order;
    }

    public int getRe_level() {
        return re_level;
    }

    public void setRe_level(int re_level) {
        this.re_level = re_level;
    }

    public int getRe_parent() { return re_parent; }

    public void setRe_parent(int re_parent) { this.re_parent = re_parent; }

    public int getRe_child() { return re_child; }

    public void setRe_child(int re_child) { this.re_child = re_child; }
    // 댓글 리스트용 프로필 사진과 닉네임 게터 세터

    public String getU_name() {  return u_name; }

    public void setU_name(String u_name) {
        this.u_name = u_name;
    }

    public String getU_sfile() {
        return u_sfile;
    }

    public void setU_sfile(String u_sfile) {
        this.u_sfile = u_sfile;
    }
}
