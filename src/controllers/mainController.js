const path = require("path");

let mainController = {
  home: (req, res) => {
    let productos = [
      [
        { id: 1, imagen: "/img/auriculares1.webp", titulo: "Auriculares Sony" },
        { id: 2, imagen: "/img/macbookair1.webp", titulo: "Macbook Air" },
        { id: 3, imagen: "/img/msi1.webp", titulo: "Notebook MSI" },
        { id: 4, imagen: "/img/ps51.webp", titulo: "Playstation 5" },
      ],
      [
        { id: 5, imagen: "/img/buzo1.webp", titulo: "Buzos" },
        { id: 6, imagen: "/img/campera1.webp", titulo: "Camperas" },
        { id: 7, imagen: "/img/zapatillas1.webp", titulo: "Calzado" },
        { id: 8, imagen: "/img/pantalon1.webp", titulo: "Pantalones" },
      ],
      [
        { id: 9, imagen: "/img/cama1.webp", titulo: "Cama Box" },
        { id: 10, imagen: "/img/silla1.webp", titulo: "Silla de Compedor" },
        { id: 11, imagen: "/img/sillon1.webp", titulo: "Sillón Esquinero" },
        { id: 12, imagen: "/img/mesa1.webp", titulo: "Mesa Ratona" },
      ],
      [
        { id: 13, imagen: "/img/pelota.jpg", titulo: "Pelota" },
        { id: 14, imagen: "/img/botines1.webp", titulo: "Botines" },
        { id: 15, imagen: "/img/pesa1.webp", titulo: "Mancuerna" },
        { id: 16, imagen: "/img/colchoneta1.webp", titulo: "Colchonetas" },
      ],
      [
        { id: 13, imagen: "/img/pelota.jpg", titulo: "Pelota" },
        { id: 14, imagen: "/img/botines1.webp", titulo: "Botines" },
        { id: 15, imagen: "/img/pesa1.webp", titulo: "Mancuerna" },
        { id: 16, imagen: "/img/colchoneta1.webp", titulo: "Colchonetas" },
      ],
      [
        { id: 13, imagen: "/img/pelota.jpg", titulo: "Pelota" },
        { id: 14, imagen: "/img/botines1.webp", titulo: "Botines" },
        { id: 15, imagen: "/img/pesa1.webp", titulo: "Mancuerna" },
        { id: 16, imagen: "/img/colchoneta1.webp", titulo: "Colchonetas" },
      ]
    ];
    res.render(path.resolve(__dirname, "../views/index.ejs"), {
      productos: productos,
    });
  },

  cesta: (req, res) => {
    res.render(path.resolve(__dirname, "../views/cesta.ejs"));
  },

  login: (req, res) => {
    res.render(path.resolve(__dirname, "../views/login.ejs"));
  },

  registro: (req, res) => {
    res.render(path.resolve(__dirname, "../views/registro.ejs"));
  },
};

module.exports = mainController;
