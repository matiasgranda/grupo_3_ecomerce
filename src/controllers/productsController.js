const path = require("path");
const fs = require("fs");
const actions = require("../data/actions");
const { parse } = require("path");
const { Console, log } = require("console");
const session = require("express-session");
const db = require("../data/models/");

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
        include: [
          {
            association: "usuarios",
            attributes: ["usuario"],
            required: true,
          },
        ],
        where: {
          idpublicacion: productoSeleccionado,
          visible: 1,
        },
      }).then(async (publicacion) => {
        if (publicacion) {
          datosPublicacion.publicacion = publicacion;
          const imagenes = await db.Imagenes.findAll({
            where: {
              idpublicacion: publicacion.idpublicacion,
            },
            order: [["imagenprincipal", "DESC"]],
          });
          const calificacion = await db.Calificacion.findAll({
            where: {
              idpublicacion: publicacion.idpublicacion,
            },
          });
          const pregunta = await db.Pregunta.findAll({
            include: [
              {
                association: "usuarios",
                attributes: ["usuario"],
                required: true,
              },
              {
                association: "respuestas"
              },
            ],
            where: {
              idpublicacion: publicacion.idpublicacion,
            },
          });
          const categorias = await db.Categorias.findAll({
            where: {
              idcategoria: publicacion.idcategoria,
            },
          });
          const marca = await db.Marcas.findAll({
            where: { idmarca: publicacion.idmarca },
          });
          datosPublicacion.imagenes = imagenes;
          datosPublicacion.calificaciones = calificacion;
          datosPublicacion.preguntas = pregunta;
          datosPublicacion.categorias = categorias;
          datosPublicacion.marca = marca;

          return res.render(path.resolve(__dirname, "../views/product.ejs"), {
            datosPublicacion: datosPublicacion,
            session: req.session,
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
    db.Marcas.findAll().then((marca) => {
      db.Categorias.findAll().then((categoria) => {
        res.render(path.resolve(__dirname, "../views/productCreate.ejs"), {
          session: req.session,
          categoria: categoria,
          marca: marca,
        });
      });
    });
  },

  save: (req, res, next) => {
    let sesion = session;
    let db = require("../data/models/");
    let nombreimagenOrig;
    let imagenesAdicionales = [];
    if (req.files.length > 0) {
      req.files.forEach((element) => {
        if (element.fieldname === "imagenPrincipal") {
          nombreimagenOrig = element.filename;
        } else {
          imagenesAdicionales.push(element.filename);
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
    console.log(imagenesAdicionales);
    let productoNuevo = {
      titulo: req.body.titulo,
      descripcion: req.body.descripcion,
      detallepublicacion: req.body.detallepublicacion,
      idcategoria: req.body.categoria,
      precio: req.body.precio,
      idmarca: req.body.marca,
      colores: req.body.color,
      idusuario: req.session.idusuario,
    };

    db.Publicaciones.create(productoNuevo).then(() => {
      db.Publicaciones.findAll({
        order: [["idpublicacion", "DESC"]],
        limit: 1,
      }).then((idProductoNuevo) => {
        console.log(idProductoNuevo[0].idpublicacion);

        let imagenesAInsertar = [];
        for (let i = 0; i < imagenesAdicionales.length; i++) {
          let imagenesExtra = {
            imagen: imagenesAdicionales[i],
            idpublicacion: idProductoNuevo[0].idpublicacion,
          };
          imagenesAInsertar.push(imagenesExtra);
        }

        if (imagenesAInsertar.length > 0) {
          db.Imagenes.bulkCreate(imagenesAInsertar);
        }

        let imagenPrincipal = {
          imagen: nombreimagenOrig,
          imagenprincipal: 1,
          idpublicacion: idProductoNuevo[0].idpublicacion,
        };
        db.Imagenes.create(imagenPrincipal);

        res.status(200).redirect("/product/" + imagenPrincipal.idpublicacion);
      });
    });
  },

  comentarios: (req, res) => {
    let calificacionNueva = {
      comentario: req.body.comentario,
      idpublicacion: req.params.id,
      idusuario: req.session.idusuario,
      calificacion: req.body.calificacion,
    };
    db.Calificacion.create(calificacionNueva);
    return res.redirect("/product/" + req.params.id);
  },

  pregunta: (req, res) => {
    let preguntaNueva = {
      idusuario: req.session.idusuario,
      pregunta: req.body.pregunta,
      idpublicacion: req.params.id,
      fechapregunta: "2022-06-20",
    };

    db.Pregunta.create(preguntaNueva);
    return res.redirect("/product/" + req.params.id);
  },

  respuesta: async (req, res) => {
    const timeElapsed = Date.now();
    const today = new Date(timeElapsed);
    const fecha = today.toLocaleDateString() + " " + today.getHours() + ":" + ('0' + today.getMinutes()).slice(-2) + ":" + ('0' + today.getSeconds()).slice(-2);

    let respuesta = {
      idpregunta: req.params.resId,
      respuesta: req.body.respuestaInput,
      fecharepuesta: fecha
    }

    const nuevaRespuesta = await db.Respuesta.create(respuesta);

    return res.redirect("/product/" + req.params.id);

  },

  edit: async (req, res) => {
    let sesion = req.session;
    const Op = require("Sequelize").Op;

    let productoSeleccionado = await db.Publicaciones.findOne({
      where: { idpublicacion: req.params.id },
      include: [{ association: "marcas", attributes: ["marca"] }],
    });
    const imagenes = await db.Imagenes.findAll({
      where: { [Op.and]: [{ idpublicacion: req.params.id }] },
    });

    const marcas = await db.Marcas.findAll();
    productoSeleccionado.imagenes = imagenes;
    productoSeleccionado.marcas = marcas;
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
  delete: (req, res) => {
    let sesion = req.session;
    let db = require("../data/models/");
    if (req.params.id && !isNaN(req.params.id)) {
      const productoSeleccionado = parseInt(req.params.id);
      db.Publicaciones.findOne({
        where: { idusuario: req.session.idusuario, visible: 1 },
      }).then((publicaciones) => {
        if (publicaciones.visible == 1) {
          if (
            db.Publicaciones.update(
              { visible: 0 },
              { where: { idpublicacion: productoSeleccionado } }
            )
          ) {
            res
              .status(200)
              .send({ resultado: "ok", mensaje: "Producto eliminado" });
            return;
          } else {
            res.status(403).send({
              resultado: "error",
              mensaje: "Error al realizar el update",
            });
            return;
          }
        } else {
          res.status(403).send({
            resultado: "error",
            mensaje: "Publicacion eliminada anteriormente",
          });
        }
      });
    } else {
      res
        .status(403)
        .send({ resultado: "error", mensaje: "Producto no se pudo eliminar" });
      return;
    }
  },
  deleteImage: async (req, res) => {
    const db = require("../data/models/");
    const fs = require("fs");

    const imageID = parseInt(req.params.idimage);
    const idpublicacion = req.params.idpublicacion;
    const userID = req.session.idusuario;
    const image = await db.Imagenes.findByPk(imageID, {
      include: {
        association: "publicacion",
        attributes: ["idpublicacion", "idusuario"],
        required: true,
      },
    });

    if (
      image &&
      image.imagen.length > 0 &&
      image.publicacion.idusuario == userID
    ) {
      const path = "public/img/" + image.imagen;

      fs.unlink(path, (err) => {
        if (err) {
          console.error(err);
          return;
        }
        db.Imagenes.destroy({ where: { idimagen: imageID } });
        res.status(200).json({ resultado: "ok", mensaje: "Imagen eliminada" });
      });
    } else {
      res
        .status(403)
        .json({ resultado: "error", mensaje: "Imagen no se pudo eliminar" });
    }
  },
  search: async (req, res) => {
    //res.send(req.params.keyword);
    let sesion = req.session;
    const db = require("../data/models/");
    const Op = require("Sequelize").Op;
    var filtrado=false;
    if (req.params.category != undefined) {
      filtrado=true;
      var productos = await db.Publicaciones.findAll({
        attributes: [
          "idpublicacion",
          "titulo",
          "precio",
          "idmarca",
          "idcategoria",
          "idsubcategoria",
          "stock"
        ],
        include: [{ association: "marcas", attributes: ["marca"], required: true },
        { association: "categorias", attributes: ["descripcion", "idcategoria"], required: true },
        {
          association: "imagenes",
          attributes: ["imagen"],
          where: { imagenprincipal: 1 },
          require: true
        }
        ],

        where: {
          idcategoria: Number(req.params.category),
          visible: 1,

          titulo: {
            [Op.like]: "%" + req.params.keyword + "%",
          },
        },
      });
    }
    else {
      var productos = await db.Publicaciones.findAll({
        attributes: [
          "idpublicacion",
          "titulo",
          "precio",
          "idmarca",
          "idcategoria",
          "idsubcategoria",
          "stock"
        ],
        include: [{ association: "marcas", attributes: ["marca"], required: true },
        { association: "categorias", attributes: ["descripcion", "idcategoria"], required: true },
        {
          association: "imagenes",
          attributes: ["imagen"],
          where: { imagenprincipal: 1 },
          require: true
        }
        ],

        where: {
          
          visible: 1,

          titulo: {
            [Op.like]: "%" + req.params.keyword + "%",
          },
        },
      });
    }
    let uniqueCategory = [];

    for (let i = 0; i < productos.length; i++) {

      const found = uniqueCategory.some(item => item.titulo === productos[i].categorias.descripcion);
      
      if (!found) {
        let categoria = {
          titulo: productos[i].categorias.descripcion,
          id: productos[i].categorias.idcategoria
        }
        uniqueCategory.push(categoria)
      }
    }

    res.render(path.resolve(__dirname, "../views/search.ejs"), {
      productos: productos,
      session: sesion,
      uniqueCategory: uniqueCategory,
      filtrado:filtrado
    });

    //res.send(productos)
  },
};

module.exports = productsController;
