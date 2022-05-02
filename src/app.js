const express = require("express");
const path = require("path");
const app = express();
const methodOverrude=require('method-override');
let productRoutes = require("./routes/product.js");
let mainRoutes = require("./routes/main.js");
let registroRoutes=require("./routes/registro");
const exp = require("constants");


const publicPath = (path.resolve(__dirname, "../public"));
app.use(express.static(publicPath));
app.use(methodOverrude('_method'));
app.use(express.urlencoded({extended:false}));
app.use(express.json());

app.set("view engine", "ejs");

/****************** Rutas *****************************/
app.use("/product", productRoutes);
app.use("/", mainRoutes);
app.use("/registro",registroRoutes);
/******************************************************/

app.listen(3000, () => {
    console.log("Server running.");
});