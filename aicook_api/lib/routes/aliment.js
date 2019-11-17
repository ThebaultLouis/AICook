const express = require("express");
const router = express.Router();
const _ = require("lodash");

// Import Schemas
var { Aliment } = require("../models/aliment");

router.get("/a", (req, res) => {
  res.send("coucou");
});

router.get("", (req, res) => {
  var page = req.query != undefined ? req.query.page : 0;
  var n = 20;

  Aliment.find({}, null, {
    skip: n * page,
    limit: n
  })
    .then(aliments => {
      res.send({
        aliments: aliments
      });
    })
    .catch(e =>
      res.status(400).send({
        err: e
      })
    );
});
router.get("/search", (req, res) => {
  var name = req.query.name;
  var page = req.query.page;
  var n = 20;

  Aliment.find(
    {
      name: {
        $regex: name,
        $options: "i"
      }
    },
    null,
    {
      skip: n * page,
      limit: n
    }
  )
    .then(aliments => {
      res.send({
        aliments: aliments
      });
    })
    .catch(e =>
      res.status(400).send({
        err: e
      })
    );
});
router.get("/:id", (req, res) => {
  var id = req.params.id;
  Aliment.find({
    _id: id
  })
    .then(aliment => {
      res.send({ aliment: aliment });
    })
    .catch(e =>
      req.status(400).send({
        err: e
      })
    );
});
router.get("/all", (req, res) => {
  Aliment.find({})
    .then(aliments => {
      res.send({
        aliments: aliments
      });
    })
    .catch(e =>
      res.status(400).send({
        err: e
      })
    );
});

module.exports = router;
