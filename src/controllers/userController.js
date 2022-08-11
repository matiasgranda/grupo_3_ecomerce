const path = require("path");
const fs = require("fs");
const actions = require("../data/actions");
const session = require("express-session");
const domicilio = require("../data/models/domicilio");
const { Console } = require("console");

let userController = {
    main: async (req, res) => {
      const db = require("../data/models/");
      let sesion = req.session;
      const domicilios = await db.Domicilios.findAll({where: {idusuario: req.session.idusuario}, include: [{association: "pais", attributes: ["PaisNombre"]}, {association: "provincia", attributes: ["Provincia"]}]});
      const provincias = await db.Provincias.findAll({
        attributes: ["Provincia", "idProvincia"]
      });
      const paises = await db.Paises.findAll({
        attributes: ["PaisNombre", "idpais"]
      });
      const compras = await db.Ventas.findAll({
        where: { idusuario: req.session.idusuario}
      });
      
      db.Publicaciones.findAll({
        where: { idusuario: req.session.idusuario }}).then(publicaciones => {
          db.Usuarios.findOne({
            where: { idusuario: req.session.idusuario }}).then(usuario => {
              return res.render(path.resolve(__dirname, "../views/user.ejs"), {
                session: sesion,
                publicaciones: publicaciones,
                usuario: usuario,
                paises: paises,
                provincias: provincias,
                domicilio: domicilios,
                compras: compras
                });
            })
        })
    },
    cambiarDireccion: async (req, res) => {
      const db = require("../data/models/");
      let sesion = req.session;

      const domicilio = await db.Domicilios.findOne({
        where: { idusuario: req.session.idusuario }
      })      

      if(domicilio != undefined) {
        db.Domicilios.upsert({
          iddomicilios: domicilio.iddomicilios,
          idusuario: req.session.idusuario,
          idpais: req.body.direccionPais ,
          idprovincia: req.body.direccionProvincia ,
          calle: req.body.direccionCalle ,
          altura: req.body.direccionAltura ,
          piso: req.body.direccionPiso ,
          depto: req.body.direccionDepto ,
          cp: req.body.direccionCp
        })
      } else {
        db.Domicilios.create({
          idusuario: req.session.idusuario,
          idpais: req.body.direccionPais ,
          idprovincia: req.body.direccionProvincia ,
          calle: req.body.direccionCalle ,
          altura: req.body.direccionAltura ,
          piso: req.body.direccionPiso ,
          depto: req.body.direccionDepto ,
          cp: req.body.direccionCp
        })
      }

      return res.redirect("/perfil")

    }
}

module.exports = userController