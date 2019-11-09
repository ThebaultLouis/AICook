const {
    mongoose
} = require('../db/mongoose')
var {
    Recipe
} = require('../models/recipe')

var recipes = require('./assets/recettes.json')

Recipe.deleteMany({}).then(() => {
    for (var i = 0; i < recipes.length; i++) {
        var json_recipe = recipes[i]
        var recipe = Recipe({
            "name": json_recipe.name,
            "image": json_recipe.image,
            "type_recette": json_recipe.type_recette,
            "nb_personne": json_recipe.nb_personne,
            "difficulty": json_recipe.difficulty,
            "prix": json_recipe.prix,
            "temps_total": json_recipe.temps_total,
            "temps_prep": json_recipe.temps_prep,
            "temps_cuisson": json_recipe.temps_cuisson,
            "ingredients": json_recipe.ingredients,
            "etapes": json_recipe.etapes
        })
        recipe.save().then().catch(e => console.log(e))
    }
    console.log("Recipes DB has been seeded")
}).catch(e => {
    console.log(e)
    resizeBy.status(400).send({
        "err": e
    })
})