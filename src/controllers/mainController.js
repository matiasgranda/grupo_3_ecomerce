const path = require("path");
const fs = require("fs");
const session = require("express-session");

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
                    console.log(productos2.tecnologia[1].imagenes[0].imagen)
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
    res.render(path.resolve(__dirname, "../views/admin.ejs"), {
      productos: productos,
      session: req.session,
    });
  },
};

module.exports = mainController;
