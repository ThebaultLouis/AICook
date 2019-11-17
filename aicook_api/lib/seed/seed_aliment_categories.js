const { mongoose } = require("../db/mongoose");
var { AlimentCategory } = require("../models/aliment_category");

var categories = require("./assets/urls.json");

AlimentCategory.deleteMany({})
  .then(() => {
    for (var i = 0; i < categories.length; i++) {
      var json_category = categories[i];
      var category = new AlimentCategory({
        index: json_category.index,
        name: json_category.name,
        main: json_category.main
      });
      category
        .save()
        .then()
        .catch(e => console.log(e));
    }
    console.log("category DB has been seeded");
  })
  .catch(e => {
    console.log(e);
  });
