const path = require("path");
const fs = require("fs");
const { parse } = require("path");
const { Console } = require("console");
const { validationResult } = require("express-validator");
const bcrypt = require("bcrypt");
const { SlowBuffer } = require("buffer");

let loginController = {
  login: (req, res) => {
    res.render(path.resolve(__dirname, "../views/login.ejs"));
  },

  loginCheck: (req, res) => {
    let db = require("../data/models/index.js");
    
    db.Usuarios.findAll().then(function (usuarios) {
      let errors = validationResult(req);
      if (errors.isEmpty()) {
        for (let i = 0; i < usuarios.length; i++) {
          if (
            (usuarios[i].usuario == req.body.user ||
              usuarios[i].mail == req.body.user) &&
            bcrypt.compareSync(req.body.password, usuarios[i].password) && usuarios[i].habilitado==1
          ) {
            
            req.session.user = usuarios[i].usuario;
            req.session.mail = usuarios[i].mail;
            req.session.pais = usuarios[i].pais || "Argentina";
            req.session.imagen = usuarios[i].imagen;
            req.session.logged = "si";
            if (req.body.recordar) {
              res.cookie("userMail", usuarios[i].mail, {
                maxAge: 1000 * 60 * 60,
              });
            }
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
    });
  },
};

module.exports = loginController;
