
-- READ --
-- 기존 테이블을 삭제하거나 컬럼명을 동일하게 맞춰주세요 --
-- TOURITEM 테이블은 데이터가 NULL인 컬럼이 많으므로 contentid를 제외하고는 모두 NULL로 설정하였습니다 --


-- 테이블 생성 --
-- 추천 테이블 추가 --
CREATE TABLE likes (
                       l_id NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
                       b_id NUMBER NOT NULL,
                       u_id varchar2(40) NOT NULL,
                       CONSTRAINT like_pk PRIMARY KEY (l_id),
                       CONSTRAINT like_uq UNIQUE (b_id, u_id)
);

--댓글 테이블 추가 --
CREATE TABLE REPLY
(
    b_id NUMBER,
    re_num NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
    u_id varchar2(50) NOT NULL,
    re_content varchar2(400) NOT NULL,
    re_regdate DATE DEFAULT SYSDATE NOT NULL,
    re_modifydate DATE,
    re_del varchar2(1) DEFAULT 'N' NOT NULL,
    re_parent NUMBER DEFAULT 0 NOT NULL,
    re_child NUMBER DEFAULT 0 NOT NULL,
    re_ref NUMBER NOT NULL,
    re_order NUMBER DEFAULT 0 NOT NULL,
    re_level NUMBER DEFAULT 0 NOT NULL,
    CONSTRAINT reply_pk PRIMARY KEY(b_id, re_num)
);

create table boardtable (
                            b_id number GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
                            u_id varchar2(50) not null,
                            u_name varchar2(50) not null,
                            b_title varchar2(200) not null,
                            b_content CLOB not null,
                            b_postdate date default sysdate not null,
                            b_ofile varchar2(200),
                            b_sfile varchar2(30),
                            b_visitcount number default 0 not NULL
);

-- pw 컬럼은 하나만 두고 사진을 넣을거라면 원파일명과 수정된 파일명을
CREATE TABLE USERS (
                        U_ID   varchar2(40)      NOT NULL,
                        U_PW   varchar2(40)      NOT NULL,
                        U_NAME   varchar2(40)      NOT NULL,
                        U_EMAIL   varchar2(200)      NOT NULL,
                        U_OFILE   varchar2(200)      NULL,
                        U_SFILE   varchar2(200)      NULL,
                        U_ABOUT   varchar2(200)      NULL
);

CREATE TABLE "TOURITEM" (
                            contentid   varchar2(40)      NOT NULL,
                            cat1   varchar2(40),
                            cat2   varchar2(40),
                            cat3   varchar2(40),
                            areacode   varchar2(40),
                            contenttypeid   varchar2(40),
                            addr1   varchar2(200),
                            addr2   varchar2(200),
                            firstimage   varchar2(600),
                            mapx   varchar2(200),
                            mapy   varchar2(200),
                            mlevel   varchar2(40),
                            sigungucode   varchar2(40),
                            tel   varchar2(200),
                            title   varchar2(200)
);

CREATE TABLE "T_CAT1" (
                          cat1   varchar2(40)      NOT NULL,
                          cat1_name   varchar2(200)      NOT NULL
);

CREATE TABLE "T_CAT2" (
                          cat2   varchar2(40)      NOT NULL,
                          cat2_name   varchar2(200)      NOT NULL,
                          cat1   varchar2(40)      NOT NULL
);


CREATE TABLE "T_CAT3" (
                          cat3   varchar2(40)      NOT NULL,
                          cat3_name   varchar2(200)      NOT NULL,
                          cat2   varchar2(40)      NOT NULL,
                          cat1 varchar2(40)      NOT NULL
);

CREATE TABLE "T_AREA" (
                          j_areacode   number(38,0)      NOT NULL,
                          j_area_name   varchar2(200)      NOT NULL
);


CREATE TABLE "T_SIGUNGU" (
                             s_sigungucode   number(38,0)      NOT NULL,
                             s_areacode   number(38,0)      NOT NULL,
                             sigungu_name   varchar2(200)      NOT NULL
);

-- varchar2(40)으로 바꾸었습니다. TOURITEM이랑 맞게
CREATE TABLE "T_C_TYPE" (
                            contenttypeid   varchar2(40)      NOT NULL,
                            ctype_name   varchar2(200)      NOT NULL
);




-- 데이터 입력 --
-- T_C_TYPE 테이블 외의 데이터는 InsertMain 실행 --
INSERT INTO "T_C_TYPE" (contenttypeid, ctype_name) VALUES ('12', '관광지');
INSERT INTO "T_C_TYPE" (contenttypeid, ctype_name) VALUES ('14', '문화시설');
INSERT INTO "T_C_TYPE" (contenttypeid, ctype_name) VALUES ('15', '축제공연행사');
INSERT INTO "T_C_TYPE" (contenttypeid, ctype_name) VALUES ('25', '여행코스');
INSERT INTO "T_C_TYPE" (contenttypeid, ctype_name) VALUES ('28', '레포츠');
INSERT INTO "T_C_TYPE" (contenttypeid, ctype_name) VALUES ('32', '숙박');
INSERT INTO "T_C_TYPE" (contenttypeid, ctype_name) VALUES ('38', '쇼핑');
INSERT INTO "T_C_TYPE" (contenttypeid, ctype_name) VALUES ('39', '음식점');