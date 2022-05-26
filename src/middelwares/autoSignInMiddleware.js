const path = require("path");
const fs = require("fs");
function autoSignInMiddleware(req, res, next) {
  if (req.cookies.userMail && !req.session.logged) {
    console.log("Usuario en cookie pero no logueado. Logueado automáticamente: "+req.cookies.userMail);
    let usuarios = JSON.parse(fs.readFileSync("./src/data/usuarios.json"));
    for (let i = 0; i < usuarios.length; i++) {
      if (usuarios[i].mail == req.cookies.userMail) {
        req.session.user = usuarios[i].usuario;
        req.session.mail = usuarios[i].mail;
        req.session.pais = usuarios[i].pais;
        req.session.imagen = usuarios[i].imagen;
        req.session.logged = "si";
       
        return res.redirect("/");
      }
    }
  }
  next();
}
module.exports = autoSignInMiddleware;
