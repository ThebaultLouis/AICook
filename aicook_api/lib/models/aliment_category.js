var mongoose = require("mongoose");

var AlimentCategorySchema = new mongoose.Schema({
  index: Number,
  name: String,
  image: String,
  main: Boolean
});

var AlimentCategory = mongoose.model("AlimentCategory", AlimentCategorySchema);
module.exports = {
  AlimentCategory
};
