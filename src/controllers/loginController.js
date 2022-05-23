const path = require("path");
const fs = require("fs");
const { parse } = require("path");
const { Console } = require("console");
const { validationResult } = require("express-validator");
const session = require("express-session");
const bcrypt = require("bcrypt");

let loginController = {
  login: (req, res) => {
    res.render(path.resolve(__dirname, "../views/login.ejs"));
  },

  loginCheck: (req, res) => {
    let errors = validationResult(req);
    if (errors.isEmpty()) {
      let usuarios = JSON.parse(fs.readFileSync("./src/data/usuarios.json"));
      for (let i = 0; i < usuarios.length; i++) {
        if (
          (usuarios[i].usuario == req.body.user ||
            usuarios[i].mail == req.body.user) &&
          bcrypt.compareSync(req.body.password, usuarios[i].password)) {
          //console.log("ok")
          req.session.user = usuarios[i].usuario;
          req.session.mail = usuarios[i].mail;
          req.session.pais = usuarios[i].pais;
          // req.session.user=usuario.usuario;
          // req.session.mail=usuario.mail;
          // req.session.pais=usuario.pais;
          //session.user = usuarios[i].usuario;
          //session.mail = usuarios[i].mail;
          //session.pais = usuarios[i].pais;
          return res.redirect("/");
        }
      }
      let mensaje = {
        msg: "Usuario o contraseña incorrectos",
      };
      return res.render(path.resolve(__dirname, "../views/login.ejs"), {
        errors: errors.mapped(),
        old: req.body,
        mensaje: mensaje,
      });
    } else {
      return res.render(path.resolve(__dirname, "../views/login.ejs"), {
        errors: errors.mapped(),
        old: req.body,
      });
    }
  },
};

module.exports = loginController;
