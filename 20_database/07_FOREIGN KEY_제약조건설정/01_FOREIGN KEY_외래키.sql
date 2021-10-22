/******************************************
�������� (Constraint) 
- �ùٸ� �����͸� ������ ���ֱ� ���� ���(�߸��� �����ʹ� ����� ����-�����߻�)
- �������� ��Ȯ���� �ϰ����� �����ϱ� ���� �� Į���� �����ϴ� ��Ģ
- ��ųʸ��� �����
- ���̺� ������ ���Ἲ ���������� �����Ͽ� ���α׷��� ������ �ܼ�ȭ
- �����ͺ��̽� ������ ���� ���Ἲ ���������� �����Ǿ� ������ ���� �߻� ���ɼ��� �ٿ���
- �Ͻ������� Ȱ��ȭ(ENABLE) �Ǵ� ��Ȱ��ȭ(DISABLE) �� �� �ִ�.

<�������� 5����>
- NOT NULL, UNIQUE, CHECK, PRIMARY KEY, FOREIGN KEY

1. NOT NULL : Null�� �����Ҽ� ����
2. UNIQUE : �ߺ��Ǵ� �� ���� �ȵ�
    (�ߺ��Ǵ� �� ����� �ϹǷ�, �������μ����� ���� �����͸� ã�ƾ� �Ѵ�. �����ɸ� - �ذ� : �ε���)
3. CHECK : �ش� Į���� ���� ������ ������ ���� ������ ���� ����
4. PRIMARY KEY(�⺻Ű) : ���� �� (NOT NULL + ����ũ)
5. FOREIGN KEY(�ܷ�Ű-����) : �ش� Į�� ���� �����Ǵ� ���̺��� Į�� �� �� �ϳ��� ��ġ�ϰų� Null�� ����
    - �ڽ� ���̺� : �ٸ� ���̺��� ���� �����ϴ� ���̺�
    - �ܷ�Ű(foreign key): �θ����̺��� ���� �����ϴ� �ڽ����̺��� Į��
    - �θ� ���̺� : �ٸ� ���̺� ���� �����Ǵ� ���̺�
    - ����Ű(reference : �ڽ� ���̺��� �����ϴ� �θ� ���̺��� Į��
************************************************/

/* �������� �ɼ�
CASCADE : �θ����̺�(parent)�� ���������� ��Ȱ��ȭ(����) ��Ű�鼭
    �����ϰ� �ִ� �ڳ�(chile) ���̺��� �������Ǳ��� ��Ȱ��ȭ(����)
**************************/

/****************************
���̺� ������ �������� ����
    �÷��� �����ϸ鼭 �÷��������� �������� ����
    - �ܷ�Ű (FOREIGN KEY) �������� ���� ����
    - ���� : �÷����� REFERENCES ��� ���̺� (����÷�)

****************************/
SELECT * FROM DEPT;
-- �÷��������� ��������(�ܷ�Ű) ����
CREATE TABLE EMP01 (
    EMPNO NUMBER PRIMARY KEY,
    ENAME VARCHAR2(30) NOT NULL,
    JOB VARCHAR2(10),
    DEPTNO VARCHAR2(10) REFERENCES DEPT (ID) -- �ܷ�Ű ����(�÷�����)
);
SELECT * FROM EMP01;
INSERT INTO EMP01 (EMPNO, ENAME, JOB, DEPTNO)
VALUES (1111, 'ȫ�浿', '����1', '10');
COMMIT;

--ORA-02291: integrity constraint (MADANG.SYS_C007058) violated - parent key not found
INSERT INTO EMP01 (EMPNO, ENAME, JOB, DEPTNO)
VALUES (2222, 'ȫ�浿2', '����2', '40'); --DEPT ���̺� ���� ������ '40'

--=============================================
-- ���̺� �������� �������� ����
CREATE TABLE EMP02 (
    EMPNO NUMBER,
    ENAME VARCHAR2(30) NOT NULL,
    JOB VARCHAR2(10),
    DEPTNO VARCHAR2(10),
    
    PRIMARY KEY (EMPNO),  --�⺻Ű(PRIMARY KEY) ����
    FOREIGN KEY (DEPTNO) REFERENCES DEPT (ID) --�ܷ�Ű(FOREIGN KEY) ����
);
SELECT * FROM EMP02;
INSERT INTO EMP02 (EMPNO, ENAME, JOB, DEPTNO)
VALUES (1111, 'ȫ�浿', '����1', '10');
COMMIT;

--ORA-02291: integrity constraint (MADANG.SYS_C007058) violated - parent key not found
INSERT INTO EMP02 (EMPNO, ENAME, JOB, DEPTNO)
VALUES (2222, 'ȫ�浿2', '����2', '40'); --DEPT ���̺� ���� ������ '40'

--============================================
-- �������Ǹ��� ��������� �����ؼ� ���
-- ���� : CONSTRAINT �������Ǹ� ��������������
CREATE TABLE EMP03 (
    EMPNO NUMBER,
    ENAME VARCHAR2(30) CONSTRAINT EMP03_ENAME_NN NOT NULL,
    JOB VARCHAR2(10),
    DEPTNO VARCHAR2(10),
    
    CONSTRAINT EMP03_EMPNO_PK PRIMARY KEY (EMPNO),  --�⺻Ű(PRIMARY KEY) ����
    CONSTRAINT EMP03_DEPTNO_FK FOREIGN KEY (DEPTNO) REFERENCES DEPT (ID) --�ܷ�Ű(FOREIGN KEY) ����
);

INSERT INTO EMP03 (EMPNO, ENAME, JOB, DEPTNO)
VALUES (1111, 'ȫ�浿', '����1', '10');
COMMIT;

--ORA-02291: integrity constraint (MADANG.SYS_C007058) violated - parent key not found
INSERT INTO EMP03 (EMPNO, ENAME, JOB, DEPTNO)
VALUES (2222, 'ȫ�浿2', '����2', '40'); --DEPT ���̺� ���� ������ '40'

--============================================
/* *** ���̺� �������� �߰�, ���� *****
-- �������� �߰�
ALTER TABLE ���̺�� ADD CONSTRAINT �������Ǹ� ��������������(����);
-- ���� ���� ����
ALTER TABLE ���̺�� DROP CONSTRAINT �������Ǹ�;
***********************************/
-- EMP01 ���̺��� PRIMARY KEY ���� : SYS_C007057
ALTER TABLE EMP01 DROP CONSTRAINT SYS_C007057;

-- EMP01 ���̺� PRIMARY KEY �߰�
ALTER TABLE EMP01 ADD CONSTRAINT EMP01_EMPNO_PK PRIMARY KEY (EMPNO); 
----------------------------------
-- PK ���� ���� - ���ϵ����� �Է�
SELECT * FROM EMP01;
--ORA-00001: unique constraint (MADANG.EMP01_EMPNO_PK) violated
INSERT INTO EMP01
VALUES (1111, 'ȫ�浿2', '����1', '10');
ALTER TABLE EMP01 DROP CONSTRAINT EMP01_EMPNO_PK; --PK ����
-- PK ���� ��
INSERT INTO EMP01
VALUES (1111, 'ȫ�浿2', '����1', '10'); -- �߰� ����
COMMIT;
----------------------------------
-- �������� ������ ������ ���¿� ���� ���뿩�� ����
---- �ߺ������� �ִ� ��� PRIMARY KEY, UNIQUE ���� �ȵ�
---- NOT NULL �����Ϸ��� �÷��� NULL �����Ͱ� �ϳ��� ������ �ȵȴ�.
---- (�ذ���) �ߺ������� ���� �Ǵ� ���� UNIQUE �ϰ�
----    NULL ������ ã�Ƽ� ����ó��(NULL �ƴ� ������)
ALTER TABLE EMP01 ADD CONSTRAINT EMP01_EMPNO_PK PRIMARY KEY (EMPNO);

--(�ǽ�) EMP02 �ܷ�Ű(FOREIGN KEY) �̸� ���� ó��
ALTER TABLE EMP02 DROP CONSTRAINT SYS_C007068;
ALTER TABLE EMP02 ADD CONSTRAINT EMP02_DEMPNO_FK FOREIGN KEY (DEPTNO) REFERENCES DEPT (ID);
--================================
/* �������� Ȱ��ȭ / ��Ȱ��ȭ
-- �������� �����Ǿ� �ִ� ���� ���� �Ǵ� ��������
-- ALTER TABLE ���̺�� DISALBE CONSTRAINT �����̸�;
-- ALTER TABLE ���̺�� ENABLE CONSTRAINT �����̸�;


**********************************/
-- �������� ��Ȱ��ȭ
alter table "MADANG"."EMP02" disable  constraint "EMP02_DEMPNO_FK";
-- =
alter table EMP02 disable  constraint EMP02_DEMPNO_FK;
INSERT INTO EMP02 VALUES(3333, 'ȫ�浿3', '����3', '40');
COMMIT;
SELECT * FROM EMP02;
-- �������� Ȱ��ȭ(�������)
alter table EMP02 ENABLE constraint EMP02_DEMPNO_FK;
--=========================================
-- �����ͻ��� ���̺� : USER_CONS_COLUMNS, USER_CONSTRAINTS
SELECT * FROM USER_CONS_COLUMNS;
SELECT * FROM USER_CONSTRAINTS;
SELECT A.OWNER, A.TABLE_NAME, A.COLUMN_NAME , A.COLUMN_NAME,
        B.CONSTRAINT_TYPE, 
        DECODE(B.CONSTRAINT_TYPE,    --> DECODE : IF ���̶� ��� / P�̸� PRIMARY KEY...
                'P', 'PRIMARY KEY',
                'U', 'UNIQUE',
                'C', 'CHECK OR NOT NULL',
                'R', 'FOREIGN KEY') CONSTRAINT_TYPE_DESC
FROM USER_CONS_COLUMNS A, USER_CONSTRAINTS B
WHERE A.TABLE_NAME = B.TABLE_NAME
AND A.CONSTRAINT_NAME = B.CONSTRAINT_NAME
AND A.TABLE_NAME LIKE 'EMP%';















