module.exports = (sequelize, dataTypes) => {
    let alias='Marcas';
    let cols={
        idmarca:{
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        marca:{ type: dataTypes.STRING },
        idcategoria:{ type: dataTypes.INTEGER }
        
    };
    let config={
        tableName:'marcas',
        timestamps:false
    }

    const Marca=sequelize.define(alias,cols,config);

    return Marca;
}