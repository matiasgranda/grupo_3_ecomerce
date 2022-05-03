const path = require("path");
const fs = require("fs");
let productos = JSON.parse(fs.readFileSync("./src/data/productos.json"));

let mainController = {
  home: (req, res) => {
    res.render(path.resolve(__dirname, "../views/index.ejs"), {
      productos: productos,
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
};

module.exports = mainController;
