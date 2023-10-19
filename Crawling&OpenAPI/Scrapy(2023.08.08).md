# selenium

## 테스트


```
from selenium import webdriver
from selenium.webdriver.chrome.service import Service

CHROME_DRIVER_PATH = './chromedriver-win64/chromedriver.exe'
service = Service(executable_path=CHROME_DRIVER_PATH)
options = webdriver.ChromeOptions()
driver = webdriver.Chrome(service=service, options=options)

driver.get('https://www.naver.com/')
```


```
driver.quit()
```

## 이미지 다운로드

```
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from webdriver_manager.chrome import ChromeDriverManager
import time

CHROME_DRIVER_PATH = './chromedriver-win64/chromedriver.exe'
service = Service(executable_path=CHROME_DRIVER_PATH)
options = webdriver.ChromeOptions()
driver = webdriver.Chrome(service=service, options=options)
URL='https://www.google.co.kr/imghp'
driver.get(URL)

elem = driver.find_element(By.CSS_SELECTOR, "body > div.L3eUgb > div.o3j99.ikrT4e.om7nvf > form > div:nth-child(1) > div.A8SBwf > div.RNNXgb > div > div.a4bIc > textarea.gLFyf")
elem.send_keys("보라카이")
elem.send_keys(Keys.RETURN)

elem =driver.find_element(By.TAG_NAME, "body")
for i in range(60):
    elem.send_keys(Keys.PAGE_DOWN)
    time.sleep(0.1)

try:
    driver.find_element(By.CSS_SELECTOR, "#islmp > div > div > div > div.gBPM8 > div.qvfT1 > div.YstHxe > input").click()
    for i in range(60):
        elem.send_keys(Keys.PAGE_DOWN)
        time.sleep(0.1)

except:
    pass

links=[] 
images = driver.find_elements(By.CSS_SELECTOR, "#islrg > div.islrc > div > a.wXeWr.islib.nfEiy > div.bRMDJf.islir > img")

for image in images:
    if image.get_attribute('src') is not None:
        links.append(image.get_attribute('src'))
        
print(' 찾은 이미지 개수:',len(links))
```

```
import urllib.request

for k, i in enumerate(links):
    url = i
    urllib.request.urlretrieve(url, ".\\사진다운로드\\"+str(k)+".jpg")

print('다운로드 완료하였습니다.')
```

```
driver.quit()
```

## 검색어 추출
```
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from webdriver_manager.chrome import ChromeDriverManager
import time

CHROME_DRIVER_PATH = './chromedriver-win64/chromedriver.exe'
service = Service(executable_path=CHROME_DRIVER_PATH)
options = webdriver.ChromeOptions()
driver = webdriver.Chrome(service=service, options=options)
URL='https://signal.bz/news'
driver.get(url=URL)
results = driver.find_elements(By.CSS_SELECTOR,"#app > div > main > div > section > div > section > section:nth-child(2) > div:nth-child(2) > div > div:nth-child(1) > div:nth-child(1) > a> span.rank-text")
results

keyword_list = []
for keyword in results:
    print(keyword.text)
```