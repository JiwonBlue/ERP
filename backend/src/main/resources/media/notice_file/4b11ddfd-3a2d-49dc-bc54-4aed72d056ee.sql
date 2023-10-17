-- �μ�
DROP TABLE IF EXISTS `final`.DEPT;
CREATE TABLE `final`.DEPT
(
    `DEPT_ID`   BIGINT       NOT NULL COMMENT '�μ��ڵ�', -- �μ��ڵ�
    `DEPT_NAME` VARCHAR(255) NOT NULL COMMENT '�μ���',   -- �μ���
    PRIMARY KEY (`DEPT_ID`)
) ENGINE = InnoDB COMMENT '�μ�';

-- ���
DROP TABLE IF EXISTS `final`.EMP;
CREATE TABLE `final`.EMP
(
    `EMP_ID`            BIGINT       NOT NULL AUTO_INCREMENT COMMENT '����ڵ�', -- ����ڵ�
    `EMP_DEPT_ID`       BIGINT       NOT NULL COMMENT '�μ��ڵ�',                -- �μ��ڵ�
    `EMP_NAME`          VARCHAR(255) NOT NULL COMMENT '�̸�',                    -- �̸�
    `EMP_EMAIL`         VARCHAR(255) NOT NULL COMMENT '�̸���',                  -- �̸���
    `EMP_PASSWORD`      VARCHAR(255) NOT NULL COMMENT '��й�ȣ',                -- ��й�ȣ
    `EMP_PHONENUMBER`   VARCHAR(255) NOT NULL COMMENT '�޴�����ȣ',              -- �޴�����ȣ
    `EMP_POSITION`      VARCHAR(255) NOT NULL COMMENT '����',                    -- ����
    `EMP_ROLES`         VARCHAR(255) NOT NULL COMMENT '����',                    -- ����
    `EMP_BIRTHDAY`      DATE         NOT NULL COMMENT '�������',                -- �������
    `EMP_STARTDATE`     DATE         NOT NULL COMMENT '�Ի���',                  -- �Ի���
    `EMP_ENDDATE`       DATE NULL COMMENT '�����',                              -- �����
    `EMP_STATUS`        VARCHAR(255) NOT NULL COMMENT '��������',                -- ��������
    `EMP_GENDER`        VARCHAR(255) NOT NULL COMMENT '����',                    -- ����
    `EMP_ADDRESS`       VARCHAR(255) NOT NULL COMMENT '�ּ�',                    -- �ּ�
    `EMP_DETAILADDRESS` VARCHAR(255) NULL COMMENT '���ּ�',                    -- ���ּ�
    PRIMARY KEY (`EMP_ID`)
) ENGINE = InnoDB COMMENT '���' AUTO_INCREMENT = 101;

-- EMP_EMAIL ����ũ Ű �߰�
ALTER TABLE `final`.EMP
    ADD CONSTRAINT `UK_EMP_EMAIL` UNIQUE (`EMP_EMAIL`);

ALTER TABLE `final`.EMP
    ADD CONSTRAINT `FK_EMP_DEPT` FOREIGN KEY (`EMP_DEPT_ID`) REFERENCES `final`.DEPT (`DEPT_ID`);

-- �������
DROP TABLE IF EXISTS `final`.COMPANYSCHEDULE;
CREATE TABLE `final`.COMPANYSCHEDULE
(
    `COMPANYSCHEDULE_ID`      BIGINT       NOT NULL AUTO_INCREMENT COMMENT '�系�����ڵ�', -- �系�����ڵ�
    `COMPANYSCHEDULE_EMP_ID`  BIGINT       NOT NULL COMMENT '����ڵ�',                    -- ����ڵ�
    `COMPANYSCHEDULE_CONTENT` DATE         NOT NULL COMMENT '�系������¥',                -- �系������¥
    `COMPANYSCHEDULE_DATE`    VARCHAR(255) NOT NULL COMMENT '�系��������',                -- �系��������
    PRIMARY KEY (`COMPANYSCHEDULE_ID`)
) ENGINE = InnoDB COMMENT '�系����' AUTO_INCREMENT = 1;

ALTER TABLE `final`.COMPANYSCHEDULE
    ADD CONSTRAINT `FK_COMPANYSCHEDULE_EMP` FOREIGN KEY (`COMPANYSCHEDULE_EMP_ID`) REFERENCES `final`.EMP (`EMP_ID`);


-- �޸�
DROP TABLE IF EXISTS `final`.MEMO;
CREATE TABLE `final`.MEMO
(
    `MEMO_ID`      BIGINT NOT NULL AUTO_INCREMENT COMMENT '�޸��ڵ�', -- �޸��ڵ�
    `MEMO_EMP_ID`  BIGINT NOT NULL COMMENT '����ڵ�',                -- ����ڵ�
    `MEMO_CONTENT` VARCHAR(255) NULL COMMENT '�޸𳻿�',              -- �޸𳻿�
    PRIMARY KEY (`MEMO_ID`)
) ENGINE = InnoDB COMMENT '�޸�' AUTO_INCREMENT = 1;

ALTER TABLE `final`.MEMO
    ADD CONSTRAINT `FK_MEMO_EMP` FOREIGN KEY (`MEMO_EMP_ID`) REFERENCES `final`.EMP (`EMP_ID`);


-- ��������
DROP TABLE IF EXISTS `final`.NOTICE;
CREATE TABLE `final`.NOTICE
(
    `NOTICE_ID`           BIGINT       NOT NULL AUTO_INCREMENT COMMENT '���������ڵ�', -- ���������ڵ�
    `NOTICE_EMP_ID`       BIGINT       NOT NULL COMMENT '����ڵ�',                    -- ����ڵ�
    `NOTICE_SUBJECT`      VARCHAR(255) NOT NULL COMMENT '������������',                -- ������������
    `NOTICE_CONTENT`      LONGTEXT     NOT NULL COMMENT '�������׳���',                -- �������׳���
    `NOTICE_VIEWS`        INT          NOT NULL COMMENT '����������ȸ��',              -- ����������ȸ��
    `NOTICE_CREATEDDATE`  DATETIME     NOT NULL COMMENT '���������ۼ���',              -- ���������ۼ���
    `NOTICE_MODIFIEDDATE` DATETIME NULL COMMENT '�������׼�����',                      -- �������׼�����
    PRIMARY KEY (`NOTICE_ID`)
) ENGINE = InnoDB COMMENT '��������' AUTO_INCREMENT = 1;

ALTER TABLE `final`.NOTICE
    ADD CONSTRAINT `FK_NOTICE_EMP` FOREIGN KEY (`NOTICE_EMP_ID`) REFERENCES `final`.EMP (`EMP_ID`);

-- ������������
DROP TABLE IF EXISTS `final`.NOTICEFILE;
CREATE TABLE `final`.NOTICEFILE
(
    `NOTICEFILE_ID`         BIGINT       NOT NULL AUTO_INCREMENT COMMENT '�������������ڵ�', -- �������������ڵ�
    `NOTICEFILE_NOTICE_ID`  BIGINT       NOT NULL COMMENT '���������ڵ�',                    -- ���������ڵ�
    `NOTICEFILE_NAME`       VARCHAR(255) NOT NULL COMMENT '�������������̸�',                -- �������������̸�
    `NOTICEFILE_ORIGINNAME` VARCHAR(255) NOT NULL COMMENT '�����������Ͽ����̸�',            -- �����������Ͽ����̸�
    `NOTICEFILE_PATH`       VARCHAR(255) NOT NULL COMMENT '�����������ϰ��',                -- �����������ϰ��
    PRIMARY KEY (`NOTICEFILE_ID`)
) ENGINE = InnoDB COMMENT '������������' AUTO_INCREMENT = 1;

ALTER TABLE `final`.NOTICEFILE
    ADD CONSTRAINT `FK_NOTICEFILE_NOTICE` FOREIGN KEY (`NOTICEFILE_NOTICE_ID`) REFERENCES `final`.NOTICE (`NOTICE_ID`);


-- �Խ���
DROP TABLE IF EXISTS `final`.BOARD;
CREATE TABLE `final`.BOARD
(
    `BOARD_ID`           BIGINT       NOT NULL AUTO_INCREMENT COMMENT '�Խ����ڵ�', -- �Խ����ڵ�
    `BOARD_EMP_ID`       BIGINT       NOT NULL COMMENT '����ڵ�',                  -- ����ڵ�
    `BOARD_SUBJECT`      VARCHAR(255) NOT NULL COMMENT '�Խ�������',                -- �Խ�������
    `BOARD_CONTENT`      LONGTEXT     NOT NULL COMMENT '�Խ��ǳ���',                -- �Խ��ǳ���
    `BOARD_VIEWS`        INT          NOT NULL COMMENT '�Խ�����ȸ��',              -- �Խ�����ȸ��
    `BOARD_CREATEDDATE`  DATETIME     NOT NULL COMMENT '�Խ����ۼ���',              -- �Խ����ۼ���
    `BOARD_MODIFIEDDATE` DATETIME NULL COMMENT '�Խ��Ǽ�����',                      -- �Խ��Ǽ�����
    PRIMARY KEY (`BOARD_ID`)
) ENGINE = InnoDB COMMENT '�Խ���' AUTO_INCREMENT = 1;

ALTER TABLE `final`.BOARD
    ADD CONSTRAINT `FK_BOARD_EMP` FOREIGN KEY (`BOARD_EMP_ID`) REFERENCES `final`.EMP (`EMP_ID`);

-- �Խ�������
DROP TABLE IF EXISTS `final`.BOARDFILE;
CREATE TABLE `final`.BOARDFILE
(
    `BOARDFILE_ID`         BIGINT       NOT NULL AUTO_INCREMENT COMMENT '�Խ��������ڵ�', -- �Խ��������ڵ�
    `BOARDFILE_BOARD_ID`   BIGINT       NOT NULL COMMENT '�Խ����ڵ�',                    -- �Խ����ڵ�
    `BOARDFILE_NAME`       VARCHAR(255) NOT NULL COMMENT '�Խ��������̸�',                -- �Խ��������̸�
    `BOARDFILE_ORIGINNAME` VARCHAR(255) NOT NULL COMMENT '�Խ������Ͽ����̸�',            -- �Խ������Ͽ����̸�
    `BOARDFILE_PATH`       VARCHAR(255) NOT NULL COMMENT '�Խ������ϰ��',                -- �Խ������ϰ��
    PRIMARY KEY (`BOARDFILE_ID`)
) ENGINE = InnoDB COMMENT '�Խ�������' AUTO_INCREMENT = 1;

ALTER TABLE `final`.BOARDFILE
    ADD CONSTRAINT `FK_BOARDFILE_BOARD` FOREIGN KEY (`BOARDFILE_BOARD_ID`) REFERENCES `final`.BOARD (`BOARD_ID`);

-- ����
DROP TABLE IF EXISTS `final`.APPROVAL;
CREATE TABLE `final`.APPROVAL
(
    `APPROVAL_ID`               BIGINT       NOT NULL AUTO_INCREMENT COMMENT '�����ڵ�', -- �����ڵ�
    `APPROVAL_EMP_ID`           BIGINT       NOT NULL COMMENT '����ڵ�',                -- ����ڵ�
    `APPROVAL_SUBJECT`          VARCHAR(255) NOT NULL COMMENT '��������',                -- ��������
    `APPROVAL_CONTENT`          VARCHAR(255) NOT NULL COMMENT '���系��',                -- ���系��
    `APPROVAL_CHECK`            VARCHAR(255) NOT NULL COMMENT '�������',                -- �������
    `APPROVAL_CHECKMAN`         VARCHAR(255) NOT NULL COMMENT '���������',              -- ���������
    `APPROVAL_CHECKMANPOSITION` VARCHAR(255) NOT NULL COMMENT '�������������',          -- �������������
    `APPROVAL_UPLOADDATE`       DATETIME     NOT NULL COMMENT '����ø���¥',            -- ����ø���¥
    `APPROVAL_BACKDATE`         DATETIME NULL COMMENT '����ݷ���¥',                    -- ����ݷ���¥
    `APPROVAL_SUCCESSDATE`      DATETIME NULL COMMENT '������γ�¥',                    -- ������γ�¥
    PRIMARY KEY (`APPROVAL_ID`)
) ENGINE = InnoDB COMMENT '����' AUTO_INCREMENT = 1;

ALTER TABLE `final`.APPROVAL
    ADD CONSTRAINT `FK_APPROVAL_EMP` FOREIGN KEY (`APPROVAL_EMP_ID`) REFERENCES `final`.EMP (`EMP_ID`);

-- ��������
DROP TABLE IF EXISTS `final`.APPROVALFILE;
CREATE TABLE `final`.APPROVALFILE
(
    `APPROVALFILE_ID`          BIGINT       NOT NULL AUTO_INCREMENT COMMENT '���������ڵ�', -- ���������ڵ�
    `APPROVALFILE_APPROVAL_ID` BIGINT       NOT NULL COMMENT '�����ڵ�',                    -- �����ڵ�
    `APPROVALFILE_NAME`        VARCHAR(255) NOT NULL COMMENT '���������̸�',                -- ���������̸�
    `APPROVALFILE_ORIGINNAME`  VARCHAR(255) NOT NULL COMMENT '�������Ͽ����̸�',            -- �������Ͽ����̸�
    `APPROVALFILE_PATH`        VARCHAR(255) NOT NULL COMMENT '�������ϰ��',                -- �������ϰ��
    PRIMARY KEY (`APPROVALFILE_ID`)
) ENGINE = InnoDB COMMENT '��������' AUTO_INCREMENT = 1;

ALTER TABLE `final`.APPROVALFILE
    ADD CONSTRAINT `FK_APPROVALFILE_APPROVAL` FOREIGN KEY (`APPROVALFILE_APPROVAL_ID`) REFERENCES `final`.APPROVAL (`APPROVAL_ID`);

-- ����޿�
DROP TABLE IF EXISTS `final`.SALARY;
CREATE TABLE `final`.SALARY
(
    `SALARY_ID`            BIGINT       NOT NULL AUTO_INCREMENT COMMENT '�޿��ڵ�', -- �޿��ڵ�
    `SALARY_EMP_ID`        BIGINT       NOT NULL COMMENT '����ڵ�',                -- ����ڵ�
    `SALARY_AMOUNT`        INT          NOT NULL COMMENT '����',                    -- ����
    `SALARY_PAYDATE`       DATETIME     NOT NULL COMMENT '������',                  -- ������
    `SALARY_PAYMONEY`      INT          NOT NULL COMMENT '���ޱݾ�',                -- ���ޱݾ�
    `SALARY_BANK`          VARCHAR(255) NOT NULL COMMENT '��������',                -- ��������
    `SALARY_ACCOUNTNUMBER` VARCHAR(255) NOT NULL COMMENT '���ް���',                -- ���ް���
    `SALARY_BONUS`         INT NULL COMMENT '���ʽ�',                               -- ���ʽ�
    PRIMARY KEY (`SALARY_ID`)
) ENGINE = InnoDB COMMENT '����޿�' AUTO_INCREMENT = 1;

ALTER TABLE `final`.SALARY
    ADD CONSTRAINT `FK_SALARY_EMP` FOREIGN KEY (`SALARY_EMP_ID`) REFERENCES `final`.EMP (`EMP_ID`);


-- ��� ������ ����
DROP TABLE IF EXISTS `final`.EMPPICTURE;
CREATE TABLE `final`.EMPPICTURE
(
    `EMPPICTURE_ID`         BIGINT       NOT NULL AUTO_INCREMENT COMMENT '��������ʻ����ڵ�', -- ��������ʻ����ڵ�
    `EMPPICTURE_EMP_ID`     BIGINT       NOT NULL COMMENT '����ڵ�',                          -- ����ڵ�
    `EMPPICTURE_NAME`       VARCHAR(255) NOT NULL COMMENT '��������������̸�',                -- ��������������̸�
    `EMPPICTURE_ORIGINNAME` VARCHAR(255) NOT NULL COMMENT '��������ʿ��������̸�',            -- ��������ʿ��������̸�
    `EMPPICTURE_PATH`       VARCHAR(255) NOT NULL COMMENT '������������ϰ��',                -- ������������ϰ��
    PRIMARY KEY (`EMPPICTURE_ID`)
) ENGINE = InnoDB COMMENT '��� ������ ����' AUTO_INCREMENT = 1;

ALTER TABLE `final`.EMPPICTURE
    ADD CONSTRAINT `FK_EMPPICTURE_EMP` FOREIGN KEY (`EMPPICTURE_EMP_ID`) REFERENCES `final`.EMP (`EMP_ID`);

-- �������
DROP TABLE IF EXISTS `final`.LOG;
CREATE TABLE `final`.LOG
(
    `LOG_ID`            BIGINT       NOT NULL AUTO_INCREMENT COMMENT '�����ڵ�', -- �����ڵ�
    `LOG_EMP_ID`        BIGINT       NOT NULL COMMENT '����ڵ�',                -- ����ڵ�
    `LOG_DATE`          DATE         NOT NULL COMMENT '��¥',                    -- ��¥
    `LOG_CHECKIN`       DATETIME NULL COMMENT '��ٽð�',                        -- ��ٽð�
    `LOG_CHECKOUT`      DATETIME NULL COMMENT '��ٽð�',                        -- ��ٽð�
    `LOG_STATUS`        VARCHAR(255) NOT NULL COMMENT '���»���',                -- ���»���
    `LOG_TOTALVACATION` INT          NOT NULL COMMENT '�� �ް�',                 -- �� �ް�
    `LOG_USEDVACATION`  INT          NOT NULL COMMENT '��� �ް�',               -- ��� �ް�
    `LOG_TOTALDAYOFF`   INT          NOT NULL COMMENT '�� ����',                 -- �� ����
    `LOG_USEDDAYOFF`    INT          NOT NULL COMMENT '��� ����',               -- ��� ����
    `LOG_DATEDAYOFF`    DATE NULL COMMENT '���������',                          -- ���������
    PRIMARY KEY (`LOG_ID`)
) ENGINE = InnoDB COMMENT '�������' AUTO_INCREMENT = 1;

ALTER TABLE `final`.LOG
    ADD CONSTRAINT `FK_LOG_EMP` FOREIGN KEY (`LOG_EMP_ID`) REFERENCES `final`.EMP (`EMP_ID`);


-- ���
DROP TABLE IF EXISTS `final`.COMMENT;
CREATE TABLE `final`.COMMENT
(
    `COMMENT_ID`            BIGINT       NOT NULL AUTO_INCREMENT COMMENT '����ڵ�', -- ����ڵ�
    `COMMENT_BOARD_ID`      BIGINT       NOT NULL COMMENT '�Խ����ڵ�',              -- �Խ����ڵ�
    `COMMENT_EMP_ID`        BIGINT       NOT NULL COMMENT '����ڵ�',                -- ����ڵ�
    `COMMENT_COMMENT`       VARCHAR(255) NOT NULL COMMENT '��۳���',                -- ��۳���
    `COMMENT_CREATED_DATE`  DATE         NOT NULL COMMENT '����ۼ���',              -- ����ۼ���
    `COMMENT_MODIFIED_DATE` DATE NULL COMMENT '��ۼ�����',                          -- ��ۼ�����
    PRIMARY KEY (`COMMENT_ID`)
) ENGINE = InnoDB COMMENT '���' AUTO_INCREMENT = 1;

ALTER TABLE `final`.COMMENT
    ADD CONSTRAINT `FK_COMMENT_EMP` FOREIGN KEY (`COMMENT_EMP_ID`) REFERENCES `final`.EMP (`EMP_ID`);

ALTER TABLE `final`.COMMENT
    ADD CONSTRAINT `FK_COMMENT_BOARD` FOREIGN KEY (`COMMENT_BOARD_ID`) REFERENCES `final`.BOARD (`BOARD_ID`);

-- ����
DROP TABLE IF EXISTS `final`.MOVIE;
CREATE TABLE `final`.MOVIE
(
    `MOVIE_ID`         VARCHAR(255) NOT NULL COMMENT '���� �ڵ�', -- ���� �ڵ�
    `MOVIE_KRNAME`     VARCHAR(255) NULL COMMENT '��ȭ��(�ѱ�)',  -- ��ȭ��(�ѱ�)
    `MOVIE_ENNAME`     VARCHAR(255) NULL COMMENT '��ȭ��(����)',  -- ��ȭ��(����)
    `MOVIE_MADEDATE`   DATE NULL COMMENT '���ۿ���',              -- ���ۿ���
    `MOVIE_OPENDATE`   DATE NULL COMMENT '������',                -- ������
    `MOVIE_STATUS`     VARCHAR(255) NULL COMMENT '���ۻ���',      -- ���ۻ���
    `MOVIE_COUNTRY`    VARCHAR(255) NULL COMMENT '���۱���',      -- ���۱���
    `MOVIE_GENRE`      VARCHAR(255) NULL COMMENT '��ȭ�帣',      -- ��ȭ�帣
    `MOVIE_PRODUCER`   VARCHAR(255) NULL COMMENT '���ۻ�',        -- ���ۻ�
    `MOVIE_PRODUCERID` VARCHAR(255) NULL COMMENT '���ۻ��ڵ�',    -- ���ۻ��ڵ�
    PRIMARY KEY (`MOVIE_ID`)
) ENGINE = InnoDB COMMENT '����';

-- ���񽺿���
DROP TABLE IF EXISTS `final`.SERVICEMOVIE;
CREATE TABLE `final`.SERVICEMOVIE
(
    `SERVICEMOVIE_ID`            BIGINT       NOT NULL AUTO_INCREMENT COMMENT '���񽺿����ڵ�', -- ���񽺿����ڵ�
    `SERVICEMOVIE_MOVIE_ID`      VARCHAR(255) NOT NULL COMMENT '���� �ڵ�',                     -- ���� �ڵ�
    `SERVICEMOVIE_AMOUNT`        INT          NOT NULL COMMENT '�ǱǱݾ�',                      -- �ǱǱݾ�
    `SERVICEMOVIE_PAYMENTDATE`   DATETIME     NOT NULL COMMENT '�Ǳǰ�����',                    -- �Ǳǰ�����
    `SERVICEMOVIE_PAYMENTBANK`   VARCHAR(255) NOT NULL COMMENT '��������',                      -- ��������
    `SERVICEMOVIE_ACCOUNTNUMBER` VARCHAR(255) NOT NULL COMMENT '��������',                      -- ��������
    PRIMARY KEY (`SERVICEMOVIE_ID`)
) ENGINE = InnoDB COMMENT '���񽺿���' AUTO_INCREMENT = 1;

ALTER TABLE `final`.SERVICEMOVIE
    ADD CONSTRAINT `FK_SERVICEMOVIE_EMP` FOREIGN KEY (`SERVICEMOVIE_MOVIE_ID`) REFERENCES `final`.MOVIE (`MOVIE_ID`);

-- ȸ��
DROP TABLE IF EXISTS `final`.MEMBER;
CREATE TABLE `final`.MEMBER
(
    `MEMBER_ID`            BIGINT       NOT NULL AUTO_INCREMENT COMMENT 'ȸ���ڵ�', -- ȸ���ڵ�
    `MEMBER_NAME`          VARCHAR(255) NOT NULL COMMENT '�̸�',                    -- �̸�
    `MEMBER_EMAIL`         VARCHAR(255) NOT NULL COMMENT '�̸���',                  -- �̸���
    `MEMBER_PASSWORD`      VARCHAR(255) NOT NULL COMMENT '��й�ȣ',                -- ��й�ȣ
    `MEMBER_PHONENUMBER`   VARCHAR(255) NOT NULL COMMENT '�޴�����ȣ',              -- �޴�����ȣ
    `MEMBER_BIRTHDAY`      DATE         NOT NULL COMMENT '�������',                -- �������
    `MEMBER_RATEPLAN`      VARCHAR(255) NULL COMMENT '�̿�����',                  -- �̿�����
    `MEMBER_PAYMENTPRICE`  INT NULL COMMENT '�����ݾ�',                             -- �����ݾ�
    `MEMBER_PAYMENTDATE`   DATETIME NULL COMMENT '������',                          -- ������
    `MEMBER_PAYMENTBANK`   VARCHAR(255) NULL COMMENT '��������',                    -- ��������
    `MEMBER_ACCOUNTNUMBER` VARCHAR(255) NULL COMMENT '��������',                    -- ��������
    PRIMARY KEY (`MEMBER_ID`)
) ENGINE = InnoDB COMMENT 'ȸ��' AUTO_INCREMENT = 1;