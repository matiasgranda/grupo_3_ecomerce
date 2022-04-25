let express=require("express");
let router=express.Router();

router.get("/", (req, res) => {
    res.sendFile(path.resolve(__dirname, "./views/product.html"))
});



module.exports=router;