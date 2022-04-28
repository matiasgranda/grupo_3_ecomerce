let express = require("express");
const path = require("path");
let router = express.Router();
let productsController = require("../controllers/productsController")

router.get("/", productsController.product);


module.exports=router;