const path = require("path");
const fs = require("fs");
const session = require("express-session");


let mainController = {
  home: (req, res) => {
    let productos = JSON.parse(fs.readFileSync("./src/data/productos.json"));
    let sesion=session;
    let db = require("../data/models/");
    db.Imagenes.findAll({where: {imagenprincipal: 1}}).then((imagenes) => {
      db.Publicaciones.findAll().then((publicaciones) => {
        res.render(path.resolve(__dirname, "../views/index.ejs"), {
          productos: productos,session:req.session, imagenes, publicaciones
        });
      })
      
    })
    
  },

  cesta: (req, res) => {
    let sesion=session;
    res.render(path.resolve(__dirname, "../views/cesta.ejs"),{session:req.session});
  },

  login: (req, res) => {
    res.render(path.resolve(__dirname, "../views/login.ejs"));
  },

  registro: (req, res) => {
    res.render(path.resolve(__dirname, "../views/registro.ejs"));
  },

  admin: (req, res) => {
    let sesion=session;
    let productos = JSON.parse(fs.readFileSync("./src/data/productos.json"));
    res.render(path.resolve(__dirname, "../views/admin.ejs"), { productos: productos,session:req.session });;
  }
};

module.exports = mainController;
