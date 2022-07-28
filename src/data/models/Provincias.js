module.exports = (sequelize, dataTypes) => {
    let alias='Provincias';
    let cols={
        idProvincia:{
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        PaisCodigo:{ type: dataTypes.INTEGER },
        Provincia: { type: dataTypes.STRING }
        
    };
    let config={
        tableName:'provincias',
        timestamps:false
    }

    const Provincias=sequelize.define(alias,cols,config);

    return Provincias;
}