let express = require("express");
let router = express.Router();
let loginController = require("../controllers/loginController");
const { check } = require("express-validator");
const guestMiddleware=require('../middelwares/guestMiddleware');
const validateForm = [
    check("user").notEmpty().withMessage("Debes elegir un nombre de usuario."),
    check("user").isLength({min:4,max:18}).withMessage("El usuario debe contener entre 4 y 18 carateres"),
    check("password").notEmpty().withMessage("Ingresa tu contraseña"),
    check("password").isLength({min:6}).withMessage("La contraseña debe tener al menos 6 caracteres")
]
router.post("/",guestMiddleware,validateForm,loginController.loginCheck);
router.get("/",guestMiddleware,loginController.login);

module.exports=router;