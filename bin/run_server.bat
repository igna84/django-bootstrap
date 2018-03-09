@ECHO OFF

ECHO =============================================================
ECHO =     RUN VIRTUAL ENVIRONMENT
ECHO =
ECHO =     AUTHOR : JUHN JONG HO
ECHO =     SINCE : 2018.03.05
ECHO =============================================================
:projectname_pos
SET /p PROJECT_NAME=Please enter project name : 
IF "%PROJECT_NAME%" == "" (
    ECHO Project name must be entered.
    GOTO projectname_pos
)

:environment_pos
SET /p ENVIRONMENT=What environment do you want to run?(l:Local, t:Test, p:Production) : 

IF "%ENVIRONMENT%" == "" (
    ECHO You must choose which environment you want to run in.
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