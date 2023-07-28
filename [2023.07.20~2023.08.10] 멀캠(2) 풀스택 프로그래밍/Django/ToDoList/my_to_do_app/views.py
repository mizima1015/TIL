from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.urls import reverse
from .models import *
'''
models.py에 있는 것을 다 가져온다. (모든 리소스), DB에서 넘어오든 어디서 넘어오든 다 view.py에서 해결 할 수 있도록 설정
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
    print("From DB: ", todos) # error 생길 때 확인용
    content = {'todos' : todos} # todos를 키 값으로 설정
    return render(request, 'my_to_do_app/index.html', content)


def createTodo(request):
    user_input_str = request.POST['todoContent']
    print("todoContent: " + user_input_str)

    # DB에 저장
    new_todo = Todo(content = user_input_str)
    new_todo.save()

    # return HttpResponse("create ToDo를 하자! ==> " + user_input_str)
    return HttpResponseRedirect(reverse('index'))
    # 메모하기 버튼을 누르면 메인페이지가 나오게 끔


def deleteTodo(request):
    delete_todo_id = request.GET['todoNum']
    print("삭제할 Todo의 ID", delete_todo_id)
    todo = Todo.objects.get(id = delete_todo_id)
    todo.delete()
    return HttpResponseRedirect(reverse('index'))