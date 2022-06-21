const path = require("path");
const fs = require("fs");
const actions = require("../data/actions");
const session = require("express-session");

let userController = {
    main: (req, res) => {
      const db = require("../data/models/");
      let sesion = req.session;
      db.Publicaciones.findAll({
        where: { idusuario: req.session.idusuario }}).then(publicaciones => {
          db.Usuarios.findOne({
            where: { idusuario: req.session.idusuario }}).then(usuario => {
              return res.render(path.resolve(__dirname, "../views/user.ejs"), {
                session: sesion,
                publicaciones: publicaciones,
                usuario: usuario
                });
            })
        })
    }
}

module.exports = userController