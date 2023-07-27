

이어서 진행

어떤 때 get , post를 쓰는지 ?

post는 기존 데이터에서 추가, 삭제, 변경이 있을 경우에 사용한다
그 외에는 get을 사용

```
<form action = " " method="POST">{% csrf_token %}
```
[my_to_do_app > templates > my_to_do_app > index.html] 파일을 수정한다.
POST 형식을 사용 

~을 처리해 주세요 라는 의미
처리를 하기 위해선 views.py로 이동한다.

{}안의 내용은 jinja template이다.
django는 외부 데이터를 끌고 올 때 {}내용을 사용한다.


```
        <div class="content">

            <div class="messageDiv">

                <form action="./createTodo" method="POST">{% csrf_token %}

                    <div class="input-group">

                        <input id="todoContent" name="todoContent" type="text" class="form-control" placeholder="메모할 내용을 적어주세요">

                        <span class="input-group-btn">

                            <button class="btn btn-default" type="submit">메모하기!</button>
```

index.html 파일에 `input id` 부분을 수정해 준다.

```
# -*- coding:utf-8 -*-

  

from django.urls import path

from . import views

  

urlpatterns = [

    path('', views.index),

    path('createTodo', views.createTodo)

]
```

[my_to_do_app > urls.py] 에 path를 추가해 준다.

```
# after

def index(request):

    return render(request, "my_to_do_app/index.html")

  

def createTodo(request):

    user_input_str = request.POST['todoContent']

    print("todoContent: " + user_input_str)

    return HttpResponse("create ToDo를 하자 ! ==> " + user_input_str)
```

[my_to_do_app > views.py] 에 path로 추가한 createTodo를 정의해 준다.

***일련의 모든 로직 함수를 이용해 처리를 한다라는 느낌이 들면 다 `views.py`에서 해결한다고 생각하면 된다.*

여기까지 진행했다면, `python manage.py runserver`를 실행 했을 때 뜨는 페이지에서
글을 입력하고 확인을 누르면 그 글이 뜨는 것을 확인 할 수 있을 것이다.

여기까지는 데이터를 입력 받으면 입력 받은 내용을 출력만 하고 저장을 안했다.

이제 입력했던 데이터를 DB에 저장까지 하도록 만들어 보자.


```
from django.shortcuts import render

from django.http import HttpResponse

from .models import *

'''

models.py에 있는 것을 다 가져온다.
DB에서 넘어오든 어디서 넘어오든 다 view.py에서 해결 할 수 있도록 설정

'''

  

# Create your views here.

  

'''

def index(request):

    return HttpResponse("나의 첫번째 페이지")

'''

  

# after

def index(request):

    return render(request, "my_to_do_app/index.html")

  

def createTodo(request):

    user_input_str = request.POST['todoContent']

    print("todoContent: " + user_input_str)

  

    # DB에 저장

    new_todo = Todo(content = user_input_str)

    new_todo.save()

    return HttpResponse("create ToDo를 하자 ! ==> " + user_input_str)
```

[my_to_do_app > views.py] 파일에 맨 위 단락에 `from .models import *`를 추가해준다.
그리고 아래에 # DB에 저장 부분을 입력해준다.

저장 후 다시 runsever를 실행 해 글을 입력한 후

터미널로 돌아와 dbshell에서 확인해 보면

```
lsjls@Mizi2 MINGW64 ~/mult28/todolist-django/ToDoList (main)
$ python manage.py dbshell
SQLite version 3.42.0 2023-05-16 12:36:15
Enter ".help" for usage hints.
sqlite> .tables
auth_group                  django_admin_log
auth_group_permissions      django_content_type
auth_permission             django_migrations
auth_user                   django_session
auth_user_groups            my_to_do_app_todo
auth_user_user_permissions
sqlite> SELECT * FROM my_to_do_app_todo;
1|dasdf
2|오늘 할일 todo llist 만드릭
3|오늘 할일 todo list 만들기
sqlite>
```

위와 같이 입력했던 내용들이 저장된 것을 확인 할 수 있다.

혹시 안된다면 db를 날리고 다시 해보자. 
db를 날리는 명령어는?


## 작성 후, 메인 페이지로 다시 돌아오기! + 목록을 메인 페이지에 다시 보여주기!
>urls.py 수정
  views.py 수정


urls.py 수정
```
urlpatterns = [

    path('', views.index, name='index'),

    path('createTodo', views.createTodo, name="createTodo")

]
```

url 패턴을 정의해 준다.



views.py 수정

```
from django.shortcuts import render

from django.http import HttpResponse, HttpResponseRedirect

from django.urls import reverse

from .models import *

'''

models.py에 있는 것을 다 가져온다.

'''

  

# Create your views here.

  

'''

def index(request):

    return HttpResponse("나의 첫번째 페이지")

'''

  

# after

def index(request):

    # 로직 처리 구현

    todos = Todo.objects.all() # DB에 저장된 내용 모두 불러오기

    content = {'todos' : todos}

    return render(request, "my_to_do_app/index.html")

  

def createTodo(request):

    user_input_str = request.POST['todoContent']

    print("todoContent: " + user_input_str)

  

    # DB에 저장

    new_todo = Todo(content = user_input_str)

    new_todo.save()

    # return HttpResponse("create ToDo를 하자 ! ==> " + user_input_str)

    return HttpResponseRedirect(reverse('index')) 
    # 메모하기 버튼을 누르면 메인페이지가 나오게 끔
```

index.html 파일 수정
```
            <div class="toDoDiv">

                <ul class="list-group">

                    {% for todo in todos %}

                    <form action="" method="GET">

                        <div class="input-group" name='todo1'>

                            <li class="list-group-item">{{ todo.content }}</li>

                            <input type="hidden" id="todoNum" name="todoNum" value="{{ todo.id }}"></input>

                            <span class="input-group-addon">

                                <button type="submit" class="custom-btn btn btn-danger">완료</button>

                            </span>

                        </div>

                    </form>

                    {% endfor %}

                </ul>

            </div>

        </div>
```

---


### 저장된 목록을 지울 수 있게 만들기


html 파일 수정
```
                    {% for todo in todos %}

                    <form action="./deleteTodo" method="GET">

                        <div class="input-group" name='todo1'>

                            <li class="list-group-item">{{ todo.content }}</li>

                            <input type="hidden" id="todoNum" name="todoNum" value="{{ todo.id }}"></input>

                            <span class="input-group-addon">

                                <button type="submit" class="custom-btn btn btn-danger">완료</button>

                            </span>

                        </div>

                    </form>

                    {% endfor %}
```


url 파일 수정
```
  

from django.urls import path

from . import views

  

urlpatterns = [

    path('', views.index, name='index'),

    path('createTodo', views.createTodo, name='createTodo'),

    path('deleteTodo', views.deleteTodo, name='deleteTodo')

]
```


views 파일 수정
```
  

def deleteTodo(request):

    delete_todo_id = request.GET['todoNum']

    print("삭제할 Todo의 ID", delete_todo_id)

    todo = Todo.objects.get(id = delete_todo_id)

    todo.delete()

    return HttpResponseRedirect(reverse('index'))
```