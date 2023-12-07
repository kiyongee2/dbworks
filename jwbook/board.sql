-- �Խ��� ���̺�
CREATE TABLE board(
    bno        NUMBER PRIMARY KEY,
    title      VARCHAR2(100) NOT NULL,
    content    CLOB NOT NULL,
    createdate TIMESTAMP DEFAULT SYSTIMESTAMP,
    modifydate TIMESTAMP,
    hit        NUMBER DEFAULT 0,
    filename   VARCHAR2(50), 
    id         VARCHAR2(20) NOT NULL,
    replycnt   NUMBER DEFAULT 0,
    FOREIGN KEY(id) REFERENCES member(id) ON DELETE CASCADE 
);

CREATE SEQUENCE seq_bno NOCACHE;

INSERT INTO board (bno, title, content, id)
VALUES (seq_bno.NEXTVAL, '������', '�۳����Դϴ�.', 'khit');
INSERT INTO board (bno, title, content, id)
VALUES (seq_bno.NEXTVAL, '������2', '�۳���2�Դϴ�.', 'khit');
INSERT INTO board (bno, title, content, id)
VALUES (seq_bno.NEXTVAL, '������3', '�۳���3�Դϴ�.', 'today');
INSERT INTO board (bno, title, content, id)
VALUES (seq_bno.NEXTVAL, '������4', '�۳���4�Դϴ�.', 'today');

-- ��� ����
INSERT INTO board (bno, title, content, id)
(SELECT seq_bno.NEXTVAL, title, content, id FROM board);

-- ������ ó��
SELECT ROWNUM, board.*
FROM board
WHERE ROWNUM > 0 AND ROWNUM <= 10;

-- ��������(�˻��� �ҿ�����)
SELECT *
FROM (SELECT ROWNUM RN, board.* FROM board ORDER BY bno DESC)
WHERE RN >= 21 AND RN <= 30;

-- ��������(deep 2�ܰ�- ����! board ��Ī�� bo�� �����)
SELECT *
FROM (SELECT ROWNUM RN, bo.*
      FROM (SELECT * FROM board ORDER BY bno DESC) bo)
WHERE RN >= 11 AND RN <= 20;

-- �� �Խñ� ��
SELECT COUNT(*) AS total FROM board;

-- �Խñ� �˻�(����, ���̵�)
SELECT *
FROM board
WHERE title LIKE '%2%';

-- ���
SELECT * FROM reply WHERE bno = 1;

-- ��� �� ����ϱ�
UPDATE board
SET replycnt = (
            SELECT count(rno) 
            FROM reply
            WHERE bno = 2)
WHERE bno = 2;
    
-- ��� �� 2
UPDATE board b
SET b.replycnt = (
            SELECT count(rno) 
            FROM reply
            WHERE reply.bno = board.bno
    );

SELECT count(rno) 
FROM reply
WHERE bno = 1;

DELETE FROM board;
DELETE FROM reply;

DROP TABLE board;
DROP SEQUENCE seq_bno;

