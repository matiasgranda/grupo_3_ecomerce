
function autoSignInMiddleware(req, res, next) {
  if (req.cookies.userMail && !req.session.logged) {
    console.log("Usuario en cookie pero no logueado. Logueado automáticamente: " + req.cookies.userMail);
    let db = require("../data/models/index.js");
    const Op = require("Sequelize").Op;
    db.Usuarios.findOne({
      where: {
        email: req.cookies.userMail,
      },
    }).then(function (usuarios) {
      if (usuarios) {
        if (usuarios.email == req.cookies.userMail && usuarios.habilitado == 1) {
          
          req.session.idusuario = usuarios.idusuario
          req.session.user = usuarios.usuario;
          req.session.mail = usuarios.email;
          req.session.pais = usuarios.pais || "Argentina";
          req.session.imagen = usuarios.imagen;
          req.session.logged = "si";
          if (req.body.recordar) {
            res.cookie("userMail", usuarios.email, {
              maxAge: 1000 * 60 * 60,
            });
          }
          //console.log(req.session)
          //return res.redirect("/");
        }
      }
    });
  }
  next();
}
module.exports = autoSignInMiddleware;
