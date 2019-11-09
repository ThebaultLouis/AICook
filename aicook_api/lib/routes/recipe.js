const express = require('express')
const router = express.Router()
const _ = require('lodash')

// Import Schemas
var {
    Recipe
} = require('../models/recipe')

router.get('', (req, res) => {
    var page = req.query != undefined ? req.query.page : 0
    var n = 20

    Recipe.find({},
        null, {
            skip: n * page,
            limit: n
        }
    ).then(recipes => {
        res.send({
            "recipes": recipes
        })
    }).catch(e => res.status(400).send({
        "err": e
    }))
})
router.get('/search', (req, res) => {
    var name = req.query.name
    var page = req.query.page
    var n = 20

    Recipe.find({
            "name": {
                "$regex": name,
                "$options": "i"
            }
        },
        null, {
            skip: n * page,
            limit: n
        }
    ).then(recipes => {
        res.send({
            "recipes": recipes
        })
    }).catch(e => res.status(400).send({
        "err": e
    }))
})
router.get('/:id', (req, res) => {
    var id = req.params.id
    Recipe.find({
        "_id": id
    }).then(recipe => {
        res.send(recipe)
    }).catch(e => req.status(400).send({
        "err": e
    }))
})
router.get('/all', (req, res) => {
    Recipe.find({}).then(recipes => {
        res.send({
            "recipes": recipes
        })
    }).catch(e => res.status(400).send({
        "err": e
    }))
})



module.exports = router