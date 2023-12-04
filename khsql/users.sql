CREATE TABLE users (
	userid          VARCHAR2(20)	PRIMARY KEY, 
	username		VARCHAR2(30)	NOT NULL,
	userpassword	VARCHAR2(50)	NOT NULL,
	userage			NUMBER(3)	    NOT NULL,
	useremail		VARCHAR2(50)	NOT NULL
);

INSERT INTO users(userid, username, userpassword, userage, useremail)
VALUES('today', '°í¿À´Ã', '12345', 25, 'today@korea.com');

INSERT INTO users(userid, username, userpassword, userage, useremail)
VALUES('sky123', '¿ÀÇÏ´Ã', '123456', 26, 'sky123@korea.com');

COMMIT;

SELECT userid, username, userpassword, userage, useremail 
FROM users;

SELECT userid, username, userpassword, userage, useremail 
FROM users WHERE userid = 'cloud';

DELETE FROM users;

DROP TABLE users;
