var mongoose = require('mongoose')

var CitySchema = new mongoose.Schema({
    "index": {
        required: true,
        type: Number
    },
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
    }
})

var City = mongoose.model('City', CitySchema)
module.exports = {
    City
}