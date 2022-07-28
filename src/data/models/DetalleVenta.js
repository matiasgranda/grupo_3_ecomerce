module.exports = (sequelize, dataTypes) => {
    let alias='DetalleVenta';
    let cols={
        iddetalleventa:{
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        cantidad:{ type: dataTypes.INTEGER },
        producto:{ type: dataTypes.STRING },
        precio:{ type: dataTypes.INTEGER },
        idventa:{ type: dataTypes.INTEGER }
        
    };
    let config={
        tableName:'detalleventa',
        timestamps:false
    }

    const Ventas=sequelize.define(alias,cols,config);
    return Ventas;
}