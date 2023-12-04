
-- tbl_user Table Create SQL
-- 테이블 생성 SQL - tbl_user
CREATE TABLE tbl_user
(
    `user_id`          VARCHAR(30)      NOT NULL    COMMENT '회원 아이디' CHECK (user_id REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}$'), 
    `user_pw`          VARCHAR(80)      NOT NULL    COMMENT '회원 비밀번호', 
    `user_name`        VARCHAR(40)      NOT NULL    COMMENT '회원 이름', 
    `user_birthdate`   DATE             NOT NULL    COMMENT '회원 생년월일', 
    `user_gender`      CHAR(1)          NOT NULL    COMMENT '회원 성별', 
    `user_height`      DECIMAL(12,1)    NOT NULL    COMMENT '회원 키', 
    `user_weight`      DECIMAL(12,1)    NOT NULL    COMMENT '회원 몸무게', 
    `user_diabetes`    VARCHAR(20)      NOT NULL    COMMENT '회원 당뇨유형', 
    `user_iot_serial`  VARCHAR(30)      NOT NULL    COMMENT '회원 기기시리얼', 
    `user_login_type`  VARCHAR(20)      NOT NULL    COMMENT '회원 로그인유형', 
     PRIMARY KEY (user_id)
);

ALTER TABLE tbl_user COMMENT '회원';

CREATE INDEX IX_tbl_user_1
    ON tbl_user(user_name);


-- tbl_guardian Table Create SQL
-- 테이블 생성 SQL - tbl_guardian
CREATE TABLE tbl_guardian
(
    `user_id`                VARCHAR(30)    NOT NULL    COMMENT '회원 아이디', 
    `guardian_name`          VARCHAR(40)    NOT NULL    COMMENT '보호자 이름', 
    `guardian_phone`         VARCHAR(20)    NOT NULL    COMMENT '보호자 전화번호' CHECK (guardian_phone REGEXP '^010-[0-9]{4}-[0-9]{4}$'), 
    `guardian_relationship`  VARCHAR(20)    NOT NULL    COMMENT '회원과의 관계', 
     PRIMARY KEY (user_id)
);

-- 테이블 Comment 설정 SQL - tbl_guardian
ALTER TABLE tbl_guardian COMMENT '보호자';

-- Unique Index 설정 SQL - tbl_guardian(guardian_phone)
CREATE UNIQUE INDEX UQ_tbl_guardian_1
    ON tbl_guardian(guardian_phone);

-- Foreign Key 설정 SQL - tbl_guardian(user_id) -> tbl_user(user_id)
ALTER TABLE tbl_guardian
    ADD CONSTRAINT FK_tbl_guardian_user_id_tbl_user_user_id FOREIGN KEY (user_id)
        REFERENCES tbl_user (user_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - tbl_guardian(user_id)
-- ALTER TABLE tbl_guardian
-- DROP FOREIGN KEY FK_tbl_guardian_user_id_tbl_user_user_id;


-- tbl_weight Table Create SQL
-- 테이블 생성 SQL - tbl_weight
CREATE TABLE tbl_weight
(
    `weight_idx`  INT UNSIGNED     NOT NULL    AUTO_INCREMENT COMMENT '체중 순번', 
    `user_id`     VARCHAR(30)      NOT NULL    COMMENT '회원 아이디', 
    `created_at`  DATETIME         NOT NULL    DEFAULT CURRENT_TIMESTAMP COMMENT '생성 일자', 
    `weight`      DECIMAL(12,1)    NOT NULL    COMMENT '회원 체중', 
     PRIMARY KEY (weight_idx)
);

-- 테이블 Comment 설정 SQL - tbl_weight
ALTER TABLE tbl_weight COMMENT '체중 관리';

-- Foreign Key 설정 SQL - tbl_weight(user_id) -> tbl_user(user_id)
ALTER TABLE tbl_weight
    ADD CONSTRAINT FK_tbl_weight_user_id_tbl_user_user_id FOREIGN KEY (user_id)
        REFERENCES tbl_user (user_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - tbl_weight(user_id)
-- ALTER TABLE tbl_weight
-- DROP FOREIGN KEY FK_tbl_weight_user_id_tbl_user_user_id;


-- tbl_alarm_msg Table Create SQL
-- 테이블 생성 SQL - tbl_alarm_msg
CREATE TABLE tbl_alarm_msg
(
    `msg_idx`         INT UNSIGNED    NOT NULL    AUTO_INCREMENT COMMENT '메시지 순번', 
    `user_id`         VARCHAR(30)     NOT NULL    COMMENT '회원 아이디', 
    `sended_at`       DATETIME        NOT NULL    DEFAULT CURRENT_TIMESTAMP COMMENT '메시지 발신시간', 
    `msg`             TEXT            NOT NULL    COMMENT '메시지 내용', 
    `guardian_phone`  VARCHAR(20)     NOT NULL    COMMENT '보호자 전화번호', 
     PRIMARY KEY (msg_idx)
);

-- 테이블 Comment 설정 SQL - tbl_alarm_msg
ALTER TABLE tbl_alarm_msg COMMENT '알람 문자 메시지';

-- Foreign Key 설정 SQL - tbl_alarm_msg(user_id) -> tbl_guardian(user_id)
ALTER TABLE tbl_alarm_msg
    ADD CONSTRAINT FK_tbl_alarm_msg_user_id_tbl_guardian_user_id FOREIGN KEY (user_id)
        REFERENCES tbl_guardian (user_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - tbl_alarm_msg(user_id)
-- ALTER TABLE tbl_alarm_msg
-- DROP FOREIGN KEY FK_tbl_alarm_msg_user_id_tbl_guardian_user_id;


-- tbl_diet Table Create SQL
-- 테이블 생성 SQL - tbl_diet
CREATE TABLE tbl_diet
(
    `diet_idx`      INT UNSIGNED     NOT NULL    AUTO_INCREMENT COMMENT '식단 번호', 
    `user_id`       VARCHAR(30)      NOT NULL    COMMENT '회원 아이디', 
    `diet_time`     CHAR(1)          NOT NULL    COMMENT '식사 구분', 
    `diet_content`  TEXT             NOT NULL    COMMENT '식단 구성', 
    `diet_img`      VARCHAR(1000)    NULL        COMMENT '식단 이미지', 
    `created_at`    DATETIME         NOT NULL    DEFAULT CURRENT_TIMESTAMP COMMENT '생성 일자', 
     PRIMARY KEY (diet_idx)
);

-- 테이블 Comment 설정 SQL - tbl_diet
ALTER TABLE tbl_diet COMMENT '식단';

-- Foreign Key 설정 SQL - tbl_diet(user_id) -> tbl_user(user_id)
ALTER TABLE tbl_diet
    ADD CONSTRAINT FK_tbl_diet_user_id_tbl_user_user_id FOREIGN KEY (user_id)
        REFERENCES tbl_user (user_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - tbl_diet(user_id)
-- ALTER TABLE tbl_diet
-- DROP FOREIGN KEY FK_tbl_diet_user_id_tbl_user_user_id;


-- tbl_dose Table Create SQL
-- 테이블 생성 SQL - tbl_dose
CREATE TABLE tbl_dose
(
    `dose_idx`       INT UNSIGNED    NOT NULL    AUTO_INCREMENT COMMENT '복용 순번', 
    `user_id`        VARCHAR(30)     NOT NULL    COMMENT '회원 아이디', 
    `dose_time`      VARCHAR(20)         NOT NULL    COMMENT '복용시간',
	`meal_yn`        CHAR(1)           NOT NULL    COMMENT '식사 여부. 참:''T'', 거짓:''F''',
    `dose_medicine`  VARCHAR(50)     NOT NULL    COMMENT '복용 약물', 
    `dose_amount`    VARCHAR(20)     NOT NULL    COMMENT '복용 량', 
    `medicine_type`  VARCHAR(20)     NULL        COMMENT '약 유형', 
     PRIMARY KEY (dose_idx)
);

-- 테이블 Comment 설정 SQL - tbl_dose
ALTER TABLE tbl_dose COMMENT '약 복용';

-- Foreign Key 설정 SQL - tbl_dose(user_id) -> tbl_user(user_id)
ALTER TABLE tbl_dose
    ADD CONSTRAINT FK_tbl_dose_user_id_tbl_user_user_id FOREIGN KEY (user_id)
        REFERENCES tbl_user (user_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - tbl_dose(user_id)
-- ALTER TABLE tbl_dose
-- DROP FOREIGN KEY FK_tbl_dose_user_id_tbl_user_user_id;


-- tbl_sensor Table Create SQL
-- 테이블 생성 SQL - tbl_sensor
CREATE TABLE tbl_sensor
(
    `sensing_idx`    INT UNSIGNED      NOT NULL    AUTO_INCREMENT COMMENT '데이터 순번', 
    `user_id`        VARCHAR(30)       NOT NULL    COMMENT '회원 아이디', 
    `iot_serial_no`  VARCHAR(30)       NOT NULL    COMMENT '기기 시리얼번호', 
    `created_at`     DATETIME          NOT NULL    COMMENT '측정 시간', 
    `meal_yn`        CHAR(1)           NOT NULL    COMMENT '식사 여부. 참:''T'', 거짓:''F''', 
    `meal_bld`       CHAR(1)           NOT NULL    COMMENT '식사 시간', 
    `hr`             INT               NOT NULL    COMMENT '심박수', 
    `hrv`            INT               NOT NULL    COMMENT '심박변이도', 
    `sdnn`           DECIMAL(30,12)    NOT NULL    COMMENT 'SDNN', 
    `rmssd`          DECIMAL(30,12)    NOT NULL    COMMENT 'RMSSD', 
    `pnn50`          DECIMAL(30,12)    NOT NULL    COMMENT 'PNN50', 
    `vlf`            DECIMAL(30,12)    NOT NULL    COMMENT 'VLF', 
    `lf`             DECIMAL(30,12)    NOT NULL    COMMENT 'LF', 
    `hf`             DECIMAL(30,12)    NOT NULL    COMMENT 'HF', 
    `fr`             DECIMAL(30,12)    NOT NULL    COMMENT 'FrequencyRatio', 
    `bloodsugar`     INT               NOT NULL    COMMENT '혈당', 
     PRIMARY KEY (sensing_idx)
);

-- 테이블 Comment 설정 SQL - tbl_sensor
ALTER TABLE tbl_sensor COMMENT '생체 센서 데이터';

-- Foreign Key 설정 SQL - tbl_sensor(user_id) -> tbl_user(user_id)
ALTER TABLE tbl_sensor
    ADD CONSTRAINT FK_tbl_sensor_user_id_tbl_user_user_id FOREIGN KEY (user_id)
        REFERENCES tbl_user (user_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - tbl_sensor(user_id)
-- ALTER TABLE tbl_sensor
-- DROP FOREIGN KEY FK_tbl_sensor_user_id_tbl_user_user_id;

INSERT INTO tbl_sensor(user_id, iot_serial_no, created_at, meal_yn, meal_bld, hr, hrv, sdnn, rmssd, pnn50, vlf, lf, hf, fr, bloodsugar)
VALUES ('user_id_value', 'iot_serial_no_value', NOW(), 'meal_yn_value', 'meal_bld_value', 
    AES_ENCRYPT('hr_value', 'cellu'), 
    AES_ENCRYPT('hrv_value', 'cellu'),
    AES_ENCRYPT('sdnn_value', 'cellu'), 
    AES_ENCRYPT('rmssd_value', 'cellu'), 
    AES_ENCRYPT('pnn50_value', 'cellu'),
    AES_ENCRYPT('vlf_value', 'cellu'), 
    AES_ENCRYPT('lf_value', 'cellu'), 
    AES_ENCRYPT('hf_value', 'cellu'),
    AES_ENCRYPT('fr_value', 'cellu'), 
    AES_ENCRYPT('bloodsugar_value', 'cellu'));


SELECT user_id, iot_serial_no, created_at, meal_yn, meal_bld, 
    CAST(AES_DECRYPT(hr, 'cellu') AS CHAR) AS hr,
    CAST(AES_DECRYPT(hrv, 'cellu') AS CHAR) AS hrv,
    CAST(AES_DECRYPT(sdnn, 'cellu') AS CHAR) AS sdnn,
    CAST(AES_DECRYPT(rmssd, 'cellu') AS CHAR) AS rmssd,
    CAST(AES_DECRYPT(pnn50, 'cellu') AS CHAR) AS pnn50,
    CAST(AES_DECRYPT(vlf, 'cellu') AS CHAR) AS vlf,
    CAST(AES_DECRYPT(lf, 'cellu') AS CHAR) AS lf,
    CAST(AES_DECRYPT(hf, 'cellu') AS CHAR) AS hf,
    CAST(AES_DECRYPT(fr, 'cellu') AS CHAR) AS fr,
    CAST(AES_DECRYPT(bloodsugar, 'cellu') AS CHAR) AS bloodsugar
FROM tbl_sensor;




