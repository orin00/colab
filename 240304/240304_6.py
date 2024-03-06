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

url = 'https://music.bugs.co.kr/chart'
html = get_html(url)

res = requests.get(url)
print(res)

soup = bs(html, 'html.parser')

rankings = [ranking.text.strip() for ranking in soup.select('.ranking > strong')]
names = [name.text.strip() for name in soup.select('th > .title')]
artists = [artist.text.strip() for artist in soup.select('td.left > p.artist')]

dic = {'ranking':rankings, 'name': names, 'artist':artists}

df = pd.DataFrame(dic)
print(df)


