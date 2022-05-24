function guestMiddleware(req,res,next) {
    console.log("lalala");
    if(req.session.user) {
        console.log("lalala");
        res.redirect('perfil');
    }
    next();
}
module.exports = guestMiddleware;