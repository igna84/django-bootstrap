@ECHO OFF
ECHO =============================================================
ECHO =     RUN django-admin ON VIRTUAL ENVIRONMENT
ECHO =
ECHO =     AUTHOR : JUHN JONG HO
ECHO =     SINCE : 2018.03.05
ECHO =============================================================

:project_pos
SET /p PROJECT_NAME=프로젝트명을 입력하세요 : 

IF %PROJECT_NAME% == "" (
    ECHO 프로젝트명은 반드시 입력해야합니다.
    GOTO project_pos
)

SET SETTINGS=%PROJECT_NAME%\settings
SET APPS=%PROJECT_NAME%\apps

ECHO =============================================================
ECHO =     1. Run django-admin create app %APP_NAME%
ECHO =============================================================

CALL .\env\Scripts\activate.bat & django-admin startproject %PROJECT_NAME%

ECHO =============================================================
ECHO =     2. CREATE SETTINGS FOLDER
ECHO =============================================================

mkdir %PROJECT_NAME%\%SETTINGS%
del %PROJECT_NAME%\%PROJECT_NAME%\settings.py
mkdir %PROJECT_NAME%\%APPS%

ECHO =============================================================
ECHO =     3. CREATE SETTINGS FILES
ECHO =============================================================
type NUL > %PROJECT_NAME%\%SETTINGS%\__init__.py
xcopy default_settings\*.* %PROJECT_NAME%\%SETTINGS%\ /e /h /k
ECHO =============================================================
ECHO =     create project "%PROJECT_NAME%" Complete.
ECHO =============================================================
