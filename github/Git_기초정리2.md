# Git 협업

협업 할때 Home 폴더로 우선 이동 `cd ~`

팀장의 github에 프로젝트를 복제하여 가져온다.

```
git clone [받아올 주소] [파일명 지정]
```

파일명을 잘못 가져왔을 때, 이름 바꿀 때 mv로 되는지 확인해 보자



clone을 할 경우 복제해온 곳의 remote가 자동으로 되어있다.

따라서 따로 할 필요는 없다.

```
$ git remote
origin
```



## push를 해주기 위해선 팀장이 해줘야 하는 것

 해당 프로젝트에 들어가서 제일 오른쪽에 setting -> collaborators -> add people

![git 팀장](C:\Users\lsjls\OneDrive\바탕 화면\git 팀장.jpg)

위 과정을 해줘야 팀원이 push 명령어를 사용할 수 있게 된다.



---

이제 팀장이 받아오는 명령어

git pull origin master를 본인의 practice 폴더에서 해주면된다.

```
$ git pull origin master
```

이후 과정은 touch를 통해 파일을 만들고 add, commit , push를 해주는 과정까지 이전과 같다.

```
$ touch b.txt

$ git add b.txt

$ git commit -m "add.b"
[master 538798d] add.b
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 b.txt
 
$ git push origin master
Enumerating objects: 3, done.
Counting objects: 100% (3/3), done.
Delta compression using up to 16 threads
Compressing objects: 100% (2/2), done.
Writing objects: 100% (2/2), 226 bytes | 226.00 KiB/s, done.
Total 2 (delta 0), reused 0 (delta 0), pack-reused 0
To https://github.com/mizima1015/intro.git
   9ac8445..538798d  master -> master
```

이제 변경사항이 github에 저장되었으니 다시 팀원이 받을 때도 pull을 사용해 주면 된다.