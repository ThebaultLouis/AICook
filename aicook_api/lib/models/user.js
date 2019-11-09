var mongoose = require('mongoose')

var UserSchema = new mongoose.Schema({
    userName: {
        type: String,
        required: true,
        unique: true
    },
    // Personnal information
    email: {
        type: String,
        required: true,
        unique: true
    },
    hashedPassword: {
        type: String,
        required: true
    },
    // Location
    "dep": {
        required: true,
        type: String
    },
    "name": {
        required: true,
        type: String
    },
    "lat": {
        required: true,
        type: Number
    },
    "long": {
        required: true,
        type: Number
    },
    // Producteur
    owned_farm: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Farm'
    },
    // Utilisateur
    favorite_farms: [{
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Farm'
    }],
    categories: [{
        name: String,
        recipes: [{
            type: mongoose.Schema.Types.ObjectId,
            ref: 'Recipe'
        }]
    }]

})

var User = mongoose.model('User', UserSchema)
module.exports = {
    User
}