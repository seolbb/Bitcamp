CREATE TABLE GUESTBOOK (
    IDX NUMBER PRIMARY KEY,
    NAME VARCHAR2(30),
    SUBJECT VARCHAR2(150),
    CONTENT VARCHAR2(4000),
    EMAIL VARCHAR2(100),
    PWD VARCHAR2(30),
    REGDATE DATE DEFAULT SYSDATE
);
CREATE SEQUENCE GUESTBOOK_SEQ NOCACHE;
INSERT INTO GUESTBOOK
       (IDX, NAME, SUBJECT, CONTENT, EMAIL, PWD, REGDATE)
VALUES (GUESTBOOK_SEQ.NEXTVAL, '홍일동', '제목1', '내용1', 
        'hong1@test.com', '1111', SYSDATE - 3);  
INSERT INTO GUESTBOOK
       (IDX, NAME, SUBJECT, CONTENT, EMAIL, PWD, REGDATE)
VALUES (GUESTBOOK_SEQ.NEXTVAL, '홍이동', '제목2', '내용2', 
        'hong2@test.com', '2222', SYSDATE - 2);    
INSERT INTO GUESTBOOK
       (IDX, NAME, SUBJECT, CONTENT, EMAIL, PWD, REGDATE)
VALUES (GUESTBOOK_SEQ.NEXTVAL, '홍삼동', '제목3', '내용3', 
        'hong3@test.com', '3333', SYSDATE - 1);           
COMMIT;

SELECT * FROM GUESTBOOK;
