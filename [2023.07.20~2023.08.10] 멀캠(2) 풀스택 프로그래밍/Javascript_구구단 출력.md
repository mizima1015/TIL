vs.code에서 http과 script를 이용해 구구단을 출력해 볼 것이다.

## 코드
```
<!DOCTYPE html>
/* html을 사용할 것이다.*/

<html lang="ko">
/* 언어는 한국어 사용*/

    <head>

        <meta charset="UTF-8">

        <title>구구단을 외자!</title>

    </head>

    <body>

        <h1>구구단 2~9단까지 출력 (for loop)</h1>

    <script>

 /* 구구단을 출력하고 싶음*/

    var i;

    var j;

    var y;

    for(i=1; i<10; i++){

        document.write(i + "단 ")

        for(j=1; j<10; j++){

            y = i*j;

            document.write(i + "x" + j + "=" + y);

            document.write(" ")

        }

        document.write("<br>");
		/* 빈줄을 추가해 깔끔하게 만들었다.*/
    }

    </script>

    </body>

</html>
```


## 결과


![[Pasted image 20230721173513.png]]