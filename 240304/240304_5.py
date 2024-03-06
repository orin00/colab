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

url = 'http://www.cgv.co.kr/movies/?lt=1&ft=0'
html = get_html(url)

res = requests.get(url)
print(res)

soup = bs(html, 'html.parser')

titles = [title.text.strip() for title in soup.select('.title')]
scores = [score.text.strip() for score in soup.select('.score')]
infos = [info.text.strip() for info in soup.select('.txt-info')]

dic = {'title': titles, 'score': scores, 'txt': infos}

df = pd.DataFrame(dic)
print(df)


