let express = require("express");
const path = require("path");
let router = express.Router();
let registroController = require("../controllers/registroController")

router.get("/", registroController.main);
router.post("/create",registroController.crear)

module.exports=router;