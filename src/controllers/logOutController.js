let logOutController = {
  out: (req, res) => {
    res.clearCookie("userMail");
    req.session.destroy();
    return res.redirect('/');
  }
};

module.exports = logOutController;
