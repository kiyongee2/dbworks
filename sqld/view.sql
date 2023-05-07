CREATE TABLE JOB_INFO(
	JOB_ID		VARCHAR(10),
	MIN_SALARY	NUMBER,
	MAX_SALARY	NUMBER
);

INSERT INTO JOB_INFO VALUES('AD_PRES',20080,40000);
INSERT INTO JOB_INFO VALUES('AD_VP',15000,30000);
INSERT INTO JOB_INFO VALUES('AD_ASST',3000,6000);
INSERT INTO JOB_INFO VALUES('FI_MGR',8200,16000);
INSERT INTO JOB_INFO VALUES('FI_ACCOUNT',4200,9000);
INSERT INTO JOB_INFO VALUES('AC_MGR',8200,16000);
INSERT INTO JOB_INFO VALUES('AC_ACCOUNT',4200,9000);

COMMIT;

-- �� �����
CREATE VIEW V_JOB_INFO
AS
SELECT * FROM JOB_INFO WHERE MIN_SALARY > 5000;

-- �� �˻�
SELECT * FROM V_JOB_INFO V_JOB_INFO;

SELECT COUNT(*) 
  FROM V_JOB_INFO
 WHERE MAX_SALARY - MIN_SALARY > 8000;

-- vw_EMP �˻�
SELECT * FROM vw_EMP;

SELECT * FROM employee;

SELECT * FROM department;

-- ����� ��� ������ �μ��̸��� �˻��Ͻÿ�.
SELECT emp.*, dept.deptname
FROM employee emp, department dept
WHERE emp.deptid = dept.deptid;

-- ����� �̸��� ����, �޿�, �μ��̸��� �˻��� �並 �ۼ��Ͻÿ�
CREATE VIEW vw_employee AS
SELECT emp.empname, emp.gender, emp.salary, dept.deptname
FROM employee emp, department dept
WHERE emp.deptid = dept.deptid;

SELECT * FROM vw_employee;

-- ����� �ѻ������ ���Ͻÿ�
SELECT COUNT(*) �ѻ����
FROM vw_employee;

-- �μ��� �ο����� ���Ͻÿ�
-- �ѿ��� 3���� �ʰ��ϴ� �μ��� �˻��Ͻÿ�
SELECT deptname, COUNT(*) total
FROM vw_employee
GROUP BY deptname
HAVING COUNT(*) > 3;

-- �μ���, ���� �ο����� ���Ͻÿ�
SELECT deptname, gender, COUNT(*) total
FROM vw_employee
GROUP BY deptname, gender;

-- �μ��� ���� �ο����� �Ұ� �� �Ѱ踦 ���Ͻÿ�
SELECT deptname, gender, COUNT(*) total
FROM vw_employee
GROUP BY ROLLUP(deptname, gender);






