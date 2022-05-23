const express = require("express");
const path = require("path");
const app = express();
const methodOverride=require('method-override');
let productRoutes = require("./routes/product.js");
let mainRoutes = require("./routes/main.js");
let registroRoutes=require("./routes/registro");
let loginRoutes=require("./routes/login");
let cestaRoutes=require("./routes/cesta");
const exp = require("constants");
let session=require("express-session");
const publicPath = (path.resolve(__dirname, "../public"));
var cookieParser = require('cookie-parser')

app.use(cookieParser());
app.use(session({
    name : 'amazona',
    secret : 'amazonasecret',
    resave :false,
    saveUninitialized: true,
    cookie : {
            maxAge:(1000 * 60 * 100)
    }      
}));
app.use(express.static(publicPath));
app.use(methodOverride('_method')); /* sobreescribir methods para dar soporte a put y delete 
que no esta en todos los navegadores*/


app.use(express.urlencoded({extended:false}));
app.use(express.json());

app.set("view engine", "ejs");

/****************** Rutas *****************************/
app.use("/product", productRoutes);
app.use("/", mainRoutes);
app.use("/registro",registroRoutes);
app.use("/login",loginRoutes)
app.use("/cesta",cestaRoutes)
/******************************************************/
app.use((req,res,next)=>{
    res.status(404).render('../src/views/not-found');
})
app.listen(3000, () => {
    console.log("Server running.");
});