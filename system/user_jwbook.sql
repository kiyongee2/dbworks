-- system / pw1234
-- javauser / pwjavauser
-- jwbook / pwjwbook

-- c##�� ������ �ʵ��� ����
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

-- javauser �� ��й�ȣ ����
CREATE USER jwbook IDENTIFIED BY pwjwbook;

-- ���� �ο�
GRANT CONNECT, RESOURCE, DBA TO jwbook;