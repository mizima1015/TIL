
# Data Analytics
-데이터란?
과거의 사실에 대한 결과

* 데이터 형태 별 가치
![[화면 캡처 2023-07-17 195556.png]]


# Data Type and Operations

> python에서는 help()를 통해 해당 명령어의 메뉴얼을 확인할 수 있다.

```
print('Hello World')

print('Hello World', end = '\t')
# 끝 부분을 추가로 설정
# \t = tab , \n = new line

print('Hello World', end = '\t vst')
Hello World      vst
# 이와 같이 world 뒤 쪽에 텝이 들어간 것을 확인 할 수 있다.

print('Hello', 'World', sep='-')
Hello-World
```
~~여러단어를 같이 쓰면 기본 디폴트로 뉴라인으로 넘어간다. 그것을 뒤에 설정으로 바꿔준다~~  -> 확인해 본 결과 디폴트 값은 ' '(블랭크)인 것으로 보인다.



### 객체 선언

``` 
koo = 'Data Analytics'
print (koo)
Data Analytics

type(koo)
str
```

주의 ) 파이썬에서 이미 사용 중인 예약어는 객체명으로 사용할 수 없다.
```
import keword
keyword.kwlist
```
해당 명령어를 통해 키워드를 확인 할 수 있다.




### Data Type

* 기본 자료형

* 숫자형(Numeric/Number)
	*  정수형(int) , 실수형(float), 복소수형(complex)

* 문자형(Character/String)
	* 문자열(str)

* 논리형(Logical/bool)
	* 참(True), 거짓(False)




### Arithmetic Operators (산술 연산자)

* 기본 사칙연산*
	1+2  ,  2-1  ,  1\*2 ,  2 /1

* 나눗셈 후 몫 반환
	10//3

* 니눗셈 후 나머지 반환
	10%3

* 제곱
	9 ** 3

* pow()
	pow(9,2)  = 81   # 9의 2제곱 power의 약자이다.

* abs()
	abs(3) = 3  # 절댓값

* hex() , oct(), bin()
	16진수, 8진수, 2진수 진법 변환

* round()
	**반올림
		round(24.57, ndigits = 1)  = 24.6  # 소숫점 둘째 자리에서 반올림
		ndigits의 디폴트 값은 0인듯 하다.  이는 소숫점 첫째자리에서 반올림 하는 것에 해당한다.
		round(24.57, ndigits = -1) = 20  # 1의 자리에서 반올림


### 비교연산자
>파이썬에서 영어 A,B,C는 각각 고유의 숫자가 부여된다. 따라서 대소 구분이 가능하다. (한국말 '팔'같은 것은 불가능하다.)
* A>b => False (True Flase 결과 값이 나오는 것은 논리 연산자에 해당한다.)

**== , > , < , >= , <= , != (#같지 않다.)**



### 논리연산자

