@ECHO OFF

ECHO =============================================================
ECHO =     RUN VIRTUAL ENVIRONMENT
ECHO =
ECHO =     AUTHOR : JUHN JONG HO
ECHO =     SINCE : 2018.03.05
ECHO =============================================================
:projectname_pos
SET /p PROJECT_NAME=실행할 프로젝트명을 입력하세요 : 
IF "%PROJECT_NAME%" == "" (
    ECHO 프로젝트명을 반드시 입력해야합니다.
    GOTO projectname_pos
)

:environment_pos
SET /p ENVIRONMENT=어떤환경으로 실행할까요?(l:Local, t:Test, p:Production) : 

IF "%ENVIRONMENT%" == "" (
    ECHO 어떤 환경에서 실행할지 반드시 선택해야합니다.
    GOTO environment_pos
)

CALL env\Scripts\activate.bat

IF /i %ENVIRONMENT% == "l" (GOTO lcoal)
IF /i %ENVIRONMENT% == "local" (GOTO local)
IF /i %ENVIRONMENT% == "t" (GOTO test)
IF /i %ENVIRONMENT% == "test" (GOTO test)
IF /i %ENVIRONMENT% == "p" (GOTO production)
IF /i %ENVIRONMENT% == "production" (GOTO production)

:local
python %PROJECT_NAME%\manage.py runserver --settings=%PROJECT_NAME%.settings.local

:test
python %PROJECT_NAME%\manage.py runserver --settings=%PROJECT_NAME%.settings.test

:production
python %PROJECT_NAME%\manage.py runserver --settings=%PROJECT_NAME%.settings.production

:exit