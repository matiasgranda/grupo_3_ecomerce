const session = require("express-session");

function authMiddleware(req, res, next) {
    if(req.session.user == undefined) {
        res.send("Debes iniciar sesion para entrar a esta pagina.")
    } else if (req.session.user != undefined) {
        next();
    }
}

module.exports = authMiddleware;