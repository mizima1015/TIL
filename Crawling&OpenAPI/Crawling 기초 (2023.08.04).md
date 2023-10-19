
[ python > crawling > html > index.html ]

index.html 
```
<!DOCTYPE html>
<html>
    <head>
        <meta charset="URF-8">
        <title>크롤링 웹페이지</title>
    </head>
    <body>
        <div class="mulcam1">
            <p>여기는 크롤링 하지 마세요!</p>
        </div>
        <div class = "fakecampus">
            <p>여기는 크롤링 해주세요</p>
        </div>

    </body>
</html>
```

[ python > crawling > ch01.py ]

ch01.py 
```
# -*- coding:utf-8 -*-

from bs4 import BeautifulSoup

  

# index.html을 불러와서 BeautifulSoup 객체 초기화

# 웹에서 응답을 할 때, HTML, XML, JSON, 그 외 여러가지 방식들이 존재

  

def main():

    soup = BeautifulSoup(open("html/index.html", encoding="utf-8"), "html.parser")

    # print(type(soup))

  

    # print(soup.title)

  

    # print(soup.tilte.name)

  

    # soup.title.string

  

    # soup.title.parent.name

  

    # print(soup.find("p").get.text())

  

    # p_tags = soup.find_all('p')

    # print(p_tags[1].text)

    # print(soup.p)

    # print(soup.find_all('p').get.text())

    # print(soup.a)

    # <a class="sister" href="http://example.com/elsie" id="link1">Elsie</a>

    # target_div = soup.find('div', class_="fakecampus")

    # target_text = target_div.p.text

    # print(target_div.p.text)

    fake_str = soup.find('div', class_="fakecampus").find_all('p')

    print(fake_str[2].get_text())

    # soup.find 방식은 find를 여러번 이을 수 있다.

    # soup.find_all('a')

    # [<a class="sister" href="http://example.com/elsie" id="link1">Elsie</a>,

    #  <a class="sister" href="http://example.com/lacie" id="link2">Lacie</a>,

    #  <a class="sister" href="http://example.com/tillie" id="link3">Tillie</a>]

  

    # soup.find(id="link3")

    # <a class="sister" href="http://example.com/tillie" id="link3">Tillie</a>

  

if __name__ == "__main__":

    main()
```

print(type(soup))
```
lsjls@Mizi2 MINGW64 ~/mult28/multicampus28/python/crawling (main)
$ python ch01.py 
<class 'bs4.BeautifulSoup'>
(venv) 
```

[ python > crawling > ch02.py ]
ch02.py
```
import requests

from bs4 import BeautifulSoup

  

url = "https://www.naver.com"

  

# 요청 url 변수에 담긴 url의 html 문서를 출력한다.

req = requests.get(url)

print(req.status_code) # 상태코드
```