import requests
from bs4 import BeautifulSoup as bs
import pandas as pd
import re
import os

folder_name = 'C:/Users/Administrator/Desktop/osc/9.crawling/game_img'

if not os.path.exists(folder_name):
    os.makedirs(folder_name)


def get_html(url):
    html = ''
    res = requests.get(url)
    if res.status_code == 200:
        res.encoding = 'utf-8'
        html = res.text
        print('Request Success')
    return html

url = 'https://www.nintendo.co.kr/switch/ranking/ranking_2023_full.html'
html = get_html(url)

soup = bs(html, 'html.parser')


img_url = soup.select('.nc3-c-softCard__thumbImage img')
cnt = 1
img_urls = []
for i in img_url[:31]:
    url = 'https://www.nintendo.co.kr' + i['src']  # Updated URL with scheme and base URL
    print(url)
    dw_file = requests.get(url)
    # Modify 'img' variable to include folder name
    img = open(os.path.join(folder_name, str(cnt) + '.png'), 'wb')
    img.write(dw_file.content)
    img.close()
    cnt += 1
    img_urls.append(os.path.join(folder_name, str(cnt) + '.png'))  # Append relative path to the list
    
# 언어 이름
names = [name.text.strip() for name in soup.select('p.tit')]

infos = [info.text.strip() for info in soup.select('p.releaseInfo')]

def extra_date(text):
    match = re.search(r'\d{4}\. \d{1,2}\. \d{1,2}', text)
    if match:
        return match.group()
    else:
        return None
    
dates = [extra_date(text) for text in infos]

def extra_text(text):
    match = re.search(r'\d{4}\. \d{1,2}\. \d{1,2}', text)
    if match:
        return text[:match.start()] + text[match.end():]
    else:
        return text
    
companys = [extra_text(text) for text in infos]

df = pd.DataFrame({'게임이름': names, '발매일':dates, '개발사':companys, '이미지': img_urls})
print(df)

df.to_excel('nintendo.xlsx', index=False)
