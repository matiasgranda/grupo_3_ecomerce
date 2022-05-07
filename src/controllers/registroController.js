const path = require("path");
const fs = require("fs");
let usuarios = JSON.parse(fs.readFileSync("./src/data/usuarios.json"));

let registroController = {
  main: (req, res) => {

    res.render(path.resolve(__dirname, "../views/registro.ejs"));

  },
  crear: (req, res) => {
    let usuarioNuevo = {
      usuario: req.body.usuario,
      mail: req.body.mail,
      password: req.body.password,
      pais: req.body.pais,
      fechanac: req.body.fechanac
    }
    usuarios.push(usuarioNuevo);

    let usuarioAgregado = JSON.stringify(usuarios, null, 2);
    fs.writeFile('./src/data/usuarios.json', usuarioAgregado, (err) => {
      if (err) throw err;
      console.log('Usuario agregado');
    });
    res.redirect("/login");
    
  }
};

module.exports = registroController;