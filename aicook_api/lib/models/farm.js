var mongoose = require('mongoose')

var FarmSchema = new mongoose.Schema({
    "name": {
        required: true,
        type: String
    },
    "descrition": String,
    "image": String,

    "city": String,
    "zipcode": String,
    "address": String,
    "lat": Number,
    "lng": Number,

    products: [{
        "name": String,
        "description": String,
        "price": Number,
    }]
})

var Farm = mongoose.model('Farm', FarmSchema)
module.exports = {
    Farm
}
// "name": ,
// "descrition": ,

// "city": ,
// "zipcode": ,
// "address": ,
// "lat": ,
// "long": ,

// products: [{
//     "name": ,
//     "price": ,
//     "description": ,
// }]