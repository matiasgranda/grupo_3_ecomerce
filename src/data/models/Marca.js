module.exports = (sequelize, dataTypes) => {
    let alias = "Marcas";
    let cols = {
      idmarca: {
        type: dataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      idpublicacion: { type: dataTypes.STRING },
      marca: { type: dataTypes.STRING },
    };
    let config = {
      tableName: "marcas",
      timestamps: false,
    };
  
    const Marca = sequelize.define(alias, cols, config);
    Marca.associate = function (models) {
      Marca.belongsTo(models.Publicaciones, {
        as: "marcaproducto",
        foreignKey: "idpublicacion",
      });
    };

    return Marca;
  };