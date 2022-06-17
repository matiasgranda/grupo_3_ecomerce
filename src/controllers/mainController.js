const path = require("path");
const fs = require("fs");
const session = require("express-session");
const db = require("../data/models/");

let mainController = {
  home: (req, res) => {
    let productos = JSON.parse(fs.readFileSync("./src/data/productos.json"));
    let sesion = session;
    let db = require("../data/models/");
    var productos2 = {};
    db.Publicaciones.findAll({
      where: { idcategoria: 1 },
      include: [
        {
          association: "imagenes",
          attributes: ["imagen"],
          where: { imagenprincipal: 1 },
        },
      ],
      orderBy: ["idpublicacion", "DESC"],
      limit: 4,
    }).then(function (tecnologia) {
      productos2.tecnologia = tecnologia;
      db.Publicaciones.findAll({
        where: { idcategoria: 2 },
        include: [
          {
            association: "imagenes",
            attributes: ["imagen"],
            where: { imagenprincipal: 1 },
          },
        ],
        orderBy: ["idpublicacion", "DESC"],
        limit: 4,
      }).then(function (moda) {
        productos2.moda = moda;
        db.Publicaciones.findAll({
          where: { idcategoria: 3 },
          include: [
            {
              association: "imagenes",
              attributes: ["imagen"],
              where: { imagenprincipal: 1 },
            },
          ],
          orderBy: ["idpublicacion", "DESC"],
          limit: 4,
        }).then(function (hogar) {
          productos2.hogar = hogar;
          db.Publicaciones.findAll({
            where: { idcategoria: 4 },
            include: [
              {
                association: "imagenes",
                attributes: ["imagen"],
                where: { imagenprincipal: 1 },
              },
            ],
            orderBy: ["idpublicacion", "DESC"],
            limit: 4,
          }).then(function (deportes) {
            productos2.deportes = deportes;
            db.Publicaciones.findAll({
              where: { idcategoria: 5 },
              include: [
                {
                  association: "imagenes",
                  attributes: ["imagen"],
                  where: { imagenprincipal: 1 },
                },
              ],
              orderBy: ["idpublicacion", "DESC"],
              limit: 4,
            }).then(function (movilidad) {
              productos2.movilidad = movilidad;
              db.Publicaciones.findAll({
                where: { idcategoria: 6 },
                include: [
                  {
                    association: "imagenes",
                    attributes: ["imagen"],
                    where: { imagenprincipal: 1 },
                  },
                ],
                orderBy: ["idpublicacion", "DESC"],
                limit: 4,
              }).then(function (ninios) {
                productos2.ninios = ninios;
                db.Imagenes.findAll({ where: { imagenprincipal: 1 } }).then((imagenes) => {
                  db.Publicaciones.findAll().then((publicaciones) => {
                    
                    res.render(path.resolve(__dirname, "../views/index.ejs"), {
                      productos: productos,
                      session: req.session,
                      imagenes,
                      publicaciones,
                      productos2: productos2
                    });
                  });
                });
              });
            });
          });
        });
      });
    });
    
  },

  cesta: (req, res) => {
    let sesion = session;
    res.render(path.resolve(__dirname, "../views/cesta.ejs"), {
      session: req.session,
    });
  },

  login: (req, res) => {
    res.render(path.resolve(__dirname, "../views/login.ejs"));
  },

  registro: (req, res) => {
    res.render(path.resolve(__dirname, "../views/registro.ejs"));
  },

  admin: (req, res) => {
    let sesion = session;
    let productos = JSON.parse(fs.readFileSync("./src/data/productos.json"));
    var productos2 = [];
    var categorias = [];
    db.Categorias.findAll().then((category) => {
      for(let i = 0; i < category.length; i++) {
        categorias.push(category[i].descripcion)
      }
    });
    db.Publicaciones.findAll({
      where: { idusuario: req.session.idusuario }
    }).then(async (publicaciones) => {
      for(let i = 0; i < publicaciones.length; i++) {
        productos2.push(publicaciones[i])
      }
      for(let i = 0; i < productos2.length; i++) {
        const categorias = await db.Categorias.findAll({
          where: {
            idcategoria: productos2[i].idcategoria
          }
        });
        const imagenes = await db.Imagenes.findAll({
          where: {
            idpublicacion: productos2[i].idpublicacion
          }
        });
        productos2[i].categoria = categorias[0].descripcion;
        productos2[i].imagen = imagenes[0].imagen
      }
      res.render(path.resolve(__dirname, "../views/admin.ejs"), {
        productos: productos,
        productos2: productos2,
        session: req.session,
        categorias: categorias
      });
    })    
    
  },
};

module.exports = mainController;
