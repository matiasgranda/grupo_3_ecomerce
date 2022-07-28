module.exports = (sequelize, dataTypes) => {

    let alias='Ventas';

    let cols={
        idventa:{
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        idusuario:{ type: dataTypes.INTEGER },
        montototal:{ type: dataTypes.INTEGER },
        mediodepago:{ type: dataTypes.STRING },
        domicilioentrega:{ type: dataTypes.STRING },
        fechayhora:{ type: dataTypes.DATE },
        
    };
    
    let config={
        tableName:'ventas',
        timestamps:false
    }

    const Ventas=sequelize.define(alias,cols,config);
    return Ventas;
}