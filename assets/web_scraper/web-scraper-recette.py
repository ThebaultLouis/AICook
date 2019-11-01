# librairies
import requests
from bs4 import BeautifulSoup
import pandas as pd


recettes_urls = pd.read_json(r'recettes-urls.json')
aliments_db = pd.read_json(r'aliments.json')
recettes = []

units = ['ml', 'l', 'cl', 'g', 'kg', 'mg']


def format_string(name):
    name = name.strip().lower()
    unit = ""
    names = name.split(' ')
    if (names[0] in units):
        unit = names[0]
        return ' '.join(names[2:]), unit
    return name, unit


for index, recette in recettes_urls.iterrows():
    print(recette['name'], "is running")

    try:
        response = requests.get(recette['url'])
        soup = BeautifulSoup(response.text, "html.parser")

        types = soup.find_all(
            'p', attrs={'af-bread-crumb'})[0].find_all('a')
        type_recette = ""
        if (len(type_recette) > 2):
            types[2].string

        info_soup = soup.find_all(
            'div', attrs={"recipe-infos"})[0]

        temps_total = info_soup.find_all('div')[0].find_all('span')[1].string
        n_personnes = info_soup.find_all('div')[1].find_all('span')[1].string
        difficulty = (info_soup.find_all('div')
                      [2].find_next('div')['class'][1]).split("level-")[1]
        prix = (info_soup.find_all('div')[3].find_next(
            'div', {'recipe-infos__level__container'})['class'][1]).split("level-")[1]

        temps_prep = soup.find_all('div', attrs={"recipe-infos__timmings__preparation"})[0].find_next(
            'span', attrs={"recipe-infos__timmings__value"}).string.replace('\t', '').replace('\r', '')
        temps_cuisson = soup.find_all('div', attrs={"recipe-infos__timmings__cooking"})[0].find_next(
            'span', attrs={"recipe-infos__timmings__value"}).string.string.replace('\t', '').replace('\r', '').replace('\n', '')

        # Trouver les ingrédients
        ingredients = []
        ingredients_soup = soup.find_all(
            'li', 'recipe-ingredients__list__item')
        for i in range(len(ingredients_soup)):
            value = ingredients_soup[i].find_next(
                'div').find_next('span', attrs={'recipe-ingredient-qt'}).string
            # TODO : mapper le nom de l'alliment avec la database
            name = ingredients_soup[i].find_next('div').find_next(
                'span', attrs={'ingredient'}).string
            name, unit = format_string(name)
            for index, aliment in aliments_db.iterrows():
                if name == aliment['name']:
                    ingredients.append({
                        "value": value,
                        "name": name,
                        "aliment_index": aliment['index']
                    })

        # Trouver les étapes
        etapes = []
        for i in range(len(soup.find_all('li', attrs={"recipe-preparation__list__item"}))):
            depart = 1
            if (i > 9):
                depart = 2
            etape = soup.find_all(
                'li', attrs={"recipe-preparation__list__item"})[i].text.split("Etape ")[1][depart:].replace('\t', '')
            etapes.append(etape)

        recettes.append({
            "name": recette['name'],
            # "ingredient_principale": recette['ingredient_name'],
            # "index_ingredient_principal": recette['ingredient_index'],
            "type_recette": type_recette,
            "n_personne": n_personnes,
            "difficulty": difficulty,
            "prix": prix,
            "temps_total": temps_total,
            "temps_prep": temps_prep,
            "temps_cuisson": temps_cuisson,
            "ingredients": ingredients,
            "etapes": etapes
        })
    except:
        print("The recipe has been skiped")

df = pd.DataFrame(recettes)

export = df.to_json(r'recettes.json', orient='records')
