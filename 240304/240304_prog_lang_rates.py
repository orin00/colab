import requests
from bs4 import BeautifulSoup as bs
import pandas as pd

def get_html(url):
    html = ''
    res = requests.get(url)
    if res.status_code == 200:
        res.encoding = 'utf-8'
        html = res.text
        print('Request Success')
    return html

url = 'https://www.tiobe.com/tiobe-index/'
html = get_html(url)

soup = bs(html, 'html.parser')

# 언어 이름
names = [name.text.strip() for name in soup.select('.tiobe-index.container .content #top20 tr > td:nth-of-type(5)')]

# 점유율
ratings = [rating.text.strip() for rating in soup.select('.tiobe-index.container .content #top20 tr > td:nth-of-type(6)')]

# 변화량
changes = [change.text.strip() for change in soup.select('.tiobe-index.container .content #top20 tr > td:nth-of-type(7)')]

# 현 순위
months = [month.text.strip() for month in soup.select('.tiobe-index.container .content #top20 tr > td:nth-of-type(1)')]

# 이전 책정 순위
last_months = [last_month.text.strip() for last_month in soup.select('.tiobe-index.container .content #top20 tr > td:nth-of-type(2)')]

df = pd.DataFrame({'name': names, 'rating': ratings, 'change': changes, 'month': months, 'last_month': last_months})
print(df)

df.to_excel('prog_lang_rates.xlsx', index=False)
