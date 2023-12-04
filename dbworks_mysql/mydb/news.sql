
CREATE TABLE news (
      aid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
      title VARCHAR(100) NOT NULL,
      img VARCHAR(50) NOT NULL,
      create_date TIMESTAMP DEFAULT now(),
      content TEXT NOT NULL
);

insert into news(title, img, content) 
values('경제 뉴스입니다.', 'phone.jpg', '기름값이 너무 올랐습니다');

insert into news(title, img, content) 
values('정치 뉴스입니다.', 'P1235.png', '이스라엘과 팔레스타인 전쟁으로 많은 사망자가 발생했습니다.');

select * from news;