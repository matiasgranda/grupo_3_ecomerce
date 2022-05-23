let express = require("express");
const path = require("path");
let router = express.Router();
const log=require('../middelwares/logMiddelware');

let cestaController = require("../controllers/cestaController");
const logMiddelware = require("../middelwares/logMiddelware");

router.get("/", cestaController.main);
router.put("/agregar/:id", cestaController.add);







module.exports = router;