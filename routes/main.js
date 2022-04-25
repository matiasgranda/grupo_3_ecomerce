let express=require("express");
const path = require("path");
let router=express.Router();
console.log(__dirname, "./views/home.html");
/*app.get("/", (req, res) => {
    res.sendFile(path.resolve(__dirname, "./views/index.html"))
});*/

router.get("/", (req, res) => {
    res.sendFile(path.resolve(__dirname, "../views/index.html"))
});
router.get("/cesta", (req, res) => {
    res.sendFile(path.resolve(__dirname, "../views/cesta.html"))
});

router.get("/login", (req, res) => {
    res.sendFile(path.resolve(__dirname, "../views/login.html"))
});

router.get("/registro", (req, res) => {
    res.sendFile(path.resolve(__dirname, "../views/registro.html"))
});

module.exports=router;