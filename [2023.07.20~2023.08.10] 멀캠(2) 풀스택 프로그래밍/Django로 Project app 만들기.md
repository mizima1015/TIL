
아래 내용들을 실행하기 전 python 가상 환경을 실행 시켜준다.

## Django 실행

```
django-admin startproject ToDoList
```

## ToDoList 디렉토리로 이동

```
cd ToDoList
```


#### 디렉토리 안을 `ls`  로 확인했을 때 `manage.py`  ,  `ToDoList` 가 존재해야 한다.

```
lsjls@Mizi2 MINGW64 ~/todolist-django/ToDoList (main)
$ ls
manage.py*  ToDoList/
```


여기까지 프로젝트 폴더를 만들었다.


## 이제 어플리케이션을 만들 것이다.

```
python manage.py startapp my_to_do_app
```

*manage.py를 이용해 app을 만들었다.*

이제 ls 를 해보면
```
lsjls@Mizi2 MINGW64 ~/todolist-django/ToDoList (main)
$ ls
manage.py*  my_to_do_app/  ToDoList/
(venv) 
```

앱을 설치를 했으니 앱을 등록시키러 프로젝트로 간다.
프로젝트는 자동으로 앱을 이해할 수 없다.


따라서,
파일 경로 -> [ ToDoList  >  ToDoList  >  settings.py  ] , `settings.py` 파일을 열어본다.
이동해준 뒤 드래그로 내려가다 보면 `Install_apps`  라인이 있을 것이다. 

 ```
INSTALLED_APPS = [

    'django.contrib.admin',

    'django.contrib.auth',

    'django.contrib.contenttypes',

    'django.contrib.sessions',

    'django.contrib.messages',

    'django.contrib.staticfiles',

    'my_to_do_app'
```

라인 맨 아래에 우리가 설치한 app을 추가해 주고 저장한다.
이제 프로젝트 파일은 우리가 설치한 app을 인식할 수 있게 되었다.



아래의 runserver를 실행해주면 위 과정들이 무사히 실행됐는지 확인할 수 있다.

```
lsjls@Mizi2 MINGW64 ~/todolist-django/ToDoList (main)
$ python manage.py runserver
Watching for file changes with StatReloader
Performing system checks...

System check identified no issues (0 silenced).

You have 18 unapplied migration(s). Your project may not work properly until you apply the migrations for app(s): admin, auth, contenttypes, sessions.
Run 'python manage.py migrate' to apply them.
July 26, 2023 - 11:27:35
Django version 4.2.3, using settings 'ToDoList.settings'
Starting development server at http://127.0.0.1:8000/
Quit the server with CTRL-BREAK.

[26/Jul/2023 11:27:48] "GET / HTTP/1.1" 200 10664
Not Found: /favicon.ico
[26/Jul/2023 11:27:48] "GET /favicon.ico HTTP/1.1" 404 2112
```

위의 결과가 나오고 새로운 창으로 위에 적혀있는 서버인  `http://127.0.0.1:8000/` 로 이동 된다면 성공이다. 만일 자동으로 새 창이 뜨지 않는다면, `ctrl + 왼쪽 마우스 클릭`  주소를 클릭해 주면 된다.