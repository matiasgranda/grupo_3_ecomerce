const session = require("express-session");
const path = require("path");
let categoriasController = {
    list: (req, res) => {
        let sesion = req.session;
    return res.render(path.resolve(__dirname, "../views/categorias.ejs"), {
      session: sesion,
    });
    },
    listCategoria: (req, res) => {
        let sesion = req.session;
        return res.render(path.resolve(__dirname, "../views/categorias.ejs"), {
          session: sesion,
        });
    }
}

module.exports = categoriasController;