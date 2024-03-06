from bs4 import BeautifulSoup

res_content = """
<html>
<head><title>HTML sample</title>
</head>
<body>
    <h1>Hello CSS</h1>
    <div id='subset'>선택자</div>
    <div class='contents'>선택자를 어떻게 작성하느냐에 따라 <span>다른 <b>요소가 반환</b></span>됩니다.</div>
    <div>선택자는 다양한 곳에서 <b>활용</b>됩니다.</div> 
</body>
</html>
"""

soup = BeautifulSoup(res_content, 'html.parser')
# print(soup)

el = soup.select_one('h1').text
print(el)

# 해당하는 거 전부 다 크롤링
print(soup.select('b'))

# soup.select는 리스트에 담겨 있어서 인덱싱 이후 .text로 뽑아와야 한다.
# print(soup.select('b').text)
print(soup.select('b')[0].text)

# 해당하는 거 선택해서 크롤링
print(soup.select_one('b'))

# 특정 태그 선택해서 태그를 제외하고 텍스트만 크롤링
print(soup.select_one('b').text)


# 태그 선택자 ("element")
# 태그 선택자는 일반적으로 스타일 정의하고 싶은 html 태그 이름을 사용
print(soup.select('div'))
# 이러면 첫번째 순서로 있는 태그를 긁어옴
print(soup.select_one('div'))

# 다중(그룹) 선택자 ("selector1, selector2, selectorN")
# 선택자를 ","(comma)로 분리하여 선언하면 여러 개 선택자 적용.
print(soup.select('div,b'))

# 내포 선택자 ("ancestor descendant")
# 요소가 내포 관계가 있을 때 적용시키기 위한 선택자. 선택자와 선택자 사이를 공백으로 띄우고 나열
# 부모 자식요소는 고려 안하고 내포관계만 고려한다.
print(soup.select('div b'))

# 자식 선택자 ("parent > child")
# 선택자들 사이에 >를 입력하며 반드시 부모자식간의 관계에만 스타일이 적용되도록 함.
# 두 단계 이상 건너뛴 관계에서는 자식 선택자가 작동하지 않음
print(soup.select("div>b")) # <b>요소가 반환</b>는 div > span > b인 요소라서 제외됨


# 클래스(class) 선택자 (".class")
# HTML 문서에서 class 속성의 값과 일치하는 요소를 선택한다.
# 선택자 이름 앞에 "."을 이용하여 선언
print(soup.select("div.contents"))

# 아이디(id) 선택자 (＂#id＂)
# HTML 문서에서 id 속성의 값과 일치하는 요소를 선택
# id 선택자는 #으로 정의
print(soup.select("#subset"))

# 속성 선택자 [name="value"]
# 특정한 속성을 갖는 요소만 선택. 속성 선택자는 대괄호( [ ] )사이에 속성의 이름과 값을 지정
print(soup.select_one("[id=subset]").text)

