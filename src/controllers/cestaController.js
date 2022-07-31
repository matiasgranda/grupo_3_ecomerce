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
const db = require("../data/models/");

let cestaController = {
  main: (req, res) => {
    let sesion = req.session;

    if (sesion.basketProducts != undefined) {
      let cesta = sesion.basketProducts;
      var totalProductos = 0;
      cesta.forEach((producto) => {
        totalProductos = totalProductos + producto.cantidad;
      });
    }
    req.session.totalProductos = totalProductos;

    return res.render(path.resolve(__dirname, "../views/cesta.ejs"), {
      session: sesion,
    });
  },
  add: (req, res) => {
    let sesion = req.session;

    if (!isNaN(parseInt(req.params.id))) {
      //let basketProducts = [];
      let productList = JSON.parse(
        fs.readFileSync("./src/data/productos.json")
      );
      let product = {
        idProd: parseInt(req.params.id),
        cantidad: parseInt(req.body.cantidad),
      };

      if (!req.session.basketProducts) {
        req.session.basketProducts = [];
      }
      var existe = false;

      for (let i = 0; i < req.session.basketProducts.length; i++) {
        if (req.session.basketProducts[i].id == product.idProd) {
          existe = true;
          if (
            parseInt(
              req.session.basketProducts[i].cantidad +
              parseInt(req.body.cantidad)
            ) <= req.session.basketProducts[i].stock
          ) {
            req.session.basketProducts[i].cantidad =
              parseInt(req.session.basketProducts[i].cantidad) +
              parseInt(req.body.cantidad);
            return res.render(path.resolve(__dirname, "../views/cesta.ejs"), {
              session: sesion,
            });
          } else {
            return res.render(path.resolve(__dirname, "../views/cesta.ejs"), {
              session: sesion,
              mensaje: {
                mensaje: "La cantidad agregada supera a la existencia",
                id: product.idProd,
              },
            });
          }
        }
      }

      if (!existe) {
        let db = require("../data/models/");
        const Op = require("Sequelize").Op;
        db.Publicaciones.findOne({
          where: {
            idpublicacion: parseInt(req.params.id)
          },
          include: [{
            association: "imagenes",
            attributes: ["imagen"],
            where: {
              imagenprincipal: 1
            },
          }, ],
        }).then((publicacion) => {
          if (publicacion) {
            let productAdded = {
              titulo: publicacion.titulo,
              id: publicacion.idpublicacion,
              cantidad: product.cantidad,
              precio: publicacion.precio,
              descripcion: publicacion.descripcion,
              imagen: publicacion.imagenes[0].imagen,
              stock: publicacion.stock,
            };
            req.session.basketProducts.push(productAdded);
            //recalcular total de productos en la cesta
            if (sesion.basketProducts != undefined) {
              let cesta = sesion.basketProducts;
              var totalProductos = 0;
              cesta.forEach((producto) => {
                totalProductos = totalProductos + producto.cantidad;
              });
            }
            sesion.totalProductos = totalProductos;

            return res.render(path.resolve(__dirname, "../views/cesta.ejs"), {
              session: sesion,
            });
          } else {
            return res.send("Producto inexistente en db");
          }
        });
      }
    } else {
      return res.send("Error en el código de producto");
    }
  },
  delete: (req, res) => {
    let sesion = req.session;
    sesion.basketProducts = sesion.basketProducts.filter(
      (product) => product.id != req.params.id
    );
    if (sesion.basketProducts != undefined) {
      let cesta = sesion.basketProducts;
      var totalProductos = 0;
      cesta.forEach((producto) => {
        totalProductos = totalProductos + producto.cantidad;
      });
    }
    sesion.totalProductos = totalProductos;
    return res.render(path.resolve(__dirname, "../views/cesta.ejs"), {
      session: sesion,
    });
  },
  update: (req, res) => {
    let sesion = req.session;
    if (
      !isNaN(parseInt(req.params.id)) &&
      !isNaN(parseInt(req.params.cantidad))
    ) {
      if (sesion.basketProducts != undefined) {
        req.session.basketProducts.forEach((producto) => {
          if (producto.id == req.params.id) {
            producto.cantidad = parseInt(req.params.cantidad);
          }
        });

        let cesta = sesion.basketProducts;
        var totalProductos = 0;
        cesta.forEach((producto) => {
          totalProductos = totalProductos + producto.cantidad;
        });
        sesion.totalProductos = totalProductos;
        let mensaje = {
          mensaje: "ok"
        };
        return res.status(200).send(mensaje);
      }
      let mensaje = {
        mensaje: "error"
      };
      return res.status(200).send(mensaje);
    }
    return res.render(path.resolve(__dirname, "../views/cesta.ejs"), {
      session: sesion,
    });
  },
  checkout: (req, res) => {
    let sesion = req.session;
    if (req.session.user === undefined) {
      res.redirect("/login");
    }

    db.Domicilios.findOne({
      where: {
        idusuario: sesion.idusuario
      },
      include: [{
          association: "pais",
          attributes: ["PaisNombre"]
        },
        {
          association: "provincia",
          attributes: ["Provincia"]
        },
      ],
    }).then(async (domicilio) => {

      const paises = await db.Paises.findAll({
        attributes: ["PaisNombre"]
      });
      const paisesFilter = paises.filter(pais => pais.PaisNombre !== domicilio.pais.PaisNombre);

      const provincias = await db.Provincias.findAll({
        attributes: ["Provincia"]
      });
      const provinciasFilter = provincias.filter(provincia => provincia.Provincia !== domicilio.provincia.Provincia)
      const mediosPago = await db.MediosDePago.findAll({
        where: {activo:1},
        attributes: ["nombre", "idmediosdepago"]
      });
      console.log(mediosPago)
      return res.render(path.resolve(__dirname, "../views/checkout.ejs"), {
        session: sesion,
        domicilio: domicilio,
        paises: paisesFilter,
        provincias: provinciasFilter,
        mediosPago: mediosPago
      });
    });
  },

  buy: async (req, res) => {
    let sesion = req.session;
    if (req.session.user === undefined) {
      res.redirect("/login");
    }
    console.log(req.body.usuarioDomicilioAlturaCalle)
    let productosAComprar = [];

    sesion.basketProducts.forEach(producto => {

      productosAComprar.push(producto.id)
    })

    const productosEnDb = await db.Publicaciones.findAll({
      where: {
        idpublicacion: productosAComprar
      },
      attributes: ["idpublicacion", "stock"]
    });

    var error = false;

    productosEnDb.forEach(producto => {
      productosAComprar.forEach(prodcutoEnCesta => {
        if ((producto.id === prodcutoEnCesta.id) && producto.cantidad < prodcutoEnCesta.stock) {
          error = true;
        }
      })
    });
    console.log(error);


    /*  if(!error) {

        
        db.Ventas.create()
      }

      if(error) {

      }*/

    res.send(productosEnDb)




  }
};

module.exports = cestaController;