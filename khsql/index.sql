-- INDEX(인덱스) 사용
SELECT * FROM t_board;

-- 작성자가 '이강'인 게시글 검색
SELECT * FROM t_board WHERE writer = '이강';

-- 작성자가 '이강'인 게시글을 인덱스로 생성
-- CREATE INDEX 인덱스이름 ON 테이블명(칼럼명)
CREATE INDEX idx_b1 ON t_board(writer); 

-- 확실하게 인덱스를 적용하려면 오라클 힌트를 넣어준다.
-- /*+ INDEX(테이블명 인덱스명) */
SELECT /*+ INDEX(t_board idx_b1) */ * FROM t_board WHERE writer = '이강';

DROP INDEX idx_b1;