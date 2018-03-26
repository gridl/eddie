from bs4 import BeautifulSoup


xml = """
<title name="bar">
    <foo>test</foo>
<title>
"""

soup = BeautifulSoup(xml, 'xml')

markup = """
<title name="bar">
    <foo>test</foo>
    <p>some text</p>
    <p>some text</p>
    <p></p>
<title>
"""

soup = BeautifulSoup(markup, 'html.parser')

titles = soup.find_all('title')

title = titles[0]

print(title.attrs, title['name'])
print('done', '\n\n')

print(title.find())

text = [element.text for element in soup.find_all('p') if element.text]
print(text)


soup = soup.find_all('span')
