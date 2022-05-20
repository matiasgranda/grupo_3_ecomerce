const path = require("path");
const fs = require("fs");
const { parse } = require("path");
const { Console } = require("console");
const { validationResult } = require("express-validator");
const session = require("express-session");
let loginController = {
  login: (req, res) => {
    res.render(path.resolve(__dirname, "../views/login.ejs"));
  },

  loginCheck: (req, res) => {
    let errors = validationResult(req);
    
    if (errors.isEmpty()) {
      let usuarios = JSON.parse(fs.readFileSync("./src/data/usuarios.json"));
      for (let usuario of usuarios){
          if((usuario.usuario==req.body.user || usuario.mail==req.body.user) && usuario.password==req.body.password){
              console.log("ok")
              req.session.user=usuario.usuario;
              req.session.mail=usuario.mail;
              req.session.pais=usuario.pais;
              session.user=usuario.usuario;
              session.mail=usuario.mail;
              session.pais=usuario.pais;
          };
      }
      res.redirect('/');
    }else {
        res.render(path.resolve(__dirname, "../views/login.ejs"), { errors: errors.mapped(), old: req.body });
    }
  },
};

module.exports = loginController;
