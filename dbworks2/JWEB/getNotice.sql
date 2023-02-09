--getNoticeList
SELECT ROWNUM, notice.* FROM notice ORDER BY regDate DESC;

SELECT * FROM(
    SELECT ROWNUM num, n.* 
    FROM (SELECT * FROM notice ORDER BY regDate DESC) n
)
WHERE NUM BETWEEN 6 AND 10; 

-- getNextNotice
SELECT * FROM notice
WHERE id = (
    SELECT id FROM notice
    WHERE regDate > (SELECT regDate FROM notice WHERE id=3)
    AND ROWNUM = 1
);

--getPrevNotice
SELECT id FROM (SELECT * FROM notice ORDER BY regDate DESC)
WHERE regDate < (SELECT regDate FROM notice WHERE id=3)
AND ROWNUM = 1;

DESC notice;



