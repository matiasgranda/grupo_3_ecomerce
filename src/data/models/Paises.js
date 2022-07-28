module.exports = (sequelize, dataTypes) => {
    let alias='Paises';
    let cols={
        idpais:{
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        PaisNombre:{ type: dataTypes.STRING }
        
    };
    let config={
        tableName:'paises',
        timestamps:false
    }

    const Paises=sequelize.define(alias,cols,config);

    return Paises;
}