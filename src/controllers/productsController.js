const path = require("path");
const fs = require("fs");
const {
  parse
} = require("path");
let productos = JSON.parse(fs.readFileSync("./src/data/productos.json"));



let productsController = {

  product: (req, res) => {
    let productoSeleccionado;
    for (let i = 0; i < productos.length; i++) {
      for (let j = 0; j < productos[i].length; j++) {
        if (productos[i][j].id == parseInt(req.params.id)) {
          productoSeleccionado = productos[i][j]
        }
      }
    }

    res.render(path.resolve(__dirname, "../views/product.ejs"), {
      productos: productoSeleccionado
    });
  },

  create: (req, res) => {

    res.render(path.resolve(__dirname, "../views/productCreate.ejs"))
  },

  save: (req, res) => {
    let idMasAlto = 0;
    for (let i = 0; i < productos.length; i++) {
      for (let j = 0; j < productos[i].length; j++) {
        if (productos[i][j].id > idMasAlto) {
          idMasAlto = productos[i][j].id
        }
      }
    }
    let productoNuevo = {
      id: idMasAlto + 1,
      titulo: req.body.titulo,
      descripcion: req.body.descripcion,
      categoria: req.body.categoria,
      precio: req.body.precio,
      imagen: "/img/" + req.body.imagen
    }
    switch (req.body.categoria) {
      case "tecnologia":
        productos[0].push(productoNuevo)
        break;
      case "moda":
        productos[1].push(productoNuevo)
        break;
      case "hogar":
        productos[2].push(productoNuevo)
        break;
      case "deportes":
        productos[3].push(productoNuevo)
        break;
      case "movilidad":
        productos[4].push(productoNuevo)
        break;
      case "ninios":
        productos[5].push(productoNuevo)
        break;
      default:
        break;
    }
    let datosNuevos = JSON.stringify(productos, null, 2);
    fs.writeFile('./src/data/productos.json', datosNuevos, (err) => {
      if (err) throw err;
      console.log('Datos agregados');
    });
    res.redirect("/home")
  }

};

module.exports = productsController;