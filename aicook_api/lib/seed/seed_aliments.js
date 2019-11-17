const { mongoose } = require("../db/mongoose");
var { Aliment } = require("../models/aliment");

var aliments = require("./assets/aliments.json");

Aliment.deleteMany({})
  .then(() => {
    for (var i = 0; i < aliments.length; i++) {
      var json_aliment = aliments[i];
      var aliment = new Aliment({
        index: json_aliment.index,
        name: json_aliment.name,
        image: json_aliment.image,
        category: json_aliment.category,
        sub_category: json_aliment.sub_category
      });
      aliment
        .save()
        .then()
        .catch(e => console.log(e));
    }
    console.log("Aliment DB has been seeded");
  })
  .catch(e => {
    console.log(e);
  });
