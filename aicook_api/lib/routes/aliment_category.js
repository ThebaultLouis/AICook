const express = require("express");
const router = express.Router();
const _ = require("lodash");

// Import Schemas
var { AlimentCategory } = require("../models/aliment_category");

router.get("", (req, res) => {
  AlimentCategory.find({})
    .then(categories => {
      res.send({
        categories: categories
      });
    })
    .catch(e =>
      res.status(400).send({
        err: e
      })
    );
});
router.get("/main", (req, res) => {
  isMain = req.query.main == 0 ? false : true;
  console.log(isMain);

  AlimentCategory.find({ main: isMain })
    .then(categories => {
      res.send({
        categories: categories
      });
    })
    .catch(e =>
      res.status(400).send({
        err: e
      })
    );
});

module.exports = router;
