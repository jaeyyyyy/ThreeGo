package com.DTO;

public class UserDTO {
    public UserDTO() {
    }

    //유저 변수 선언
    private String u_id;
    private String u_pw;
    private String u_name;
    private String u_email;
    private String u_ofile;
    private String u_sfile;

    private String u_about;

    public String getU_id() {
        return u_id;
    }

    public void setU_id(String u_id) {
        this.u_id = u_id;
    }

    public String getU_pw() {
        return u_pw;
    }

    public void setU_pw(String u_pw) {
        this.u_pw = u_pw;
    }

    public String getU_name() {
        return u_name;
    }

    public void setU_name(String u_name) {
        this.u_name = u_name;
    }

    public String getU_email() {
        return u_email;
    }

    public void setU_email(String u_email) {
        this.u_email = u_email;
    }

    public String getU_sfile() {
        return u_sfile;
    }

    public void setU_sfile(String u_sfile) {
        this.u_sfile = u_sfile;
    }

    public String getU_ofile() {
        return u_ofile;
    }

    public void setU_ofile(String u_ofile) {
        this.u_ofile = u_ofile;
    }

    public String getU_about() {
        return u_about;
    }

    public void setU_about(String u_about) {
        this.u_about = u_about;
    }
}