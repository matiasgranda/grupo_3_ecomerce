const path = require("path");

let productsController = {
    product: (req, res) => {
        res.render(path.resolve(__dirname, "../views/product.ejs"))
    }
};

module.exports = productsController;