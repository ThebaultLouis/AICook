# librairies
import requests
from bs4 import BeautifulSoup
import pandas as pd


urls = []
skipped_urls = []
aliments = []

# Connect to the URL
base_url = "https://cuisine-libre.fr/"
response = requests.get(base_url + "familles-alimentaires")

# Parse HTML and save to BeautifulSoup object¶
soup = BeautifulSoup(response.text, "html.parser")
ol_soup = soup.find_all('ol', attrs="reset")[0]
li_soup = ol_soup.find_all('li', 'famille clearfix')

# Main category
for i in range(len(li_soup)):
    url = li_soup[i].find_all('p', attrs={'h2'})[0].a['href']
    urls.append({
        'index': i,
        'main': True,
        'name': ' '.join(url.split('/')[0].split('-')),
        'url': base_url + url
    })

# Sub category
for i in range(len(li_soup)):
    li_soup_url = li_soup[i].find_all('ul', 'plus clearfix')
    if len(li_soup_url) == 0:
        continue
    li_soup_url = li_soup_url[0].find_all('li')
    for j in range(len(li_soup_url)):
        url = li_soup_url[j].a['href']
        urls.append({
            'index': j + 10,
            'main': False,
            'name': ' '.join(url.split('/')[0].split('-')),
            'url': base_url + url
        })

# for i in range(len(urls)):
#     url = urls[i]
#     response = requests.get(url['url'])
#     soup = BeautifulSoup(response.text, "html.parser")

#     print(url['url'])
#     try:
#         li_soup = soup.find_all(
#             'ul', 'reset d-flex clearfix')[0].find_all('li')

#         for j in range(len(li_soup)):
#             name = ' '.join(li_soup[j].a['href'].split('/')[0].split('-'))
#             # print(name)
#             image = li_soup[j].img['src']
#             for aliment in aliments:
#                 if (aliment['name'] == name):
#                     aliment['sub_category'].append(url['index'])
#                     break
#             else:
#                 aliments.append({
#                     'name': name,
#                     'image': base_url + image,
#                     'category': url['index'],
#                     'sub_category': []
#                 })
#     except:
#         skipped_urls.append(url)
#         print('url skipped')

# print("c'est reparti")

# while len(skipped_urls) != 0:
#     url = skipped_urls[-1]
#     response = requests.get(url['url'])
#     soup = BeautifulSoup(response.text, "html.parser")

#     print(url['url'])
#     try:
#         li_soup = soup.find_all(
#             'ul', 'reset d-flex clearfix')[0].find_all('li')

#         for j in range(len(li_soup)):
#             name = ' '.join(li_soup[j].a['href'].split('/')[0].split('-'))
#             # print(name)
#             image = li_soup[j].img['src']
#             for aliment in aliments:
#                 if (aliment['name'] == name):
#                     aliment['sub_category'].append(url['index'])
#                     break
#             else:
#                 aliments.append({
#                     'name': name,
#                     'image': base_url + image,
#                     'category': url['index'],
#                     'sub_category': []
#                 })
#         skipped_urls.pop()
#     except:
#         skipped_urls.append(url)
#         print('url skipped')

# Catégorie
cat_df = pd.DataFrame(urls)
cat_export = cat_df.to_json(r'urls.json', orient='records')

# # Aliments
# df = pd.DataFrame(aliments)
# export = df.to_json(r'aliments.json', orient='records')
