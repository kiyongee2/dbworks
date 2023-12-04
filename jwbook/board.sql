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

INSERT INTO board (bno, title, content, filename, id)
VALUES (seq_bno.NEXTVAL, '������', '�۳����Դϴ�.', 'bird.jpg', 'khit');

COMMIT;

SELECT * FROM board ORDER BY bno DESC;

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

DROP TABLE board;
DROP SEQUENCE seq_bno;

