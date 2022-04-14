const express = require("express");
const path = require("path");

const app = express();

const publicPath = (path.resolve(__dirname, "./public"));
app.use(express.static(publicPath));

app.get("/", (req, res) => {
    res.sendFile(path.resolve(__dirname, "./views/index.html"))
});

app.get("/login", (req, res) => {
    res.sendFile(path.resolve(__dirname, "./views/login.html"))
});

app.get("/registro", (req, res) => {
    res.sendFile(path.resolve(__dirname, "./views/registro.html"))
});

app.listen(3000, () => {
    console.log("Server running.");
});