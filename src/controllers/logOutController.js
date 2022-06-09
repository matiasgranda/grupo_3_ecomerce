let logOutController = {
  out: (req, res) => {
    res.clearCookie("userMail");
    res.clearCookie("amazona");
    req.session.destroy();
    req.session = null;
    return res.redirect('/');
  }
};

module.exports = logOutController;
