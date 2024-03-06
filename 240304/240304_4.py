import requests
# BeautifulSoup에 별칭
from bs4 import BeautifulSoup as bs
import pandas as pd

def get_html(url):
    html = ''
    res = requests.get(url)
    if res.status_code == 200:
        # 한글 인코딩 시에는 'cp949'
        res.encoding = 'utf-8'
        html = res.text
        print('Request Success')
    return html

# fow crawling
url = 'https://fow.kr/statistics'
html = get_html(url)
# res = requests.get(url)

soup = bs(html, 'html.parser')
# print(res)

# champion = bs(res.content, 'html.parser')
# print(soup)


champions = soup.select('.statistics .champ')
print(champions)

# 실패