let express = require("express");
const path = require("path");
let router = express.Router();
const multer=require('multer');
const log=require('../middelwares/logMiddelware');
let multerDiskStorage=multer.diskStorage({
    destination:(req,file,callback)=>{
        let folder=path.join(__dirname,'../../public/img');
        callback(null,folder);
    },
    filename:(req,file,callback)=>{
        let imageName=Date.now()+path.extname(file.originalname);
        callback(null,imageName);
    }

});
let fileupload=multer({storage:multerDiskStorage})
let productsController = require("../controllers/productsController");
const logMiddelware = require("../middelwares/logMiddelware");

router.get("/create", productsController.create);
router.get("/edit/:id", productsController.edit);
router.put("/edit/:id", productsController.editProduct);
router.get("/:id", productsController.product);
router.post("/create", fileupload.any(),log,productsController.save);
router.post("/:id/comentario", productsController.comentarios);
router.post("/:id/pregunta", productsController.pregunta);






module.exports = router;