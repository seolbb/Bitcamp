-- 회원(MEMBER) 테이블 생성
CREATE TABLE MEMBER (
    ID VARCHAR2(20) PRIMARY KEY NOT NULL,
    NAME VARCHAR2(30) NOT NULL,
    PASSWORD VARCHAR2(20) NOT NULL,
    PHONE VARCHAR2(20),
    EMAIL VARCHAR2(50)
);
COMMENT ON TABLE MEMBER IS '회원정보';
COMMENT ON COLUMN MEMBER.ID IS '아이디';
COMMENT ON COLUMN MEMBER.NAME IS '성명';
COMMENT ON COLUMN MEMBER.PASSWORD IS '암호';
COMMENT ON COLUMN MEMBER.PHONE IS '전화번호';
COMMENT ON COLUMN MEMBER.EMAIL IS '메일';
-- 게시판(BOARD) 테이블 생성
CREATE TABLE BOARD (
    BNO NUMBER PRIMARY KEY NOT NULL,
    TITLE VARCHAR2(150),
    CONTENT VARCHAR2(3000),
    ID VARCHAR2(20) REFERENCES MEMBER (ID) NOT NULL,
    REGDATE DATE DEFAULT SYSDATE NOT NULL
);

COMMENT ON TABLE BOARD IS '게시판';
COMMENT ON COLUMN BOARD.BNO IS '글번호';
COMMENT ON COLUMN BOARD.TITLE IS '글제목';
COMMENT ON COLUMN BOARD.CONTENT IS '글내용';
COMMENT ON COLUMN BOARD.ID IS '작성자아이디';
COMMENT ON COLUMN BOARD.REGDATE IS '작성일시';
-- 인덱스 생성
CREATE INDEX BOARD_IDX_ID ON BOARD (ID);
--===============================================

-- 멤버 데이터 입력
INSERT INTO MEMBER
VALUES ('hong', '홍길동', 'hong1234', '010-1111-1111', 'hong@test.com');
INSERT INTO MEMBER
VALUES ('kim', '김유신', 'kim1234', '010-2222-2222', 'kim@test.com');
INSERT INTO MEMBER
VALUES ('kang', '강감찬', 'kang1234', '010-3333-3333', 'kang@test.com');
INSERT INTO MEMBER
VALUES ('seol', '손설빈', 'seol1234', '010-4444-4444', 'seol@test.com');
INSERT INTO MEMBER
VALUES ('tk', '김댕댕', 'tk1234', '010-5555-5555', 'tk@test.com');
COMMIT;
SELECT * FROM MEMBER;

-- 홍길동이 작성한 게시글 2개 입력
INSERT INTO BOARD
VALUES (1, '책의 제목', '책의 내용', 'hong', SYSDATE);
INSERT INTO BOARD
VALUES (2, '책의 제목2', '책의 내용2', 'hong', SYSDATE);
COMMIT;
SELECT * FROM BOARD;

-- 김유신 정보 수정
UPDATE MEMBER
SET PHONE = '010-2222-1234', EMAIL = 'kim@mystudy.com'
WHERE NAME = '김유신';
COMMIT;
SELECT * FROM MEMBER;

-- 2명의 회원정보 삭제
DELETE FROM MEMBER
WHERE ID = 'seol';
DELETE FROM MEMBER
WHERE ID = 'tk';
COMMIT;
SELECT * FROM MEMBER;

SELECT * FROM user_constraints  WHERE TABLE_NAME = 'BOARD';


-- 인덱스 생성
CREATE INDEX MEMBER_IDX_NAME ON MEMBER (NAME);

-- 뷰 생성
CREATE OR REPLACE VIEW MEMBER_IDX_NAME
AS
SELECT M.ID, M.NAME, M.PHONE, M.EMAIL, B.BNO, B.TITLE, B.REGDATE 
FROM MEMBER M, BOARD B
WHERE M.ID = B.ID
WITH READ ONLY;

-- 홍길동이 작성한 글 조회
SELECT M.NAME, B.TITLE, B.REGDATE FROM MEMBER M, BOARD B
WHERE M.ID = B.ID
AND M.NAME = '홍길동'
ORDER BY B.REGDATE;













