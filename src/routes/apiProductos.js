const express = require('express');
const router = express.Router();
const productosApiController = require('../controllers/productosApiController');

router.get("/", productosApiController.lista);
router.get("/:id", productosApiController.detalle);

module.exports = router;