const express = require('express')
const router = express.Router()
const _ = require('lodash')

router.get('/cities', (req, res) => {
    require('../seed/seed_french_cities')
    res.send({
        "sucess": "Cities db has been seeded"
    })
})
router.get('/farms', (req, res) => {
    require('../seed/seed_producteurs')
    res.send({
        "sucess": "Farms db has been seeded"
    })
})
router.get('/recipes', (req, res) => {
    require('../seed/seed_recipes')
    res.send({
        "sucess": "Recipe db has been seeded"
    })
})

module.exports = router