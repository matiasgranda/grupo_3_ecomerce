const path = require("path");
const fs = require("fs");
const actions = require("../data/actions");
let usuarios = JSON.parse(fs.readFileSync("./src/data/usuarios.json"));
const { validationResult } = require("express-validator");
const bcrypt = require("bcrypt");

let registroController = {
  main: (req, res) => {
    res.render(path.resolve(__dirname, "../views/registro.ejs"), {
      session: req.session
    });
  },
  crear: (req, res, next) => {
    const sequelize = require("sequelize");
    const db = require("../data/models");
    //const Op = require("Sequelize").Op;
    var nombreImagen = "";
    if (req.files.length > 0) {
      req.files.forEach((element) => {
        nombreImagen = element.filename;
      });
    } else {
      nombreImagen = "default.png";
    }

    let errors = validationResult(req);
    if (errors.isEmpty()) {
      let usuarioNuevo = {
        usuario: req.body.usuario,
        nombre: req.body.nombre,
        apellido: req.body.apellido,
        email: req.body.mail,
        telefono: req.body.telefono,
        habilitado: 1,
        password: bcrypt.hashSync(req.body.password, 10),
        //pais: req.body.pais,
        fechanac: req.body.fechanac,
        imagen: nombreImagen,
      };

      db.Usuarios.create(usuarioNuevo);
      //actions.updateUser(usuarios);
      res.redirect("/login");
    } else if (!errors.isEmpty()) {
      res.render(path.resolve(__dirname, "../views/registro.ejs"), {
        errors: errors.array(),
        old: req.body,
      });
    }
  },
};

module.exports = registroController;
