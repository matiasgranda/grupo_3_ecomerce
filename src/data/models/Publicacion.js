module.exports = (sequelize, dataTypes) => {
  let alias = "Publicaciones";
  let cols = {
    idpublicacion: {
      type: dataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    precio: { type: dataTypes.DECIMAL },
    descripcion: { type: dataTypes.TEXT },
    idusuario: { type: dataTypes.INTEGER },
    habilitado: { type: dataTypes.INTEGER },
    idcategoria: { type: dataTypes.INTEGER },
    idsubcategoria: { type: dataTypes.INTEGER },
    fechapublicacion: { type: dataTypes.DATE },
    reportado: { type: dataTypes.INTEGER },
    titulo: { type: dataTypes.STRING },
    detallepublicacion: { type: dataTypes.TEXT },
    stock: { type: dataTypes.INTEGER },
    marca: { type: dataTypes.STRING },
    colores: { type: dataTypes.STRING }
  };
  let config = {
    tableName: "publicaciones",
    timestamps: false,
  };

  const Publicacion = sequelize.define(alias, cols, config);
  Publicacion.associate = function (models) {
    Publicacion.belongsTo(models.Usuarios, {
      as: 'usuarios',
      foreignKey: 'idusuario'
  });
    Publicacion.hasMany(models.Imagenes, {
      as: "imagenes",
      foreignKey: "idpublicacion"
    })

    Publicacion.belongsTo(models.Categorias, {
      as: "categorias",
      foreignKey: "idcategoria"
    })
    
  };

  return Publicacion;
};
