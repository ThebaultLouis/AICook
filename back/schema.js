class Recette {
    constructor() {
        this = {
            _id: "",
            nom: '',
            maintType: "EnumType",
            types: ["EnumType"],
            images: [''],
            auteur: "idUser",
            note: 0,
            likes: 0,
            partages: 0,
            tempsDePreparationTotal: {
                tempsDePreparation: 0,
                TempsDeCuisson: 0
            },
            nombreDePersonne: 0,
            difficulte: 0,
            prix: 0,
            ingrédients: [{
                ingredient: ["idIngredient"],
                unit: {
                    type: '',
                    value: 0
                }
            }],
            ustensiles: [{
                ustensile: ["idUstensile"]
            }],
            etapes: [{
                description: "",
                photo: ""
            }],
            noteAuteur: "",
            commentaires: ["idCommentaire"]
        }
    }
}
class Ingredient {
    constructor() {
        this = {
            _id: "",
            name: "",
            photo: "",
            type: ['principale', "garniture"]
        }
    }
}
class Ustensile {
    constructor() {
        this = {
            _id: "",
            name: "",
            amazon: ""
        }
    }
}
class Commentaire {
    constructor() {
        this = {
            _id: "",
            recette: "idRecette",
            note: 0,
            photo: "",
            commentaire: ""
        }
    }
}
class User {
    constructor() {
        this = {
            _id: "",
            name: "",
            email: "",
            commentaires: ["idCommentaire"],
            listeDeCourse: [
                'idRecette'
            ]
        }
    }
}