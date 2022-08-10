let db = require("../data/models/index");
const sequelize = require("sequelize");
const { response } = require("express");

let productosApiController = {

    "lista": async (req, res) => {
        
        try {

            const sumarPrecioProductos = await db.Publicaciones.findAll({
                attributes: [[ db.sequelize.literal('sum(precio * stock)'), "total" ]]
            })

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

            const publicaciones = await db.Publicaciones.findAll({
                include: [{association: "marcas", attributes: ["marca"]}, { association: "imagenes", attributes: ["imagen"], groupBy: "idpublicacion" }]
            })

            var products = [];
            publicaciones.forEach(producto => {

                let publicacion = {
                    id: producto.idpublicacion,
                    name: producto.titulo,
                    description: producto.descripcion,
                    array: ["colores: "+producto.colores, "Marca: "+producto.marcas.marca],
                    detail: "api/productos/"+producto.idpublicacion,
                    imagenes: []
                }
                
                for(let i = 0; i < producto.imagenes.length; i++) {
                    publicacion.imagenes.push("http://localhost:3000/img/"+producto.imagenes[i].imagen)
                }
                
                products.push(publicacion)

            })
            let result = {
                countByCategory: categoriasTotal,
                products: products,
                lastAdded: lastAdded,
                amountInProducts: sumarPrecioProductos[0]
            }
    
            res.json(result)
            
            
        } catch(error) {
            res.status(400).json(error)
        }
    }, /* */

    "detalle": async (req, res) => {

        try {

            const publicaciones = await db.Publicaciones.findByPk(req.params.id);

            if(!response.ok) {
                throw new Error(res.status)
            }

            const result = {
                meta: {
                    status: 200,
                    url: "api/producto/id"
                },
                data: publicaciones
            }

            return res.json(result)

        } catch(error) {
            return res.status(400).json(error)
        }
    }

};

module.exports = productosApiController;