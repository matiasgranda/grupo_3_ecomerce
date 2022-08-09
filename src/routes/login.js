let express = require("express");
let router = express.Router();
let loginController = require("../controllers/loginController");
const { check } = require("express-validator");
const guestMiddleware=require('../middelwares/guestMiddleware');
const validateForm = [
    check("user").notEmpty().withMessage("Ingresa tu nombre de usuario o Email."),
    check("user").isLength({min:4,max:30}).withMessage("Minimo 4, maximo 30 carateres"),
    check("password").notEmpty().withMessage("Ingresa tu contraseña"),
    check("password").isLength({min:6}).withMessage("La contraseña debe tener al menos 6 caracteres")
]
router.post("/",guestMiddleware,validateForm,loginController.loginCheck);
router.get("/",guestMiddleware,loginController.login);

module.exports=router;