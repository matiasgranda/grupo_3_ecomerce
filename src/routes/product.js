let express = require("express");
const path = require("path");
let router = express.Router();
const multer=require('multer');
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
let productsController = require("../controllers/productsController")

router.get("/create", productsController.create);
router.get("/:id", productsController.product);
router.post("/create", fileupload.any(),productsController.save);
router.post("/:id", productsController.comentarios);




module.exports = router;