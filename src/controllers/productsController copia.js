const path = require("path");
const fs = require("fs");
const actions = require("../data/actions");
const {
  parse
} = require("path");
const {
  Console
} = require("console");
const session = require("express-session");

let productos = JSON.parse(fs.readFileSync("./src/data/productos.json"));

let productsController = {
  product: (req, res) => {
    let sesion = session;
    let db = require("../data/models/");
    const Op = require("Sequelize").Op;
    var datosPublicacion = {};
    var productoSeleccionado = parseInt(req.params.id);
    if (productoSeleccionado > 0) {
      db.Publicaciones.findOne({
        include: [{
          association: "usuarios",
          attributes: ['usuario'],
          required: true
        }, {
          association: "categorias"
        }],
        where: {
          idpublicacion: productoSeleccionado
        },
      }).then((publicacion) => {
        if (publicacion) {
          datosPublicacion.publicacion = publicacion;
          db.Imagenes.findAll({
            where: {
              idpublicacion: publicacion.idpublicacion
            },
          }).then((imagenes) => {
            datosPublicacion.imagenes = imagenes;
          });
          db.Calificacion.findAll({
            where: {
              idpublicacion: publicacion.idpublicacion
            },
          }).then((calificaciones) => {
            datosPublicacion.calificaciones = calificaciones;
            db.Pregunta.findAll({
              include: [{
                  association: "usuarios",
                  attributes: ['usuario'],
                  required: true
                },
                {
                  association: "respuestas"
                },
              ],
              where: {
                idpublicacion: publicacion.idpublicacion
              },
            }).then((pregunta) => {
              datosPublicacion.preguntas = pregunta;
              db.Categorias.findAll({
                where: {
                  idcategoria: publicacion.idcategoria
                }
              }).then((categoria) => {
                datosPublicacion.categoria = categoria;
              })
              db.Marcas.findOne({
                where: {
                  idpublicacion: publicacion.idpublicacion
                },
                include: [{
                  association: "marcaproducto"
                }]
              }).then(marca => {
                datosPublicacion.marca = marca
                return res.render(
                  path.resolve(__dirname, "../views/product.ejs"), {
                    datosPublicacion: datosPublicacion,
                    session: req.session,
                  }
                );
              })
              //res.send(datosPublicacion.preguntas[0].respuestas[0].respuesta);

            });
          });
        } else {
          return res.redirect("/");
        }
      });
    } else {
      return res.redirect("/");
    }

  },

  create: (req, res) => {
    res.render(path.resolve(__dirname, "../views/productCreate.ejs"), {
      session: req.session,
    });
  },

  save: (req, res, next) => {
    let sesion = session;
    let nombreimagenOrig;
    let imagenesAdicionales = [];
    if (req.files.length > 0) {
      req.files.forEach((element) => {
        if (element.fieldname === "imagenPrincipal") {
          nombreimagenOrig = "/img/" + element.filename;
        } else {
          imagenesAdicionales.push("/img/" + element.filename);
        }
      });
    } else {
      const error = new Error("Debe agregar al menos la imagen principal");
      error.HttpStatusCode = 400;
      console.log("Debe agregar al menos la imagen principal");
      let mensaje = {
        codigo: 400,
        descripcion: "Debe ingresar una imagen principal",
      };
      res
        .status(400)
        .render(path.resolve(__dirname, "../views/productCreate.ejs"), {
          mensaje: mensaje,
          session: req.session,
        });
      return next(error);
    }
    let idMasAlto = 0;
    for (let i = 0; i < productos.length; i++) {
      for (let j = 0; j < productos[i].length; j++) {
        if (productos[i][j].id > idMasAlto) {
          idMasAlto = productos[i][j].id;
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
      masImagenes: imagenesAdicionales,
      marca: req.body.marca,
      color: req.body.color,
      comentarios: [],
      calificaciones: [],
    };
    switch (req.body.categoria) {
      case "tecnologia":
        productos[0].push(productoNuevo);
        break;
      case "moda":
        productos[1].push(productoNuevo);
        break;
      case "hogar":
        productos[2].push(productoNuevo);
        break;
      case "deportes":
        productos[3].push(productoNuevo);
        break;
      case "movilidad":
        productos[4].push(productoNuevo);
        break;
      case "ninios":
        productos[5].push(productoNuevo);
        break;
      default:
        break;
    }

    actions.addProduct(productos);

    res.status(200).redirect("/product/" + productoNuevo.id);
  },

  comentarios: (req, res) => {
    let comentarioNuevo = req.body.comentario;
    let calificacionNueva = req.body.calificacion;
    for (let i = 0; i < productos.length; i++) {
      for (let j = 0; j < productos[i].length; j++) {
        if (productos[i][j].id == parseInt(req.params.id)) {
          productos[i][j].comentarios.push(comentarioNuevo);
          productos[i][j].calificaciones.push(calificacionNueva);
        }
      }
    }
    actions.updateProduct(productos);

    res.redirect("/product/" + req.params.id);
  },

  pregunta: (req, res) => {
    let preguntaNueva = {
      usuario: "Cosme Fulanito",
      pregunta: req.body.pregunta,
    };

    console.log(preguntaNueva);

    for (let i = 0; i < productos.length; i++) {
      for (let j = 0; j < productos[i].length; j++) {
        if (productos[i][j].id == parseInt(req.params.id)) {
          if (productos[i][j].preguntas === undefined) {
            productos[i][j].preguntas = [];
          }
          productos[i][j].preguntas.push(preguntaNueva);
        }
      }
    }
    actions.updateProduct(productos);

    res.redirect("/product/" + req.params.id);
  },
  edit: (req, res) => {
    let sesion = req.session;
    let productoSeleccionado;
    for (let i = 0; i < productos.length; i++) {
      for (let j = 0; j < productos[i].length; j++) {
        if (productos[i][j].id == parseInt(req.params.id)) {
          productoSeleccionado = productos[i][j];
        }
      }
    }
    //return res.send(productoSeleccionado);
    res.render(path.resolve(__dirname, "../views/productEdit.ejs"), {
      producto: productoSeleccionado,
      session: sesion,
    });
  },
  editProduct: (req, res) => {
    // let sesion = req.session;
    if (req.files.length > 0) {
      req.files.forEach((element) => {
        if (element.fieldname === "imagenPrincipal") {
          nombreimagenOrig = "/img/" + element.filename;
        } else {
          imagenesAdicionales.push("/img/" + element.filename);
        }
      });
    } else {
      const error = new Error("Debe agregar al menos la imagen principal");
      error.HttpStatusCode = 400;
      console.log("Debe agregar al menos la imagen principal");
      let mensaje = {
        codigo: 400,
        descripcion: "Debe ingresar una imagen principal",
      };
    }
    console.log(req.files[0].filename);
    res.send(req.files[0].filename);
  },
};

module.exports = productsController;