const path = require("path");
const fs = require("fs");
let productos = JSON.parse(fs.readFileSync("./src/data/productos.json"));

let productsController = {
  product: (req, res) => {
    
    res.render(path.resolve(__dirname, "../views/product.ejs"), { productos: productos });
  },
  
  create: (req, res) => {

    res.render(path.resolve(__dirname, "../views/productCreate.ejs"))
  }
};

module.exports = productsController;
