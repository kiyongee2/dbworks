-- bookmall join
-- ������ �ֹ��� ���� �̸��� �ǸŰ����� �˻��Ͻÿ�
-- ���� ����
SELECT cs.name, od.saleprice
FROM customer cs, orders od
WHERE cs.custid = od.custid;

SELECT cs.name, od.saleprice
FROM customer cs JOIN orders od
  ON cs.custid = od.custid;

-- Į������ �������� ON ��� USING ��� ���� 
SELECT cs.name, od.saleprice
FROM customer cs JOIN orders od
  USING (custid);

-- ������ �ֹ����� ���� ���� �����Ͽ� 
-- ���� �̸��� �ֹ� �ǸŰ����� �˻�
SELECT cs.name, od.saleprice
FROM customer cs LEFT OUTER JOIN orders od
    ON cs.custid = od.custid;
    
SELECT od.saleprice, cs.name
FROM orders od RIGHT OUTER JOIN customer cs
    ON cs.custid = od.custid;
    
