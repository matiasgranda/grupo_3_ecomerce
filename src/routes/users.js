let express = require("express");
const path = require("path");
let router = express.Router();
let userController = require("../controllers/userController.js");

router.get("/", userController.main);

module.exports = router;