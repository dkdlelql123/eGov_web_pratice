CREATE DATABASE `egov03`;
USE `egov03`;

# 사용자 테이블 생성(아이디, 비밀번호, 이름)
CREATE TABLE tb_user(
userID VARCHAR(40) PRIMARY KEY,
userPw VARCHAR(60) NOT NULL,
`name` VARCHAR(20) NOT NULL
);

# 테스트 계정 추가
INSERT INTO tb_user
SET userID = 'admin',
userPw = '1234qwer',
`name` = '관리자';

INSERT INTO tb_user
SET userID = 'test1',
userPw = 'test1',
`name` = '사용자1';

INSERT INTO tb_user
SET userID = 'test2',
userPw = 'test2',
`name` = '사용자2';

# 사용자 테이블 추가 컬럼 (아이디, 비밀번호, 이름 + 사용여부)
ALTER TABLE tb_user
ADD COLUMN use_yn VARCHAR(1);

# 테스트 사용자 사용여부 컬럼 Y 입력
UPDATE tb_user
SET use_yn = 'Y';

# 게시판 테이블 생성 (게시물 번호, 제목, 내용, 조회수, 작성자, 작성일)
CREATE TABLE tb_board(
idx INT(10) PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(100) NOT NULL,
contents VARCHAR(2000) NOT NULL,
`count` INT NOT NULL COMMENT '조회수',
writer VARCHAR(30) NOT NULL,
indate DATETIME NOT NULL
);

# 게시판 댓글 테이블 생성 (게시물 아이디, 순번, 내용, 작성자, 작성일)
CREATE TABLE tb_reply(
idx INT(10) AUTO_INCREMENT,
seq INT(10) COMMENT '순번',
reply VARCHAR(1000) NOT NULL,
writer VARCHAR(30) NOT NULL,
indate DATETIME NOT NULL,
PRIMARY KEY (idx, seq)
);

# 파일 테이블 생성 (게시물 아이디, 순번, 파일명, 등록자, 등록일)
CREATE TABLE tb_attach(
idx INT(10) AUTO_INCREMENT,
seq INT(10) COMMENT '순번',
filename VARCHAR(256) NOT NULL COMMENT '파일명',
writer VARCHAR(30) NOT NULL,
indate DATETIME NOT NULL,
PRIMARY KEY (idx, seq)
);