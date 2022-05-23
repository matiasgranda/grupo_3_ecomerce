let express = require("express");
const path = require("path");
let router = express.Router();
const log=require('../middelwares/logMiddelware');

let cestaController = require("../controllers/cestaController");
const logMiddelware = require("../middelwares/logMiddelware");

router.post("/", cestaController.main);
router.post("/agregar/:id", cestaController.add);







module.exports = router;