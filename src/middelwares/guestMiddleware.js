function guestMiddleware(req,res,next) {
    if(req.session.user) {
        res.redirect('perfil');
    }
    next();
}
module.exports = guestMiddleware;