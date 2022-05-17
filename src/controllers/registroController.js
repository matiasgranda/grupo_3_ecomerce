const path = require("path");
const fs = require("fs");
const actions = require("../data/actions")
let usuarios = JSON.parse(fs.readFileSync("./src/data/usuarios.json"));
const { validationResult } = require("express-validator");

let registroController = {
  main: (req, res) => {

    res.render(path.resolve(__dirname, "../views/registro.ejs"));

  },
  crear: (req, res) => {
    let errors = validationResult(req)
    if (errors.isEmpty()) {
      let usuarioNuevo = {
        usuario: req.body.usuario,
        mail: req.body.mail,
        password: req.body.password,
        pais: req.body.pais,
        fechanac: req.body.fechanac
      }
      usuarios.push(usuarioNuevo);

      actions.updateUser(usuarios);

      res.redirect("/login");

    } else if (!errors.isEmpty()) {
      res.render(path.resolve(__dirname, "../views/registro.ejs"), { errors: errors.array(), old: req.body });
    }
  }
};

module.exports = registroController;