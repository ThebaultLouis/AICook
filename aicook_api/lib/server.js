// Config
require('./config/config')

// Package
var express = require('express')
var cors = require('cors')
var bodyParser = require('body-parser')
var _ = require('lodash')

// Seed
// require('./seed/seed')


var app = express()
app.use(cors())
app.use(bodyParser.json())

// Routes
//Template
const templates = require('./routes/template')

app.use('/api/template', templates)

// //User
// const users = require('./routes/user')

// app.use('/api/user', users)

// City
const cities = require('./routes/city')

app.use('/api/cities', cities)

// Recipe
const recipes = require('./routes/recipe')

app.use('/api/recipes', recipes)

// Farms
const farms = require('./routes/farm')

app.use('/api/farms', farms)

// Seed
const seed = require('./routes/seed')

app.use('/api/seed', seed)



app.listen(process.env.PORT, () => {
    console.log(`Started in port ${process.env.PORT}`)
})

module.exports.app = app