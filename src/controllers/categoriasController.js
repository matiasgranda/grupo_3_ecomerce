const session = require("express-session");
const path = require("path");
let categoriasController = {
  list: async (req, res) => {
    let db = require("../data/models/index.js");
    const Op = require("Sequelize").Op;

    const categorias = await db.Categorias.findAll({
      order: [["descripcion"]],
      attributes: ["idcategoria", "descripcion"],
      where: { habilitado: 1 },
    });
    let sesion = req.session;
    return res.render(path.resolve(__dirname, "../views/categorias.ejs"), {
      session: sesion,
      categorias: categorias,
    });
  },
  listCategoria: async (req, res) => {
    let db = require("../data/models/index.js");
    const categorias = await db.Categorias.findAll({
      order: [["descripcion"]],
      attributes: ["idcategoria", "descripcion"],
      where: { habilitado: 1 },
    });
    let sesion = req.session;
    if (!isNaN(req.params.idcategoria)) {
      const productos = await db.Publicaciones.findAll({
        include: [
            {
              association: "imagenes",
              attributes: ["imagen"],
              required: true,
              where: {imagenprincipal: 1}
            },
            
          ],
        where: { idcategoria: req.params.idcategoria },
      });
      return res.render(path.resolve(__dirname, "../views/categorias.ejs"), {
        session: sesion,
        categorias: categorias,
        productos: productos,
      });
    }
    return res.render(path.resolve(__dirname, "../views/categorias.ejs"), {
      session: sesion,
      categorias: categorias,
    });
  },
};

module.exports = categoriasController;
