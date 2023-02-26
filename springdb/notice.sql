-- Notice 엔티티
CREATE TABLE notice( 
    id NUMBER NOT NULL,
    title NVARCHAR2(100) NOT NULL,
    writer_id NVARCHAR2(50) NOT NULL,
    content NVARCHAR2(2000),
    regdate TIMESTAMP (6) DEFAULT systimestamp NOT NULL,
    hit NUMBER DEFAULT 0 NOT NULL,
    files NVARCHAR2(1000),
    pub NUMBER(1,0) DEFAULT 0 NOT NULL,
    CONSTRAINT "NOTICE_PK" PRIMARY KEY (id)
);

INSERT INTO notice VALUES (1, '테스트 제목', 'giyong', '테스트 내용입니다.', SYSDATE, 1,'test.txt', 1);

SELECT * FROM notice;
DROP TABLE notice;