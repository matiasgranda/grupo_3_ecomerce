module.exports = (sequelize, dataTypes) => {
    let alias='Domicilios';
    let cols={
        iddomicilios:{
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        idusuario:{ type: dataTypes.INTEGER },
        calle:{ type: dataTypes.STRING },
        altura:{ type: dataTypes.INTEGER },
        piso:{ type: dataTypes.INTEGER },
        depto:{ type: dataTypes.STRING },
        idpais:{ type: dataTypes.STRING },   
        idprovincia:{ type: dataTypes.INTEGER },
        cp:{ type: dataTypes.INTEGER },
    };
    let config={
        tableName:'domicilios',
        timestamps:false
    }

    const Domicilios=sequelize.define(alias,cols,config);

    return Domicilios;
}