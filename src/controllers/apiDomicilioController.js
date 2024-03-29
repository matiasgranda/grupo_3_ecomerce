const path = require("path");
const actions = require("../data/actions");
const session = require("express-session");
const db = require("../data/models");


let apiDomicilioController = {


  getdomicilio: async (req, res) => {

    let sesion = req.session;
    if (!isNaN(parseInt(req.params.id))) {
      let domicilio = await db.Domicilios.findOne({
        where: {
          idusuario: sesion.idusuario,
          iddomicilios: req.params.id,
        },
        include: [
          {
            association: "pais",
            attributes: ["PaisNombre"],
          },
          {
            association: "provincia",
            attributes: ["Provincia"],
          },
        ],
      });
      return res.send(domicilio);
    }
  },

  setdomicilio: async (req, res) => {
    const db = require("../data/models/");
    let sesion = req.session;
    console.log(req.body.codigoDomicilio);
    const domicilio = await db.Domicilios.findOne({
      where: { idusuario: req.session.idusuario }
    })


    let check = 0;
    if (req.body.checkboxSetDefault == 'on') {
      check = 1;
    }
    let datosusuario = {
      alias: req.body.inputAlias,
      idpais: req.body.inputPais,
      idprovincia: req.body.inputProvincia,
      calle: req.body.inputCalle,
      altura: req.body.inputAlturaCalle,
      piso: req.body.inputPiso || null,
      depto: req.body.inputDepto || null,
      cp: req.body.inputCodigoPostal
    }
    
    db.Domicilios.update(datosusuario, { where: { iddomicilios: req.body.codigoDomicilio, idusuario: req.session.idusuario } })


    return res.status(200).send("Ok")
    
  },

  setdefault: async (req, res) => {
    let sesion = req.session;

    const domicilio = await db.Domicilios.update({
      entregadefault: 0
    }, {
      where: { idusuario: sesion.idusuario }
    });

    const domiciliodefault = await db.Domicilios.update({
      entregadefault: 1
    }, {
      where: { idusuario: sesion.idusuario, iddomicilios: req.body.codigoDomicilio }
    });

    res.status(200).send("Ok");

  },
  createdomicilio: async (req, res) => {
    let sesion = req.session;
    const db = require("../data/models/");

    let datosusuario = {
      idusuario: sesion.idusuario,
      alias: req.body.inputAlias,
      idpais: req.body.inputPais,
      idprovincia: req.body.inputProvincia,
      calle: req.body.inputCalle,
      altura: req.body.inputAlturaCalle,
      piso: req.body.inputPiso || null,
      depto: req.body.inputDepto || null,
      cp: req.body.inputCodigoPostal
    }

    console.log(req.body.checkboxSetDefault)

    const domicilioNuevo = await db.Domicilios.create(datosusuario)

    if(req.body.checkboxSetDefault == "on") {
      domicilioNuevo.update({
        entregadefault: 1
      }, {
        where: { idusuario: sesion.idusuario, iddomicilios: domicilioNuevo.iddomicilios }
      })
    }

   res.status(200).send("Ok")

  }

}

module.exports = apiDomicilioController