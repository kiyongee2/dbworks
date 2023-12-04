-- INDEX(�ε���) ���
SELECT * FROM t_board;

-- �ۼ��ڰ� '�̰�'�� �Խñ� �˻�
SELECT * FROM t_board WHERE writer = '�̰�';

-- �ۼ��ڰ� '�̰�'�� �Խñ��� �ε����� ����
-- CREATE INDEX �ε����̸� ON ���̺��(Į����)
CREATE INDEX idx_b1 ON t_board(writer); 

-- Ȯ���ϰ� �ε����� �����Ϸ��� ����Ŭ ��Ʈ�� �־��ش�.
-- /*+ INDEX(���̺�� �ε�����) */
SELECT /*+ INDEX(t_board idx_b1) */ * FROM t_board WHERE writer = '�̰�';

DROP INDEX idx_b1;