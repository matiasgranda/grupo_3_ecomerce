const path = require("path");
const fs = require("fs");
const { validationResult } = require("express-validator");
const session= require("express-session");

let registroController = {
  main: (req, res) => {

    let sesion=session;
    res.render(path.resolve(__dirname, "../views/cesta.ejs"),{session:sesion});

  },
  add: (req, res) => {
    let sesion=session;
    let producto={
        idProd:3,
        cantidad:1
    } 
    if(session.products){
        session.products.push(producto);
    }else {
        session.products=[];
        session.products.push(producto);
    }
    console.log(session.products);
    res.render(path.resolve(__dirname, "../views/cesta.ejs"),{session:sesion}); 
   
  }

};

module.exports = registroController;