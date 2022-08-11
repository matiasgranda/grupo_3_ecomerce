let express = require("express");
const path = require("path");
let router = express.Router();
let authMiddleware = require("../middelwares/authMiddleware.js");
let categoriasController = require("../controllers/categoriasController.js");


router.get("/", categoriasController.list);
router.get("/api", categoriasController.getCategorias);
router.get("/:idcategoria", categoriasController.listCategoria);

module.exports = router;