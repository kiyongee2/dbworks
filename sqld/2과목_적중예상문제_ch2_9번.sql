CREATE TABLE ���α׷� (
	���α׷�ID		VARCHAR(6),
	���α׷���		VARCHAR(30),
	����			VARCHAR(10),
	�۰�			VARCHAR(20)
);

CREATE TABLE ���α׷��� (
	��ID		VARCHAR(3),	
	���α׷�ID		VARCHAR(6),
	��۸�üID		VARCHAR(1),
	��۽�������	DATE,
	�����������	DATE
);

CREATE TABLE ��۸�ü (
	��۸�üID		VARCHAR(1),
	��۸�ü��		VARCHAR(20)
);

INSERT INTO ���α׷� VALUES('T00001','������','��μ�','�̾���');
INSERT INTO ���α׷� VALUES('J00001','����ο� �ǻ��Ȱ','�ſ�ȣ','�̿�');
INSERT INTO ���α׷� VALUES('M00002','������Ÿ','������','������');
INSERT INTO ���α׷� VALUES('S00001','�� �� �츮��','������','�̳���');
INSERT INTO ���α׷� VALUES('N00001','��¡�����','Ȳ����','Ȳ����');
INSERT INTO ���α׷� VALUES('T00002','���� ������','�����','���ؿ�');

INSERT INTO ���α׷��� VALUES('001','T00001','T','20180829','29991231');
INSERT INTO ���α׷��� VALUES('002','J00001','J','20210617','20210916');
INSERT INTO ���α׷��� VALUES('003','M00002','M','20070530','29991231');
INSERT INTO ���α׷��� VALUES('004','S00001','S','20211206','20220125');
INSERT INTO ���α׷��� VALUES('005','N00001','N','20210917','29991231');
INSERT INTO ���α׷��� VALUES('006','T00002','T','20180321','20180517');

INSERT INTO ��۸�ü VALUES('T','tvn');
INSERT INTO ��۸�ü VALUES('J','jtbc');
INSERT INTO ��۸�ü VALUES('M','mbc');
INSERT INTO ��۸�ü VALUES('K','kbs');
INSERT INTO ��۸�ü VALUES('S','sbs');
INSERT INTO ��۸�ü VALUES('N','netflix');

SELECT B.���α׷���,
	   C.��۸�ü��,
	   A.��۽�������,
	   A.�����������
  FROM (SELECT ���α׷�ID, ��۸�üID, ��۽�������, ����������� 
  		  FROM ���α׷���) A,
  	   ���α׷� B, ��۸�ü C
 WHERE A.���α׷�ID = B.���α׷�ID 
   AND A.��۸�üID = C.��۸�üID;

SELECT B.���α׷���,
	   C.��۸�ü��,
	   A.��۽�������,
	   A.�����������
  FROM (SELECT ���α׷�ID, ��۸�üID 
  		  FROM ���α׷���
		 WHERE SYSDATE BETWEEN ��۽������� AND �����������) A,
  	   ���α׷� B, ��۸�ü C
 WHERE A.���α׷�ID = B.���α׷�ID 
   AND A.��۸�üID = C.��۸�üID;
  
SELECT B.���α׷���,
	   C.��۸�ü��,
	   A.��۽�������,
	   A.�����������
  FROM (SELECT ���α׷�ID, ��۸�üID, ��۽�������, �����������
		  FROM ���α׷���
		 WHERE SYSDATE BETWEEN ��۽������� AND �����������) A,
  	   ���α׷� B, ��۸�ü C
 WHERE A.���α׷�ID = B.���α׷�ID 
   AND A.��۸�üID = C.��۸�üID;
  
SELECT B.���α׷���,
	   C.��۸�ü��,
	   A.��۽�������,
	   A.�����������
  FROM (SELECT ���α׷�ID, ��۸�üID, ��۽�������, ����������� 
  		  FROM ���α׷���
		 WHERE SYSDATE BETWEEN ��۽������� AND ����������� 
		   AND ���α׷�ID = B.���α׷�ID
		   AND ��۸�üID = C.��۸�üID) A,
  	   ���α׷� B, ��۸�ü C
 WHERE A.���α׷�ID = B.���α׷�ID 