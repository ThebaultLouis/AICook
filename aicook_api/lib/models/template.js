var mongoose = require('mongoose')

var TemplateSchema = new mongoose.Schema({})

var Template = mongoose.model('Template', TemplateSchema)
module.exports = {
    Template
}