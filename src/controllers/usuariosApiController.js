let db = require("../data/models/index");

let usuariosApiController = {

    "lista": (req, res) => {

        db.Usuarios.findAll()
        .then((usuarios) => {

            let arrayUsuarios = [];

            usuarios.forEach(usuario => {
                let user = {
                    id: usuario.idusuario,
                    nombre: usuario.nombre,
                    email: usuario.email,
                    detail: "api/usuarios/"+usuario.idusuario
                }
                arrayUsuarios.push(user)
            });

            let result = {
                meta: {
                    status: 200,
                    total: usuarios.length,
                    url: "api/usuarios"
                },
                data: arrayUsuarios 
            }
            res.json(result)
        })

    },

    "detalle": (req, res) => {
        db.Usuarios.findByPk(req.params.id)
        .then((usuario) => {
            let result = {
                meta: {
                    status: 200,
                    url: "api/usuario/id"
                },
                data: usuario
            }
            res.json(result)
        })
    }

};

module.exports = usuariosApiController;