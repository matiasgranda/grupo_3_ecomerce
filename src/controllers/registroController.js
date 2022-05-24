const path = require("path");
const fs = require("fs");
const actions = require("../data/actions")
let usuarios = JSON.parse(fs.readFileSync("./src/data/usuarios.json"));
const { validationResult } = require("express-validator");
const bcrypt = require('bcrypt');

let registroController = {
  main: (req, res) => {

    res.render(path.resolve(__dirname, "../views/registro.ejs"));

  },
  crear: (req, res, next) => {
    
    let nombreImagen;
    req.files.forEach((element) => {
      if(req.files.length > 0) {
        nombreImagen = "/img/" + element.filename
      } else {
        nombreImagen = "/img/user-image-default.png";
      }
    })
    
    let errors = validationResult(req);
    if (errors.isEmpty()) {
      let usuarioNuevo = {
        usuario: req.body.usuario,
        mail: req.body.mail,
        password: bcrypt.hashSync(req.body.password,10),
        pais: req.body.pais,
        fechanac: req.body.fechanac,
        imagen: nombreImagen
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