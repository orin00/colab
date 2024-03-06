import requests
from bs4 import BeautifulSoup
import pandas as pd

def get_html(url):
    html = ''
    res = requests.get(url)
    if res.status_code == 200:
        # 한글 인코딩 시에는 'cp949'
        res.encoding = 'cp949'
        html = res.text
        print('Request Success')
    return html

url = 'https://finance.naver.com/marketindex/?tabSel=exchange#tab_section'
html = get_html(url)

soup = BeautifulSoup(html, 'html.parser')

name_tags = soup.find_all('h3', class_='h_lst')
value_tags = soup.find_all('span', class_='value')

names = [name.text.strip() for name in name_tags]
values = [value.text.strip() for value in value_tags]

dic = {'name': names, 'price': values}

df = pd.DataFrame(dic)
print(df)

# pip install openpyxl
df.to_excel('exchange_rates.xlsx', index=False)