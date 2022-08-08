let db = require("../data/models/index");
const sequelize = require("sequelize");

let productosApiController = {

    "lista": async (req, res) => {

        const sumarPrecioProductos = await db.Publicaciones.findAll({
            attributes: [ 
                [sequelize.fn("SUM", sequelize.col("precio")), "total"] ]
        })
        console.log(sumarPrecioProductos)

        const sumarCategorias = await db.Publicaciones.findAll({
            group: "idcategoria",
            attributes:["idcategoria"],
            include: [
                {
                    association: "categorias",
                    attributes: [
                        "descripcion",
                        [sequelize.fn("COUNT", sequelize.col("Publicaciones.idcategoria")), "total"]
                    ]
                }
            ]
        })
        let categoriasTotal = [];
        sumarCategorias.forEach(categoria => {
            let result = {
                categoria: categoria.categorias.descripcion,
                total: categoria.categorias.total
            }
            categoriasTotal.push(result)
        })

        const lastAdded = await db.Publicaciones.findOne({
            order: [[ "idpublicacion", "desc" ]], include: [{ association: "categorias", attributes: ["descripcion"]}, { association: "usuarios", attributes: ["usuario", "email"] }]
        })

        db.Publicaciones.findAll({
            include: [{
                association: "marcas", attributes: ["marca"], required: true
            }]
        }).then((publicaciones) => {
            var products = [];
            publicaciones.forEach(producto => {

                let publicacion = {
                    id: producto.idpublicacion,
                    name: producto.titulo,
                    description: producto.descripcion,
                    array: ["colores: "+producto.colores, "Marca: "+producto.marcas.marca],
                    detail: "api/productos/"+producto.idpublicacion
                }

                products.push(publicacion)
            })
            let result = {
                countByCategory: categoriasTotal,
                products: products,
                lastAdded: lastAdded
            }
    
            res.json(result)
        })
            
    },

    "detalle": (req, res) => {
        db.Publicaciones.findByPk(req.params.id)
            .then((producto) => {
                let result = {
                    meta: {
                        status: 200,
                        url: "api/producto/id"
                    },
                    data: producto
                }
                res.json(result)
            })
    }

};

module.exports = productosApiController;