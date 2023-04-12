-- jweb function
SELECT bookid, REPLACE(bookname, '야구', '농구') bookname
FROM book;

-- 굿스포츠에서 출판한 도서의 제목과 제목의 문자 수, 바이트 수를 검색
SELECT bookname 제목,
       LENGTH(bookname) 문자수,
       LENGTHB(bookname) 바이트수
FROM book
WHERE publisher = '굿스포츠';

SELECT TO_NUMBER('123') 
FROM DUAL;

-- 날짜 형식 변환
SELECT SYSDATE
FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') 날짜,
       TO_CHAR(SYSDATE, 'YYYY') 년도,
       TO_CHAR(SYSDATE, 'MM') 월,
       TO_CHAR(SYSDATE, 'DD') 일
FROM DUAL;







