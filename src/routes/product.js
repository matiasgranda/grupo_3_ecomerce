let express = require("express");
const path = require("path");
let router = express.Router();
let productsController = require("../controllers/productsController")

router.get("/:id", productsController.product);
router.get("/create", productsController.create);
router.post("/create", productsController.save);




module.exports=router;