let db = require("../data/models/index");
const sequelize = require("sequelize");

let productosApiController = {

    "lista": async (req, res) => {

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
                products: products
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