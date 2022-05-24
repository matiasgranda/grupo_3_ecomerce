const path = require("path");
const fs = require("fs");
const actions = require("../data/actions");
const { parse } = require("path");
const { Console } = require("console");
const session = require("express-session");

let registroController = {
  main: (req, res) => {
    let sesion = req.session;
    return res.render(path.resolve(__dirname, "../views/cesta.ejs"), {
      session: sesion,
    });
  },
  add: (req, res) => {
    let sesion = req.session;
    if (!isNaN(req.params.id)) {
      //let basketProducts = [];
      let productList = JSON.parse(
        fs.readFileSync("./src/data/productos.json")
      );
      let product = {
        idProd: req.params.id,
        cantidad: req.body.cantidad,
      };
      
      if (!req.session.basketProducts) {
        req.session.basketProducts = [];
      }
      
        for (let i = 0; i < productList.length; i++) {
          for (let j = 0; j < productList[i].length; j++) {
            if (productList[i][j].id == product.idProd) {
              productoSeleccionado = productList[i][j];
              let productAdded = {
                titulo: productList[i][j].titulo,
                id: productList[i][j].id,
                cantidad: product.cantidad,
                precio: productList[i][j].precio,
                descripcion: productList[i][j].descripcion,
                imagen: productList[i][j].imagen,
              };
              req.session.basketProducts.push(productAdded);
            }
          }
        }
     
      
      return res.render(path.resolve(__dirname, "../views/cesta.ejs"), {
        session: sesion,
      });
    }
    return res.send("Error en el código de producto");
  },
  delete: (req,res) => {
    let sesion = req.session;
    sesion.basketProducts=sesion.basketProducts.filter(product=> product.id!=req.params.id);
    return res.render(path.resolve(__dirname, "../views/cesta.ejs"), {
      session: sesion,
    });
  }
};

module.exports = registroController;
