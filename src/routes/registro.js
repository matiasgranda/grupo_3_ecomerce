let express = require("express");
const path = require("path");
let router = express.Router();
let registroController = require("../controllers/registroController")
const { check } = require("express-validator");

const validateForm = [
    check("usuario").notEmpty().withMessage("Debes elegir un nombre de usuario."),
    check("usuario").isLength({min:4,max:18}).withMessage("El usuario debe contener entre 4 y 18 carateres"),
    check("mail").isEmail().withMessage("La direccion de email no es valida"),
    check("password").notEmpty().withMessage("Elige tu contraseña"),
    check("password").isLength({min:6}).withMessage("La contraseña debe tener al menos 6 caracteres"),
    check("confPassword").notEmpty().withMessage("Debes confirmar la contraseña"),
    check("confPassword").isLength({min:6}).withMessage("La confirmacion de la contraseña debe tener al menos 6 caracteres"),
    check("confPassword").equals(check("password")).withMessage("Las contraseñas no coinciden"),
    check("fechanac").notEmpty().withMessage("Ingresa tu fecha de nacimiento")
]
router.get("/", registroController.main);
router.post("/create", validateForm, registroController.crear)

module.exports=router;