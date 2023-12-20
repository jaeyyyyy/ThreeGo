package com.DTO;

public class UserDTO {
    //유저 변수 선언
    private String u_id;
    private String u_pw1;
    private String u_pw2;
    private String u_name;
    private String u_email;

    public String getU_id() {
        return u_id;
    }

    public void setU_id(String u_id) {
        this.u_id = u_id;
    }

    public String getU_pw1() {
        return u_pw1;
    }

    public void setU_pw1(String u_pw1) {
        this.u_pw1 = u_pw1;
    }

    public String getU_pw2() {
        return u_pw2;
    }

    public void setU_pw2(String u_pw2) {
        this.u_pw2 = u_pw2;
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

}