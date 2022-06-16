module.exports = (sequelize, dataTypes) => {
    let alias='Calificacion';
    let cols={
        idcomentario:{
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        comentario:{ type: dataTypes.STRING },
        idpublicacion:{ type: dataTypes.INTEGER },
        idusuario:{ type: dataTypes.INTEGER },
        calificacion:{ type: dataTypes.INTEGER },
        reportado:{ type: dataTypes.INTEGER },
        habilitado:{ type: dataTypes.INTEGER }

        
    };
    let config={
        tableName:'calificaciones',
        timestamps:false
    }

    const Calificaion=sequelize.define(alias,cols,config);

    return Calificaion;
}