-- 비밀번호 변경 --
ALTER USER system IDENTIFIED BY 54321;

-- 비밀번호 유효기간 - 180일 --
SELECT * FROM dba_profiles WHERE profile='DEFAULT' and resource_name='PASSWORD_LIFE_TIME';

