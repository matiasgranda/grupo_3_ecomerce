let db = require("../data/models/index");

let productosApiController = {

    "lista": async (req, res) => {

        const tecnologia = await db.Publicaciones.findAll({where: {idcategoria : 1}});
        const moda = await db.Publicaciones.findAll({where: {idcategoria : 2}})
        const hogar = await db.Publicaciones.findAll({where: {idcategoria : 3}})
        const deportes = await db.Publicaciones.findAll({where: {idcategoria : 4}})
        const movilidad = await db.Publicaciones.findAll({where: {idcategoria : 5}})
        const ninios = await db.Publicaciones.findAll({where: {idcategoria : 6}})

        let countByCategory = {
            tecnologia: tecnologia.length,
            moda: moda.length,
            hogar: hogar.length,
            deportes: deportes.length,
            movilidad: movilidad.length,
            ninios: ninios.length
        }

        const publicaciones = await db.Publicaciones.findAll()


        let arrayProductos = [];

        publicaciones.forEach(async producto => {

            const marca = await db.Marcas.findByPk(producto.idmarca)
                
                let product = {
                    id: producto.idpublicacion,
                    name: producto.titulo,
                    description: producto.descripcion,
                    relacion: ["color/es: "+producto.colores, "marca: "+marca.marca],
                    detail: "api/productos"+producto.idpublicacion
                }

                arrayProductos.push(product)
                console.log(arrayProductos)  
        })

            let result = {
                meta: {
                    status: 200,
                    url: "api/productos"
                },
                count: publicaciones.length,
                countByCategory: countByCategory,
                productos: arrayProductos
            }
            res.json(result)
            
            
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