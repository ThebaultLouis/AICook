const {
    mongoose
} = require('../db/mongoose')
const faker = require('faker/locale/fr')
var {
    Farm
} = require('../models/farm')
var {
    City
} = require('../models/city')


Farm.deleteMany({}).then(() => {
    City.find({}).then(cities => {
        for (var i = 0; i < cities.length; i++) {

            var products = []
            for (var j = 0; j < 4; j++) {
                products.push({
                    "name": faker.name.findName(),
                    "price": Math.floor((Math.random() * 10 + 1)) + Math.random().toFixed(2),
                    "description": faker.lorem.paragraph()
                })
            }

            var city = cities[i]
            var farm = new Farm({
                "name": "Ferme à " + faker.name.findName(),
                "image": faker.random.image(),
                "descrition": faker.lorem.paragraph(),

                "city": city.name,
                "address": faker.address.city(),
                "lat": city.lat,
                "lng": city.long,

                "products": products
            })
            farm.save().then().catch(e => console.log(e))
        }
        console.log("farm DB has been seeded")
    }).catch(e => console.log(e))
}).catch(e => {
    console.log(e)
    resizeBy.status(400).send({
        "err": e
    })
})