-- user ���� ����

-- c##�� ������ �ʵ��� ����
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

-- javauser �� ��й�ȣ ����
CREATE USER javauser IDENTIFIED BY pwjavauser;

-- ���� �ο�
GRANT CONNECT, RESOURCE, DBA TO javauser; 



