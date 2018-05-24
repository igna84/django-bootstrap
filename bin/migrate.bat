@ECHO OFF

ECHO =============================================================
ECHO =     RUN MIGRATE ON VIRTUAL ENVIRONMENT
ECHO =
ECHO =     AUTHOR : JUHN JONG HO
ECHO =     SINCE : 2018.03.20
ECHO =     SINCE : 2018.05.24
ECHO =============================================================

SET ORDER_STRING=""

:set_order
SET /p ORDER=What environment do you want to run?(1:Migrate, 2:MakeMigrations) : 

IF %ORDER% == 1 (
    SET ORDER_STRING="migrate"
) ELSE IF %ORDER% == 2 (
    SET ORDER_STRING="makemigrations"
)

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
ECHO =============================================================
ECHO = Run on local environment
ECHO =============================================================
python %PROJECT_NAME%\manage.py %ORDER_STRING% --settings=%PROJECT_NAME%.settings.local
GOTO exit

:test
ECHO =============================================================
ECHO = Run on test environment
ECHO =============================================================
python %PROJECT_NAME%\manage.py %ORDER_STRING% --settings=%PROJECT_NAME%.settings.test
GOTO exit

:production
ECHO =============================================================
ECHO = Run on production environment
ECHO =============================================================
python %PROJECT_NAME%\manage.py %ORDER_STRING% --settings=%PROJECT_NAME%.settings.production
GOTO exit

:exit