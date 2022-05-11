const fs = require("fs");
const productosJson = ('./src/data/productos.json');
const usuariosJson = ("./src/data/usuarios.json")

const actions = {
    addProduct: (data) => {
        fs.writeFileSync(productosJson, JSON.stringify(data, null, 2), (err) => {
            if (err) throw err;
        });
    },
    updateProduct: (data) => {
        fs.writeFileSync(productosJson, JSON.stringify(data, null, 2), (err) => {
            if (err) throw err;
        });
    },

    updateUser: (data) => {
        fs.writeFileSync(usuariosJson, JSON.stringify(data, null, 2), (err) => {
            if (err) throw err;
        });
    },
};



module.exports = actions;