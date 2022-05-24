const session = require("express-session");
const path = require("path");
function authMiddleware(req, res, next) {
    if(req.session.user == undefined) {
        res.redirect('login')
    } else if (req.session.user != undefined) {
        next();
    }
}

module.exports = authMiddleware;