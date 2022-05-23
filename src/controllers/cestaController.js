const path = require("path");
const fs = require("fs");
const actions = require("../data/actions");
const { parse } = require("path");
const { Console } = require("console");
const session = require("express-session");

let registroController = {
  main: (req, res) => {

    let sesion=session;
    return res.render(path.resolve(__dirname, "../views/cesta.ejs"),{session:sesion});

  },
  add: (req, res) => {
      
    if(!isNaN(req.params.id)){
        
        let product={
            idProd:req.params.id,
            cantidad:req.body.cantidad,
        } 
        if(req.session.products){
            req.session.products.push(product);
        }else {
            req.session.products=[];
            req.session.products.push(product);
        }
         
        console.log(req.session.products);
        return res.render(path.resolve(__dirname, "../views/cesta.ejs"),{session:req.session}); 
    }
        return res.send("Error en el código de producto") 
    }
    
   
   
  };

module.exports = registroController;