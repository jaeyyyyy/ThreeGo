
-- READ --
-- 기존 테이블을 삭제하거나 컬럼명을 동일하게 맞춰주세요 --
-- TOURITEM 테이블은 데이터가 NULL인 컬럼이 많으므로 contentid를 제외하고는 모두 NULL로 설정하였습니다 --


-- 테이블 생성 --
--pass 는 수정하면서 지울 것
create table boardtable (
                            b_id number primary key,
                            u_id varchar2(50) not null,
                            CONSTRAINT fk_userid FOREIGN key(u_id) REFERENCES users(u_id),
                            b_writer varchar2(50) not null,
                            b_title varchar2(200) not null,
                            b_content CLOB not null,
                            b_postdate date default sysdate not null,
                            b_ofile varchar2(200),
                            b_sfile varchar2(30),
                            pass varchar2(50) not null,
                            b_visitcount number default 0 not NULL
);
-- 이전에 썼던거
-- create table boardtable (
--                             idx number primary key,
--                             name varchar2(50) not null,
--                             title varchar2(200) not null,
--                             content varchar2(2000) not null,
--                             postdate date default sysdate not null,
--                             ofile varchar2(200),
--                             sfile varchar2(30),
--                             downcount number(5) default 0 not null,
--                             pass varchar2(50) not null,
--                             visitcount number default 0 not null
-- );
-- 이거 pw1랑 큰따옴표 뺐습니다.
CREATE TABLE USERS (
                        U_ID   varchar2(40)      NOT NULL,
                        U_PW1   varchar2(40)      NOT NULL,
                        U_PW2   varchar2(40)      NOT NULL,
                        U_NAME   varchar2(40)      NOT NULL,
                        U_EMAIL   varchar2(200)      NOT NULL,
                        U_FILE   varchar2(200)      NULL,
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


CREATE TABLE "T_C_TYPE" (
                            contenttypeid   number(38,0)      NOT NULL,
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