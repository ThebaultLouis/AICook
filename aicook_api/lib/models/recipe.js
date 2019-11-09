var mongoose = require('mongoose')

var RecipeSchema = new mongoose.Schema({
    "name": {
        type: String,
        unique: true
    },
    "image": {
        type: String
    },
    "type_recette": {
        type: String
    },
    "nb_personne": {
        type: Number
    },
    "difficulty": {
        type: Number
    },
    "prix": {
        type: Number
    },
    "temps_total": {
        type: String
    },
    "temps_prep": {
        type: String
    },
    "temps_cuisson": {
        type: String
    },
    "ingredients": [{
        type: mongoose.SchemaTypes.Mixed
    }],
    "etapes": [{
        type: String
    }],
})

var Recipe = mongoose.model('Recipe', RecipeSchema)
module.exports = {
    Recipe
}