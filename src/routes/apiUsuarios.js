const express = require('express');
const router = express.Router();
const usuariosApiController = require('../controllers/usuariosApiController');
const apiDomicilioController = require("../controllers/apiDomicilioController")

router.get("/", usuariosApiController.lista);
router.get("/:id", usuariosApiController.detalle);
router.post("/adminlogin", usuariosApiController.adminLogin);

router.get("/domicilio/:id", apiDomicilioController.getdomicilio);
router.post("/domicilio", apiDomicilioController.createdomicilio);
router.put("/domicilio/:id", apiDomicilioController.setdomicilio);
router.put("/domicilio/:id/setdefault", apiDomicilioController.setdefault);

module.exports = router;