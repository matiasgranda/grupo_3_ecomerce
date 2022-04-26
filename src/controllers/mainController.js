const path = require("path");

let mainController = {

    home: (req, res) => {
        res.render(path.resolve(__dirname, "../views/index.ejs"))
    },

    cesta: (req, res) => {
        res.render(path.resolve(__dirname, "../views/cesta.ejs"))
    },

    login: (req, res) => {
        res.render(path.resolve(__dirname, "../views/login.ejs"))
    },

    registro: (req, res) => {
        res.render(path.resolve(__dirname, "../views/registro.ejs"))
    }

};

module.exports = mainController;