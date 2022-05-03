let express = require("express");
const path = require("path");
let router = express.Router();
let productsController = require("../controllers/productsController")

router.get("/create", productsController.create);
router.get("/:id", productsController.product);
router.post("/create", productsController.save);




module.exports=router;