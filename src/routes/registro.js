let express = require("express");
const path = require("path");
let router = express.Router();
const { check } = require("express-validator");
const multer = require('multer');
const res = require("express/lib/response");
let multerDiskStorage=multer.diskStorage({
    destination:(req,file,callback)=>{
        let folder=path.join(__dirname,'../../public/img/profiles');
        callback(null,folder);
    },
    filename:(req,file,callback)=>{
        let imageName=Date.now()+path.extname(file.originalname);
        callback(null,imageName);
    }

});
let fileupload=multer({storage:multerDiskStorage});
let registroController = require("../controllers/registroController");

const validateForm = [
    check("nombre").notEmpty().withMessage("Debes ingresar tu nombre."),
    check("apellido").notEmpty().withMessage("Debes ingresar tu apellido."),
    check("telefono").notEmpty().withMessage("Debes ingresar tu numero de teléfono."),
    check("usuario").notEmpty().withMessage("Debes elegir un nombre de usuario."),
    check("usuario").isLength({min:4,max:18}).withMessage("El usuario debe contener entre 4 y 18 carateres"),
    check("mail").isEmail().withMessage("La direccion de email no es valida"),
    check("password").notEmpty().withMessage("Elige tu contraseña"),
    check("password").isLength({min:6}).withMessage("La contraseña debe tener al menos 6 caracteres"),
    check("confPassword").notEmpty().withMessage("Debes confirmar la contraseña"),
    check("confPassword").isLength({min:6}).withMessage("La confirmacion de la contraseña debe tener al menos 6 caracteres"),
    check("confPassword").custom((value,{req})=>{
        if(value!==req.body.password){
            
            throw new Error("Las contraseñas no coinciden");
        }
        return true;
    }),
    check("fechanac").notEmpty().withMessage("Ingresa tu fecha de nacimiento")
];
router.get("/", registroController.main);
router.post("/create", fileupload.any(), validateForm , registroController.crear)

module.exports=router;