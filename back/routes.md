Api ip : http://142.93.104.190:4248/api

# Cities
#### /cities?dep=
- GET // Renvoie toutes les villes appartenant au département

#### /cities/search?name=
- GET // Renvoie toutes les villes contenant *name*

#### /cities/all
- GET // Renvoie toutes les villes


# Farms
#### /farms?page=&lat=&lng=
- GET // Renvoie 50 fermes triées selon la proximité

#### /farms/search?name=&page=
- GET // Renvoie 20 fermes contenant *name*

#### /farms/:id
- GET // Renvoie la ferme avec l'ID correspondant

#### /farms/all
- GET // Renvoie toutes les fermes

# Recipes
#### /recipes?page=
- GET // Renvoie 20 recettes

#### /recipes/search?name=
- GET // Renvoie 20 recettes contenant *name*

#### /recipes/:id
- GET // Renvoie la recette avec l'ID correspondant

#### /recipes/all
- GET // Renvoie toutes les recettes

# Seed
#### /seed/cities
- GET
#### /seed/farms
- GET
#### /seed/recipes
- GET
