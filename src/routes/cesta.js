let express = require("express");
const path = require("path");
let router = express.Router();
const log=require('../middelwares/logMiddleware');

let cestaController = require("../controllers/cestaController");
const logMiddelware = require("../middelwares/logMiddleware");

router.get("/", cestaController.main);
router.post("/agregar/:id", cestaController.add);
router.get("/delete/:id", cestaController.delete);
router.get("/confirmar", cestaController.checkout);







module.exports = router;