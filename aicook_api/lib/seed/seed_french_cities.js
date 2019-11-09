const {
    mongoose
} = require('../db/mongoose')
var {
    City
} = require('../models/city')

var cities = require('./assets/villes_france_light.json')

City.deleteMany({}).then(() => {
    for (var i = 0; i < cities.length; i = i + 50) {
        var json_city = cities[i]
        var city = new City({
            "index": json_city.id,
            "dep": json_city.dep,
            "name": json_city.name,
            "lat": json_city.lat,
            "long": json_city.long
        })
        city.save().then().catch(e => console.log(e))
    }
    console.log("Cities DB has been seeded")

}).catch(e => {
    console.log(e)
    resizeBy.status(400).send({
        "err": e
    })
})