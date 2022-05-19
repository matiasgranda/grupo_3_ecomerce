const path = require("path");
const fs = require("fs");
const { parse } = require("path");
const { Console } = require("console");
const { validationResult } = require("express-validator");
let loginController = {
  login: (req, res) => {
    res.render(path.resolve(__dirname, "../views/login.ejs"));
  },

  loginCheck: (req, res) => {
    let errors = validationResult(req);
    console.log(errors.mapped());
    if (errors.isEmpty()) {
      let usuarios = JSON.parse(fs.readFileSync("./src/data/usuarios.json"));
      res.send(usuarios);
      
    }else {
        res.render(path.resolve(__dirname, "../views/login.ejs"), { errors: errors.mapped(), old: req.body });
    }
  },
};

module.exports = loginController;
