module.exports = (sequelize, dataTypes) => {
    let alias='Imagenes';
    let cols={
        idimagen:{
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        imagenprincipal:{ type: dataTypes.INTEGER },
        imagen:{ type: dataTypes.STRING },
        idpublicacion:{ type: dataTypes.INTEGER }
        
    };
    let config={
        tableName:'imagenes',
        timestamps:false
    }

    const Imagen=sequelize.define(alias,cols,config);
    Imagen.associate=function(models){
        Imagen.belongsTo(models.Publicaciones,{
            as:'publicacion',
            foreignKey:'idpublicacion'
        });
    }
    return Imagen;
}