const express = require('express')
const router = express.Router()
const _ = require('lodash')

// Import Schemas
var {
    City
} = require('../../models/city')

router.get('', (req, res) => {
    City.find({}).then(cities => {
        res.send({
            "cities": cities
        })
    })
})

module.exports = router