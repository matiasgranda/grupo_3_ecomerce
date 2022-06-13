module.exports = (sequelize, dataTypes) => {
  let alias = "Usuarios";
  let cols = {
    idusuario: {
      type: dataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    nombre: { type: dataTypes.STRING },
    apellido: { type: dataTypes.STRING },
    telefono: { type: dataTypes.STRING },
    fechanac: { type: dataTypes.DATE },
    email: { type: dataTypes.STRING },
    usuario: { type: dataTypes.STRING },
    password: { type: dataTypes.STRING },
    imagen: { type: dataTypes.STRING },
    habilitado: { type: dataTypes.INTEGER },
  };
  let config = {
    tableName: "usuarios",
    timestamps: false,
  };

  const Usuario = sequelize.define(alias, cols, config);
  Usuario.associate = function (models) {
    Usuario.hasMany(models.Pregunta, {
      as: "preguntas",
      foreignKey: "idusuario",
    });
    Usuario.hasMany(models.Publicaciones, {
      as: "publicaciones",
      foreignKey: "idusuario",
    });
  };

  return Usuario;
};
