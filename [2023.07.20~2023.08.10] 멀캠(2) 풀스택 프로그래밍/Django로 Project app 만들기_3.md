

### 다음과 같이 폴더와 파일을 생성해 준다.
[my_to_do_app > templates (폴더 생성) >  my_to_do_app(폴더 생성) >  index.html(파일 생성)]


(app이 여러 개가 생기면 구분해주기 위해 templates 폴더 아래에 my_to_do_app 폴더를 추가로 만들어 관리한다.)



### *이제 runserver를 했을 때 index.html 파일을 이용해 새 창을 만들 수 있게 해볼 것이다.*

templates를 관리하기 위해서 `views.py`로 이동한다.

```
from django.shortcuts import render

from django.http import HttpResponse

  

# Create your views here.

  

'''

def index(request):

    return HttpResponse("나의 첫번째 페이지")

''' -> 주석으로 처리해 실행하지 않도록 만들었다.

  

# after

def index(request):

    return render(request, "my_to_do_app/index.html")
```

views의 내용을 위와 같이 변경해 준다.


여기까지 MCV에서 C와 V를 진행한것?

runserver를 이용해 지금까지 결과를 확인해 주자.



## 이제 모델을 만들어 줄것이다.
>결과물에 봤을 때 우리가 메모를 적어 넣고 그것이 저장됐을 때 아래에 저장된 문구가 뜨게 하는 것.

Models.py 파일을 열어 준다.
[ToDoList  >  my_to_do_app  >  models.py]

```
from django.db import models

  

# Create your models here.

  

class Todo(models.Model):

    content = models.CharField(max_length=255)
```
위의 내용을 작성해 준다.

장고의 라이브러리에서 모든 class를 상속 받고 사용한다.
그러므로 CharField 함수를 사용가능



```
lsjls@Mizi2 MINGW64 ~/todolist-django/ToDoList (main)
$ python manage.py makemigrations
Migrations for 'my_to_do_app':
  my_to_do_app\migrations\0001_initial.py
    - Create model Todo
(venv) 
lsjls@Mizi2 MINGW64 ~/todolist-django/ToDoList (main)
$ python manage.py migrate
Operations to perform:
  Apply all migrations: admin, auth, contenttypes, my_to_do_app, sessions
Running migrations:
  Applying contenttypes.0001_initial... OK
  Applying auth.0001_initial... OK
  Applying admin.0001_initial... OK
  Applying admin.0002_logentry_remove_auto_add... OK
  Applying admin.0003_logentry_add_action_flag_choices... OK
  Applying contenttypes.0002_remove_content_type_name... OK
  Applying auth.0002_alter_permission_name_max_length... OK
  Applying auth.0003_alter_user_email_max_length... OK
  Applying auth.0004_alter_user_username_opts... OK
  Applying auth.0005_alter_user_last_login_null... OK
  Applying auth.0006_require_contenttypes_0002... OK
  Applying auth.0007_alter_validators_add_error_messages... OK
  Applying auth.0008_alter_user_username_max_length... OK
  Applying auth.0009_alter_user_last_name_max_length... OK
  Applying auth.0010_alter_group_name_max_length... OK
  Applying auth.0011_update_proxy_permissions... OK
  Applying auth.0012_alter_user_first_name_max_length... OK
  Applying my_to_do_app.0001_initial... OK
  Applying sessions.0001_initial... OK
(venv) 
```
위 명령어 두 개를 실행한다.



## MVC 흐름)

model - controller - view
models.py - views.py - templates
						\\     user      /

views.py -> index , DB

models.py와 templates는 Django에서 제공해 주는 세팅 기능이다.
우리가 주로 보고 코드를 짜야 할 곳은 views.py (controller)다.

views.py에서 하는 역할  = create, read, update, delete


```
lsjls@Mizi2 MINGW64 ~/todolist-django/ToDoList (main)
$ python manage.py dbshell
CommandError: You appear not to have the 'sqlite3' program installed or on your path.
(venv) 

```

다음 명령어를 실행하는데 나는 다음과 같은 *error가 나왔다. sqlite3가 설치 되어있지 않다고 하니 다운을 받아 주도록 하자.

https://www.sqlite.org/download.html -> 다운받는 페이지 여기서 windows용 64bit을 다운 받았다.

다운 받은 폴더를 압축 해제해 ToDoList 폴더에 넣어 주면 해결된다.



>이제 아래 명령어들을 하나씩 해보자

```
lsjls@Mizi2 MINGW64 ~/todolist-django/ToDoList (main) 
$ python manage.py dbshell
SQLite version 3.42.0 2023-05-16 12:36:15
Enter ".help" for usage hints. 
```


```
sqlite> .tables
auth_group                  django_admin_log
auth_group_permissions      django_content_type       
auth_permission             django_migrations
auth_user                   django_session
auth_user_groups            my_to_do_app_todo
auth_user_user_permissions
```


```
sqlite> PRAGMA table_info(my_to_do_app_todo);   
0|id|INTEGER|1||1
1|content|varchar(255)|1||0 
```

```
sqlite> SELECT * FROM my_to_do_app_todo; 
```

여기까지 models를 지정한 것이다.