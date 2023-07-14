# Git

분산버전관리시스템

## SCM & VCS

* SCM(Source Code Management) : (소스) 코드 관리 도구
* VCS(Version Control Sysytem) : 버전 관리도구
* DVCS(Distributed Version Control Sysytem) : 분산 버전 관리 도구



## Git 명령어

> 프로젝트(폴더) 기반 코드 관리 도구



### git inint

Git으로 특정 폴더(프로젝트) 관리시작

``` $ git init
$ git init
Initialized empty Git repository in C:/Users/lsjls/intro/.git/
```

git 프로그램 파일이 생기는데 .git으로 만들어져 숨겨진 파일로 만들어진다.

숨겨진 파일을 볼때는 ` ls -a ` 사용



* git으로 프로젝트 중단 `rm -r .git`
  * 디렉토리를 지워버리면 된다.



## git status

> Git의 상태 출력

``` 
$ git status
On branch master -> master라는 branch에 있음

No commits yet -> 아직 commit 없음

nothing to commit (create/copy files and use "git add" to track) -> commit 할 것도 없음
```



* touch a.txt 파일 추가후 , git status

```
On branch master

No commits yet

Untracked files: -> 추적되지 않은 파일들이 있음
  (use "git add <file>..." to include in what will be committed) 
  ->commit 하려면 add 해야함
        a.txt

nothing added to commit but untracked files present (use "git add" to track) -> commit 하기 위한 파일이 추가되지 않았음, 그러나 추적되지 않은 파일이 존재함
```

* `git add a.txt` 후 `git status`

```
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
        new file:   a.txt
```

* `git rm --cached a.txt`  후 `git status`

```
$ git rm --cached a.txt
rm 'a.txt'

$ git status
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        a.txt

nothing added to commit but untracked files present (use "git add" to track)
```

이전 상태로 돌아오는 것을 볼 수 있다.





###  git add [파일/폴더]

### git rm --cached [파일/폴더]

---



### git commit -m " 커밋 메시지 "



### git conifg

git 설정 관련 명령어

* 최초 commit 실행시

```

$ git commit -m "First commit"
Author identity unknown -> 작자 미상

*** Please tell me who you are. -> 당신이 누군지 알려주세요

Run

  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"

to set your account's default identity.
Omit --global to set the identity only in this repository.

fatal: unable to auto-detect email address (got 'lsjls@Mizi2.(none)')

```

* git config --global user.email [나의 이메일] : 이메일 설정
* git config --global user.name [나의 이름] : 이름 설정



***commit은 특정 시점에 사진을 찍는것***

git commit -m "First commit"

```
$ git commit -m "First commit"
[master (root-commit) e312264] First commit
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 a.txt
```

log 확인

```
$ git log
commit e3122645d4cd542cb2453f94c4b8812e9901268e (HEAD -> master)
Author: Mizima <mizimaaz@gmail.com>
Date:   Thu Jul 13 15:50:15 2023 +0900

    First commit
```



b.txt를 추가하고, `git commit -m "Add b.txt"` 를 한 뒤 log 확인

```
$ git log
commit de0de900faff34d931e405291942223b8fc8fe14 (HEAD -> master)
Author: Mizima <mizimaaz@gmail.com>
Date:   Thu Jul 13 15:54:16 2023 +0900

    Add b.txt

commit e3122645d4cd542cb2453f94c4b8812e9901268e
Author: Mizima <mizimaaz@gmail.com>
Date:   Thu Jul 13 15:50:15 2023 +0900

    First commit
```



`git log --oneline`을 통해 log를 간단히 볼 수 있다.

```
$ git log --oneline
de0de90 (HEAD -> master) Add b.txt
e312264 First commit
```



git checkout master

이를 코드를 이전버전으로 돌리는 것도 가능



# 내 github 주소를 이용해 원격 저장소 만들기

```
$ git remote add origin https://github.com/mizima1015/intro.git
-> 내 git 주소 이용

$ git remote
origin
-> remote 상태 확인

$ git remote -v
origin  https://github.com/mizima1015/intro.git (fetch)
origin  https://github.com/mizima1015/intro.git (push)
-> 자세히 확인

$ git remote remove
-> remote를 지울때? 

$ git push origin master
-> github로 push
```

이후 github에 들어가 보면 code에 파일들이 생긴 것을 확인 할 수 있다.

git은 00을 기준으로 프로젝트를 관리한다. (디렉토리 or 폴더)

---



추가적으로 파일을 만들거나 수정 후 다시 push 할 때는 이미 origin이라는 remote를 생성하였으므로 `add` `commit` `push` 만 진행해 주면 된다.