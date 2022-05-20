const path = require("path");
const fs = require("fs");


let mainController = {
  home: (req, res) => {
    let productos = JSON.parse(fs.readFileSync("./src/data/productos.json"));
    let sesion=req.session;
    res.render(path.resolve(__dirname, "../views/index.ejs"), {
      productos: productos,session:sesion
    });
  },

  cesta: (req, res) => {
    res.render(path.resolve(__dirname, "../views/cesta.ejs"));
  },

  login: (req, res) => {
    res.render(path.resolve(__dirname, "../views/login.ejs"));
  },

  registro: (req, res) => {
    res.render(path.resolve(__dirname, "../views/registro.ejs"));
  },

  admin: (req, res) => {
    let productos = JSON.parse(fs.readFileSync("./src/data/productos.json"));
    res.status(400).render(path.resolve(__dirname, "../views/admin.ejs"), { productos: productos });
  }
};

module.exports = mainController;
