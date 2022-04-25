const express = require("express");
const path = require("path");
let productRoutes=require("./routes/products.js");
let mainRoutes=require("./routes/main.js");
const app = express();

const publicPath = (path.resolve(__dirname, "./public"));
app.use(express.static(publicPath));

app.use("/product",productRoutes)
app.use('/',mainRoutes);

/*app.get("/", (req, res) => {
    res.sendFile(path.resolve(__dirname, "./views/index.html"))
});*/
app.get("/cesta", (req, res) => {
    res.sendFile(path.resolve(__dirname, "./views/cesta.html"))
});

app.get("/login", (req, res) => {
    res.sendFile(path.resolve(__dirname, "./views/login.html"))
});

app.get("/registro", (req, res) => {
    res.sendFile(path.resolve(__dirname, "./views/registro.html"))
});


app.listen(3000, () => {
    console.log("Server running.");
});