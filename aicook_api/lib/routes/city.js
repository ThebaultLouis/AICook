const express = require('express')
const router = express.Router()
const _ = require('lodash')

// Import Schemas
var {
    City
} = require('../models/city')

router.get('', (req, res) => {
    var dep = req.query.dep
    City.find({
        "dep": dep
    }).then(cities => {
        res.send({
            "cities": cities
        })
    }).catch(e => res.status(400).send({
        "err": e
    }))
})
router.get('/search', (req, res) => {
    var name = req.query.name

    City.find({
        "name": {
            "$regex": name,
            "$options": "i"
        }
    }).then(cities => {
        res.send({
            "cities": cities
        })
    }).catch(e => res.status(400).send({
        "err": e
    }))
})
router.get('/all', (req, res) => {
    City.find({}).then(cities => {
        res.send({
            "cities": cities
        })
    }).catch(e => res.status(400).send({
        "err": e
    }))
})

module.exports = router