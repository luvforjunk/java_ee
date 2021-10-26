CREATE TABLE cos(
name VARCHAR2(40) NOT NULL, -- 이름
id VARCHAR2(20) NOT NULL, -- 아이디
pwd VARCHAR2(20) NOT NULL, -- 비밀번호
repwd VARCHAR2(20) NOT NULL, -- 비밀번호 재확인
gender VARCHAR(20), -- 성별
email1 VARCHAR2(40), -- 이메일
email2 VARCHAR2(40),
tel1 VARCHAR2(7), -- 핸드폰
tel2 VARCHAR2(7),
tel3 VARCHAR2(7),
zipcode VARCHAR(7), -- 주소
addr1 VARCHAR2(20),
addr2 VARCHAR2(20)
);