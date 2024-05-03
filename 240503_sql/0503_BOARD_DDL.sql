CREATE TABLE BOARD (
  SEQ_NO INT,
  TITLE VARCHAR(50),
  CONTENT VARCHAR(100),
  CODE VARCHAR(1)
);

INSERT INTO BOARD VALUES (1, '첫번째 공지사항', '공지사항 입니다', 'N');
INSERT INTO BOARD VALUES (2, '첫번째 FAQ', 'FAQ 입니다', 'F');
INSERT INTO BOARD VALUES (3, '첫번째 자료', '자료실 입니다', 'D');
INSERT INTO BOARD VALUES (4, '첫번째 QnA', 'QnA 입니다', 'Q');
INSERT INTO BOARD VALUES (5, '1번 게시글', '1번 게시글입니다', 'A');
INSERT INTO BOARD VALUES (6, '2번 게시글', '두번째 게시글입니다', 'A');


CREATE TABLE BOARD_CODE (
  CODE VARCHAR(1),
  CODE_EXP VARCHAR(100),
  USE_YN VARCHAR(1)
);

INSERT INTO BOARD_CODE VALUES ('N', '공지사항', 'Y');
INSERT INTO BOARD_CODE VALUES ('F', 'FAQ', 'Y');
INSERT INTO BOARD_CODE VALUES ('D', '자료실', 'N');
INSERT INTO BOARD_CODE VALUES ('Q', 'QnA', 'Y');
INSERT INTO BOARD_CODE VALUES ('A', '일반게시판', 'Y');


CREATE TABLE BOARD_FILE (
  FILE_SEQ_NO INT,
  BOARD_SEQ_NO INT,
  FILE_NAME VARCHAR(50),
  FILE_SIZE INT
);

INSERT INTO BOARD_FILE VALUES (1, 1, '공지사항.hwp', 12345678);
INSERT INTO BOARD_FILE VALUES (2, 2, 'FAQ자료.zip', 10000000);
INSERT INTO BOARD_FILE VALUES (3, 5, 'readme.txt', 1000);