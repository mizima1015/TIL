
## (1) [ToDoList > ToDoList > urls.py]

ToDoList에 urls.py 파일을 열고 맨 아래로 내려가서 아래와 같이 수정해 준다.

```
from django.contrib import admin

from django.urls import path, include

  

urlpatterns = [

    path('admin/', admin.site.urls),

    path('', include('my_to_do_app.urls'))
```

메인 홈페이지를 들어가면 어디로 갈지 지정해준 것, '' 블랭크로 설정하면 메인 화면이라는 뜻이다.


## (2) [ToDoList > my_to_do_app > urls.py 생성]

windows : 한글폰트 인코딩 cp949, euc-kr
mac/Linux : 한글폰트 xx 
한글 폰트가 달라 깨질 수 있다.
따라서 urls.py를 처음 만들 때는 맨 위에
[\# -\*- coding : utf-8 -\*- ]을 입력해 줘야 한다. 이후 아래 내용을 채워준다.

```
# -*- coding:utf-8 -*-

  

from django.urls import path

from . import views

  

urlpatterns = [

    path('', views.index) 

]
```

`ToDoList 의 urls.py  >  my_to_do_app 의 urls.py  >  views.index`
이렇게 순차적으로 이동


일반적으로 웹사이트는 MVC 패턴을 따른다. 

urls의 역할은 다양한 링크들을 전달만 해주는 것이다.(사이트가 커질수록 링크가 늘어난다.)

각각의 기능들이 있는데 맞게 통과시켜준다

## (3) [ToDoList > my_to_do_app > views.py : index 생성]

```
from django.shortcuts import render

from django.http import HttpResponse

  

# Create your views here.

def index(request):

    return HttpResponse("나의 첫번째 페이지")
```

이 내용을 넣고 저장한다. 
여기서 (request)는 django에서 defalt로 들어가는 것이다.


### 페이지 확인

```
lsjls@Mizi2 MINGW64 ~/todolist-django/ToDoList (main)
$ python manage.py runserver
Watching for file changes with StatReloader
Performing system checks...

System check identified no issues (0 silenced).

You have 18 unapplied migration(s). Your project may not work properly until you apply the migrations for app(s): admin, auth, contenttypes, sessions.
Run 'python manage.py migrate' to apply them.
July 26, 2023 - 13:41:53
Django version 4.2.3, using settings 'ToDoList.settings'
Starting development server at http://127.0.0.1:8000/
Quit the server with CTRL-BREAK.

[26/Jul/2023 13:41:56] "GET / HTTP/1.1" 200 26
```
`runserver`를 이용해 page의 모습이 확인 가능하다.
