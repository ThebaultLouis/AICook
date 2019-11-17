# librairies
import requests
from bs4 import BeautifulSoup
import pandas as pd


recettes_urls = pd.read_json(r'recettes-urls.json')
aliments = []
units = ['ml', 'l', 'cl', 'g', 'kg']


def format_string(name):
    name = name.strip().lower()
    unit = ""
    names = name.split(' ')
    if (names[0] in units):
        unit = names[0]
        if (names[1] == "de"):
            return ' '.join(names[2:]), unit
        return ' '.join(names[1:]), unit
    return name, unit


for index, recette in recettes_urls.iterrows():
    print(recette['name'], "is running")

    response = requests.get(recette['url'])
    soup = BeautifulSoup(response.text, "html.parser")

    # Trouver les ingrédients
    aliments_soup = soup.find_all('li', 'recipe-ingredients__list__item')

    for i in range(len(aliments_soup)):
        name = aliments_soup[i].find_next('div').find_next(
            'span', attrs={'ingredient'}).string
        name, unit = format_string(name)
        value = aliments_soup[i].find_next('div').find_next(
            'span', attrs={'recipe-ingredient-qt'}).string

        image = aliments_soup[i].find_next('img')['src']

        for aliment in aliments:
            if aliment['image'] == image:
                if name in aliment['names']:
                    break
                else:
                    aliment['names'].append(name)
                    break
        else:
            aliments.append(
                {
                    "index": len(aliments),
                    "image": image,
                    "names": [name],
                })

df = pd.DataFrame(aliments)

export = df.to_json(r'aliments.json', orient='records')
