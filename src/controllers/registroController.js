const path = require("path");

let registroController = {
  main: (req, res) => {
    
    res.render(path.resolve(__dirname, "../views/registro.ejs"));

  },
  crear:(req,res)=>{
      let usuarioNevo= {
      usuario:req.body.user,
      mail:req.body.email,
      password:req.body.password,
      confpassword:req.body.confpassword,
      pais:req.body.pais,
      fechanac:req.body.fechanac
      }
      res.redirect("/registro")
    //res.send(usuarioNevo);
  }
};

module.exports = registroController;
