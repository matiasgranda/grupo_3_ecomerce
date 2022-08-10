module.exports = {
  development: {
    username: "root",
    password: "123456",
    database: "amazona_db",
    host: "127.0.0.1",
    dialect: "mysql",
    logging: true, //para que no se muestren las consultas en la consola
  },
  test: {
    username: "root",
    password: "",
    database: "amazona_db",
    host: "127.0.0.1",
    dialect: "mysql",
  },
  production: {
    username: "root",
    password: "",
    database: "",
    host: "127.0.0.1",
    dialect: "mysql",
  },
};
