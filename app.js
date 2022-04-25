const express = require("express");
const path = require("path");
let productRoutes=require("./routes/products.js");
let mainRoutes=require("./routes/main.js");
const app = express();

const publicPath = (path.resolve(__dirname, "./public"));
app.use(express.static(publicPath));

/****************** Rutas *****************************/
app.use("/product",productRoutes)
app.use('/',mainRoutes);
/******************************************************/

app.listen(3000, () => {
    console.log("Server running.");
});