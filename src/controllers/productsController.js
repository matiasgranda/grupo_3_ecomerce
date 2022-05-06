const path = require("path");
const fs = require("fs");
const {
  parse
} = require("path");
let productos = JSON.parse(fs.readFileSync("./src/data/productos.json"));

function retornarNombreArchivo(ruta){
  let arrPath=ruta.split("img\\");
  return "/img/"+arrPath[arrPath.length-1];
}

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
    
    let nombreimagenOrig;
    let imagenesAdicionales=[];
    req.files.forEach(element => {
      if(element.fieldname==="imagenPrincipal"){
        nombreimagenOrig=retornarNombreArchivo(element.path);
      }else {
        imagenesAdicionales.push(retornarNombreArchivo(element.path));
      }
    });
    
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
      imagen: nombreimagenOrig,
      masImagenes:imagenesAdicionales
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
  }, 

  comentarios: (req, res) => {
    let comentarioNuevo = req.body.comentario;
    for (let i = 0; i < productos.length; i++) {
      for (let j = 0; j < productos[i].length; j++) {
        if (productos[i][j].id == parseInt(req.params.id)) {
          productos[i][j].comentarios.push(comentarioNuevo)
        }
      }
    }
    let addComent = JSON.stringify(productos, null, 2);
    fs.writeFile('./src/data/productos.json', addComent, (err) => {
      if (err) throw err;
      console.log('comentario agregado');
    });
    res.redirect("/product/" + req.params.id)
  }

};

module.exports = productsController;