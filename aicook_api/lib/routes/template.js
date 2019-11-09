const express = require('express')
const router = express.Router()
const _ = require('lodash')

// Import Schemas
var {
    Template
} = require('../models/template')


module.exports = router