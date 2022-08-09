let db = require("../data/models/index");

let apiDetalleVenta = {

    "detalle": async (req, res) => {
        const idBuscado = req.params.id
        const detalleVenta = await db.DetalleVenta.findAll({
            where: { idventa: idBuscado }
        })
        
        res.json(detalleVenta)
    }
};

module.exports = apiDetalleVenta