function guestMiddleware(req,res,next) {
    console.log("lalala");
    if(req.session.user!=undefined) {
        res.redirect('perfil');
    }
    next();
}
module.exports = guestMiddleware;