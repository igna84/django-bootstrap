# django-bootstrap
윈도우즈 10 운영체제에서 Visual Studio Code에서 장고 프로젝트를 생성하는 부트스트랩 프로젝트입니다.
이용시 주의할 내용은 아래와 같습니다.

* 이 프로젝트는 Sqlite3가 아닌 MySQL이 기본 Database로 설정되어있습니다.
* 정상적인 작업실행을 위해서는 Visual Studio Code의 터미널 설정이 "cmd"로 되어있어야합니다.(※PowerShell인경우 정상적으로 동작안함)

## 프로젝트 설명 블로그 포스팅
URL : [http://blog.thereis.xyz/37](http://blog.thereis.xyz/37)

## 각 디렉토리 설명
### .vscode\task.json
Visual Studio Code의 작업목록을 셋팅해둔 작업 파일입니다. 설정된 작업 목록은 아래와 같습니다.

* Create ENV : 가상환경을 만들어줍니다.
* Initialized For Local : 로컬 개발환경에 맞는 라이브러리 인스톨을 실행합니다.(pip install)
* Initialized For Test : 테스트 개발환경에 맞는 라이브러리 인스톨을 실행합니다.(pip install)
* Initialized For Production : 배포 개발환경에 맞는 라이브러리 인스톨을 실행합니다.(pip install)
* Run server : Django 서버를 실행합니다.
* Create Project : Django의 프로젝트를 생성합니다.
* Create App : Django 앱을 생성합니다.
* Create Superuser : SuperUser를 생성합니다.
* Migrate : Migrate/MakeMigration 명령을 실행합니다. 

### default_settings
프로젝트 생성할때 복사되는 기본 셋팅 파일들입니다.

* base.py : 모든 설정들에 공통으로 적용되는 설정을 담아둔 setting 파일입니다. 다른 설정들은 이 설정을 상속받아 동작합니다.
* local.py : 로컬환경에 적용하는 설정파일입니다. Debug 설정이 기본으로 적용되어 있습니다.
* test.py : 테스트 환경에 적용하는 설정파일입니다. Debug 설정이 기본으로 적용되어 있습니다.
* production.py : 배포환경에 적용하는 설정파일입니다. Debug 설정이 안되어 있습니다.

### bin
프로젝트와 관련된 명령들이 저장되어있는 디렉토리입니다.

* create_env.bat : 가상환경을 만들어주는 명령입니다.
```
C:\project_folder> bin\create_env.bat
```

* create_activate.bat : 가상환경을 실행해주는 명령입니다.
```
C:\project_folder> bin\env_activate.bat
```

* create_project.bat : Django 프로젝트를 만들어주는 명령입니다.
```
C:\project_folder> bin\create_project.bat
```
* gen_base_setting.py : create_project.bat을 실행할 때 base 셋팅파일 생성하는 클래스 모듈입니다.

* create_app.bat : Django 앱을 만들어주는 명령입니다.
```
C:\project_folder> bin\create_app.bat
```

* run_server.bat : Django 서버를 실행하는 명령입니다.
```
C:\project_folder> bin\run_server.bat
```
* create_superuser.bat : Superuser를 생성하는 명령입니다.
```
C:\project_folder> bin\create_superuser.bat
```
* migrate.bat : migrate / makemigrations 명령을 실행하는 명령입니다.
```
C:\project_folder> bin\migrate.bat
```

### requirements
프로젝트에 필요한 라이브러리 목록을 저장해둔 디렉토리입니다.

* base.text : 모든 설정들에 공통으로 적용되는 라이브러리 목록을 담아둔 텍스트 파일입니다. 다른 설정들은 이 설정을 상속받아 동작합니다.
* local.text : 로컬환경에 적용하는 라이브러리 목록파일입니다.
* test.text : 테스트환경에 적용하는 라이브러리 목록파일입니다.
* production.text : 배포환경에 적용하는 라이브러리 목록파일입니다.
