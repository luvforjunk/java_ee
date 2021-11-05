--테이블
CREATE TABLE imageboard(
     seq NUMBER PRIMARY KEY,               
     imageId VARCHAR2(20) NOT NULL,     -- 상품코드  
     imageName VARCHAR2(40) NOT NULL, -- 상품명
     imagePrice NUMBER NOT NULL,      -- 단가
     imageQty NUMBER NOT NULL,      -- 개수
     imageContent VARCHAR2(4000) NOT NULL,      
     image1 varchar2(200),   
     logtime DATE DEFAULT SYSDATE
 );

--시퀀스 객체
create sequence seq_imageboard nocache nocycle;



--상품 테이블
CREATE TABLE product(
	seq NUMBER PRIMARY KEY,              
 	img VARCHAR2(20) NOT NULL,     -- 상품  
 	name VARCHAR2(30) NOT NULL, -- 상품명
 	unit NUMBER NOT NULL,      -- 단가
 	qty NUMBER NOT NULL,      -- 개수
 	total NUMBER(30),     
 	rate NUMBER(30), 
 	discount NUMBER(30),
 	price NUMBER(30)
);

--시퀀스 객체
create sequence seq_product nocache nocycle;