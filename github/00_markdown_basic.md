# 마크다운(Markdown)

> 일반 텍스트 형식 구문을 사용하는 마크업 언어의 일종응로 사용법이 쉽고 간결하여 빠르게 문서 정리를 할 수 있습니다. 단, 모든 HTML 마크업을 대체하지는 않습니다.



# 1. 문법

## 1.1 Header

> 헤더는 제목을 표현할 때 사용합니다. 단순히 글자의 크기를 표현하는 것이 아닌 의미론적인 중요도를 나타냅니다.

* `<h1>`부터 `<h6>` 까지 표현 가능합니다.



# h1 태그입니다.

## h2 태그입니다.

### h3 태그 입니다.

#### h4 태그 입니다.

##### h5 태그 입니다.

###### h6 태그입니다.



## 1.2 List

> 목록을 나열할 때 사용합니다. 순서가 필요한 항목과 그렇지 않은 항목으로 구분할 수 있습니다. 순서가 있는 항목 아래 순서가 없는 항목을 지정할 수 있으며 그 반대도 가능합니다.

* 순서가 없는 목록
  *  `1.`을 누르고 스페이스바를 누르면 생성할 수 있습니다.
  * `tab` 키를 눌러서 하위항목을 생성할 수 있고 `shift + tab` 키를 눌러서 상위 항목으로 이동 할 수 있습니다.



1. 순서가 있는 항목
2. 순서가 있는 항목
   1. 순서가 있는 하위 항목
   2. 순서가 있는 하위항목



* 순서가 없는 항목
* 순서가 없는 항목
  * 순서가 없는 하위 항목
  * 순서가 없는 하위 항목



## 1.3 Code Block

> 코드 블럭은 작성한 코드를 정리하거나 강조하고 싶은 부분을 나타낼 때 사용합니다. 인라인과 블럭 단위로 구분할 수 있습니다.

* Inline
  * 인라인 블럭으로 처리하고 싶은 부분을 `(백틱) 으로 감싸줍니다.
* Block
  * \`(백틱)을 3번 입력하고 `Enter` 를 눌러 생성합니다. 

`add` 한 요소를 remote 저장소에 올리려면 `$ git push origin master`를 너미널에 입력합니다.

```python
$ git add .
$ git commit -m "first commit"
$ git push origin master
```



## 1.4 Image

> 로컬에 있는 이미지를 삽입하거나 이미지 링크를 활용하여 이미지를 나타낼때 사용합니다.

* `![]()`을 작성하고 `()`안에 이미지 주소를 입력합니다. `[]`안에는 이미지 파일의 이름을 작성합니다.
* 로컬에 이미파일을 저장한 경우 절대 경로가 아닌 상대 경로를 사용하여 이미지를 저장합니다.



![git](data:image/png;base64,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) ![git 고양이](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1XApKSAWhAMjcBg8zmmkv-OwfLgl-_fmnSA&usqp=CAU)



## 1.5 Link

> 특정 주소로 링크를 걸 때 사용합니다.

* `[]()`을 작성하고 `()`안에 링크주소를 작성하고 `[]` 안에 어떤 링크 주소인지 작성합니다.



[git 공식문서](https://git-scm.com/)

[github 공식문서](https://github.com/)



## 1.6 Table

> 표를 작성하여 요소를 구분할 수 있습니다.

* `|` (파이프) 사이에 컬럼을 작성하고 `Enter`를 입력합니다.
* 마지막 컬럼을 작성하고 뒤에 `|`를 붙여줍니다.



| working directory | statging area | remoe repo |
| ----------------- | ------------- | ---------- |
| working tree      | index         | history    |
| working copy      | cache         | tree       |



## 1.7 기타

**인용문**

* `>`을 입력하고 `Enter`키를 누릅니다.

> git은 컴퓨터 파일의 변경사항을 추적하고 여러 명의 사용자들 간에 해당 파일들의 작업을 조율하기 위한 분산 버전 관리 시스템이다.

* 인용문 안에 인용문을 작성하면 중첩해서 사용할 수 있습니다.

> $ git add.
>
> > $ git commit -m "first commit"
> >
> > > $git push origin master



**수평선**

* `---`,`***`,`___`을 입력하여 작성합니다.

Working Directory

---

Staging Area

---

Remote Repository

---



**강조**

* 이탤릭체는 해당 부분을 `*`혹은 `_`(언더바) 로 감싸줍니다.
* 보드체는 해당부분을 `**`혹은 `__`(언더바 2개) 로 감싸줍니다.
* 취소선은 `~~` 표시를 사용합니다.

이것은 *이탤릭체*입니다.

이것은 **보드체**입니다.

이것은 ~~취소선~~입니다.



# 2. 과제

> 현제의 pdf 문서를 마크다운 문법을 활용하여 `00_markdown_basic.md`로 만들어 보세요.