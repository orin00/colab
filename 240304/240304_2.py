import requests
from bs4 import BeautifulSoup
import pandas as pd

response = requests.get("https://www.python.org")
response.status_code

if response.status_code == 200:
    print('Success!')
elif response.status_code == 404:
    print('Not Found.')
    
def get_html(url):
    html = ''
    res = requests.get(url)
    if res.status_code == 200:
        res.encoding = 'utf-8'
        html = res.text
        print('Request Success')
    return html

# news = get_html('https://n.news.naver.com/mnews/article/215/0001151168')
# soup = BeautifulSoup(news, 'html.parser')
# print(soup)
# print(soup.select('title'))
# print(soup.select('title')[0].text)
# print(soup.select_one('title').text)
# print(soup.select_one('#title_area').text)
# print(soup.select_one('div.info > span'))

url = 'https://sports.news.naver.com/wfootball/record/index?category=epl&league=100&tab=player'
html = get_html(url)
soup = BeautifulSoup(html, 'html.parser')

name = soup.select('.inner>span.name')
print(name)

team = soup.select('.inner>span.team')
print(team)

goal =  soup.select('.selected>.inner>span')
print(goal)

print(len(name), len(team), len(goal))

n_li = []
t_li = []
g_li = []

for i in range(len(name)):
  n_li.append(name[i].text)
  t_li.append(team[i].text)
  g_li.append(goal[i].text)
  
df = pd.DataFrame({'name':n_li,
                   'team':t_li,
                   'goal':g_li})

print(df)