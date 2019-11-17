# librairies
import requests
from bs4 import BeautifulSoup
import pandas as pd

max_page = 10

base_url = "https://www.marmiton.org/recettes/recherche.aspx?"
ingredients = pd.read_json(r'ingredients.json')
recettes = []

for index, ingredient in ingredients.iterrows():
    print(ingredient['name'], "is running")
    for page in range(0, max_page):
        url = "https://www.marmiton.org/recettes/recherche.aspx?aqt={}&start={}&page={}".format(
            ingredient['name'], page * 15, page)

        # Connect to the URL
        response = requests.get(url)

        # Parse HTML and save to BeautifulSoup object¶
        soup = BeautifulSoup(response.text, "html.parser")

        for i in range(len(soup.find_all('div', attrs="recipe-card"))):
            card_soup = soup.find_all(
                'div', attrs="recipe-card")[i]
            name = card_soup.h4.string
            url = "https://www.marmiton.org" + card_soup.a['href']
            image = card_soup.img['src']
            if url in map(lambda x: x['url'], recettes):
                break
            recettes.append({
                'ingredient_name': ingredient['name'],
                # 'ingredient_index': ingredient['index'],
                'name': name,
                'url': url,
                'image': image
            })

df = pd.DataFrame(recettes)

export = df.to_json(r'recettes-urls.json', orient='records')
