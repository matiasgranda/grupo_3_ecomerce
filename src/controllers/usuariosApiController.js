let db = require("../data/models/index");
const bcrypt = require("bcrypt");

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
                    detail: "api/usuarios/"+usuario.idusuario,
                    imagen: "http://localhost:3000/img/profiles/"+usuario.imagen
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
    },

    "adminLogin": (req, res, next) => {
        var user = {
            loginUsername: req.body.loginUsername,
            loginPassword: req.body.loginPassword
        }

        if(user.loginUsername === process.env.USER_ADMIN && user.loginPassword === process.env.PASS_ADMIN) {
            next();
        } else {
            throw new Error("Invalid credentials")
        }
        return res.json()

    },

    "modificardatos": async (req, res) => {
        const user = await db.Usuarios.findByPk(req.session.idusuario)
        await user.update({
            nombre: req.body.nombre,
            apellido: req.body.apellido,
            telefono: req.body.telefono,
            fechanac: req.body.fechanac,
            email: req.body.email
        });

        return res.status(200).send("Ok")
    }

};

module.exports = usuariosApiController;