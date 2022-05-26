let express = require("express");
let router = express.Router();

let logOutController = require("../controllers/logOutController.js");
router.get("/", logOutController.out);

module.exports = router;