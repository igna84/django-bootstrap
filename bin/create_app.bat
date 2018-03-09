@ECHO OFF
ECHO =============================================================
ECHO =     RUN django-admin ON VIRTUAL ENVIRONMENT
ECHO =
ECHO =     AUTHOR : JUHN JONG HO
ECHO =     SINCE : 2018.03.05
ECHO =============================================================
SET PROJECT_NAME=

IF "%1" == "" (
    GOTO projectname_pos
) ELSE (
    PROJECT_NAME=%1
    GOTO appname_pos
) 

:projectname_pos
SET /p PROJECT_NAME=������Ʈ���� �Է��ϼ��� : 

IF "%PROJECT_NAME%" == "" (
    GOTO projectname_pos
) 

:appname_pos
SET /p APP_NAME=�� �̸��� �Է��ϼ��� : 

IF "%APP_NAME%" == "" (
    GOTO appname_pos
)

ECHO =============================================================
ECHO =     Run django-admin create app "%APP_NAME%"
ECHO =============================================================
REM ���̽� ����ȯ�� ����
CALL .\env\Scripts\activate.bat

REM django-admin �������� ���ø����̼� ����
cd %PROJECT_NAME%\%PROJECT_NAME%\apps
django-admin startapp %APP_NAME%

ECHO =============================================================
ECHO =     create app "%APP_NAME%" Complete.
ECHO =============================================================