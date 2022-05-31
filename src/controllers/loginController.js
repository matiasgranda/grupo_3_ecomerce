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
    const Op = require('Sequelize').Op
    
    db.Usuarios.findOne({where:{
      
      [Op.or]: [{ email: req.body.user },{usuario:req.body.user}],
      [Op.and]: [{habilitado:1}]

    }}).then(function (usuarios) {
      let errors = validationResult(req);
      if (errors.isEmpty()) {
        
        if (usuarios) {
          if (
            (usuarios.usuario == req.body.user ||
              usuarios.mail == req.body.user) &&
            bcrypt.compareSync(req.body.password, usuarios.password) && usuarios.habilitado==1
          ) {
            
            req.session.user = usuarios.usuario;
            req.session.mail = usuarios.email;
            req.session.pais = usuarios.pais || "Argentina";
            req.session.imagen = usuarios.imagen;
            req.session.logged = "si";
            if (req.body.recordar) {
              res.cookie("userMail", usuarios.email, {
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
