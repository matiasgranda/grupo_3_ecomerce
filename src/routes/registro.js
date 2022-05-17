let express = require("express");
const path = require("path");
let router = express.Router();
let registroController = require("../controllers/registroController")
const { check } = require("express-validator");

const validateForm = [
    check("usuario").notEmpty().withMessage("Debes elegir un nombre de usuario."),
    check("mail").isEmail().withMessage("La direccion de email no es valida"),
    check("password").notEmpty().withMessage("Elige tu contraseña"),
    check("fechanac").notEmpty().withMessage("Ingresa tu fecha de nacimiento")
]
router.get("/", registroController.main);
router.post("/create", validateForm, registroController.crear)

module.exports=router;