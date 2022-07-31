module.exports = (sequelize, dataTypes) => {
    let alias='MediosDePago';
    let cols={
        idmediosdepago:{
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        nombre:{ type: dataTypes.STRING },
        activo:{ type: dataTypes.INTEGER}      
    };
    let config={
        tableName:'mediosdepago',
        timestamps:false
    }

    const MediosDePago=sequelize.define(alias,cols,config);

    return MediosDePago;
}