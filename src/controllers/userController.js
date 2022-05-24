const path = require("path");
const fs = require("fs");
const actions = require("../data/actions");
const session = require("express-session");

let userController = {
    main: (req, res) => {
        let sesion = req.session;
        return res.render(path.resolve(__dirname, "../views/user.ejs"), {
      session: sesion,
    });
    }
}

module.exports = userController