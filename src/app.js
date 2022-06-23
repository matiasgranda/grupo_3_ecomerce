const express = require("express");

const path = require("path");
const app = express();
const methodOverride=require('method-override');
let productRoutes = require("./routes/product.js");
let mainRoutes = require("./routes/main.js");
let registroRoutes=require("./routes/registro");
let loginRoutes=require("./routes/login");
let cestaRoutes=require("./routes/cesta");
let categoriasRoutes=require("./routes/categorias");
let userRoutes = require("./routes/users.js");
let logOutRoutes = require("./routes/logout.js");
let autoSignInMiddleware =require("./middelwares/autoSignInMiddleware");
const exp = require("constants");
let session=require("express-session");
const publicPath = (path.resolve(__dirname, "../public"));
var cookieParser = require('cookie-parser')

app.use(cookieParser());
app.use(session({
    name : 'amazona',
    secret : 'amazonasecret1234#',
    resave: false,
    saveUninitialized: true,
    cookie : {
            maxAge:(1000 * 60 * 60)
    }      
}));

app.use(express.static(publicPath));

app.use(autoSignInMiddleware);
app.use(express.urlencoded({extended:false}));
app.use(express.json());
app.use(methodOverride('_method')); /* sobreescribir methods para dar soporte a put y delete 
que no esta en todos los navegadores*/
app.set("view engine", "ejs");

/****************** Rutas *****************************/
app.use("/", mainRoutes);
app.use("/logout",logOutRoutes);
app.use("/product", productRoutes);
app.use("/registro",registroRoutes);
app.use("/login",loginRoutes);
app.use("/cesta",cestaRoutes);
app.use("/perfil", userRoutes);
app.use("/categorias", categoriasRoutes);
/******************************************************/
app.use((req,res,next)=>{
    res.status(404).render('../src/views/not-found');
    next();
})
app.listen(3000, () => {
    console.log("Server running.");
});