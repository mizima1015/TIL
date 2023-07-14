# 하나의 파일로 다른 사람과 협업을 해보자



> 우선 팀장은 시작전에 github에서 wordchain이라는 Repositories를 만들어 준 뒤 팀원을 초대해 주자



## 팀장부터 시작

1. git으로 Home에 새로운 폴더를 만들어준 뒤 `git init` 으로 git을 시작해 준다.

   > github에서는 readme 파일은 바로 미리보기를 할 수 있게 만들어져 있다.

```
$ mkdir wordchain
```

2. git init으로 git을 실행시켜준다.

```
$ git init
Initialized empty Git repository in C:/Users/lsjls/wordchain/.git/
```

3. vs code를 열어준다.

vs code는 git에서 `code .`을 이용해 켤 수 있다.

```
$ code .
```

4. vs code 내에서 파일을 새로 만들고 파일 이름을 README.me로 만들어준다.

   

5. 이후 아래에 터미널을 열어 git bash로 설정



6. 해당 파일을 `git add` `git commint``git remote add origin [주소]` `git push`

   순서대로 진행해 준다.

```gitbash
$ git add README.md

$ git commit -m "add 침구류"
[master 27911c9] add 침구류
 1 file changed, 2 insertions(+), 1 deletion(-)
 
$ git remote add origin https://github.com/mizima1015/wordchain.git
 
$ git remote  #remote 상태 확인
origin

$ git push origin master
```

 

## 팀원

1. 팀원은 git에서 `clone`을 통해 복사해 준 뒤 

   ```
   git clone [받아올 주소] [파일명 지정]
   ```

   

2. 폴더 안으로 들어가  `code .` 으로 vs code를 열어 사용



3. 파일을 수정한 뒤 ***vs code 상에서 저장***



4.  `git add [파일이름]` `git commit -m "설명추가"` `git push` 순서로 쭉 진행해 주면된다.



5. 이후 팀장은 vs code에서 `git pull`을 이용해 파일을 다시 받아 들인 뒤 이후는 반복작업이다.