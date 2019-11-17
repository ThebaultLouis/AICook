var mongoose = require("mongoose");

var AlimentSchema = new mongoose.Schema({
  index: Number,
  image: String,
  name: String,
  category: Number,
  sub_category: [Number]
});

var Aliment = mongoose.model("Aliment", AlimentSchema);
module.exports = {
  Aliment
};
