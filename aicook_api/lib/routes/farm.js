const express = require('express')
const router = express.Router()
const _ = require('lodash')
var {
    getDistance
} = require('geolib');

// Import Schemas
var {
    Farm
} = require('../models/farm')

router.get('', (req, res) => {
    var page = req.query.page ? req.query.page : 0
    var lat = req.query.lat
    var lng = req.query.lng
    var n = 50

    Farm.find({}).then(farms => {
        farms.sort((a, b) => getDistance({
            latitude: lat,
            longitude: lng
        }, {
            latitude: a.lat,
            longitude: a.lng
        }) < getDistance({
            latitude: lat,
            longitude: lng
        }, {
            latitude: b.lat,
            longitude: b.lng
        }))
        res.send({
            "farms": farms.slice(n * page, n * (page + 1))
        })
    }).catch(e => {
        console.log(e)
        res.status(400).send({
            "err": e
        })
    })
})
router.get('/search', (req, res) => {
    var name = req.query.name
    var page = req.query.page
    var n = 20

    Farm.find({
            "city": {

                "$regex": name,
                "$options": "i"
            }
        },
        null, {
            skip: n * page,
            limit: n
        }
    ).then(farms_by_city => {

        Farm.find({
                "name": {
                    "$regex": name,
                    "$options": "i"
                }
            },
            null, {
                skip: n * page,
                limit: n
            }
        ).then(farms_by_name => {
            res.send({
                "farms_by_name": farms_by_name,
                "farms_by_city": farms_by_city
            })
        })
    }).catch(e => res.status(400).send({
        "err": e
    }))
})
router.get('/:id', (req, res) => {
    var id = req.params.id
    Farm.find({
        "_id": id
    }).then(farm => {
        res.send(farm)
    }).catch(e => req.status(400).send({
        "err": e
    }))
})
router.get('/all', (req, res) => {
    Farm.find({}).then(farms => {
        res.send({
            "farms": farms
        })
    }).catch(e => res.status(400).send({
        "err": e
    }))
})



module.exports = router