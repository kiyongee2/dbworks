-- python 연동 pytest 테이블 생성
CREATE TABLE pytest(
    message VARCHAR2(50)
);

INSERT INTO pytest VALUES ('python과 oracle db 연동');

SELECT * FROM pytest;

COMMIT;
