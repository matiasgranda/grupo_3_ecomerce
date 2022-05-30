module.exports = (sequelize,dataTypes) => {
    let alias='Usuarios';
    let cols={
        idusuario:{
            types: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        nombre:{ type: Sequelize.STRING },
        apellido:{ type: Sequelize.STRING },
        telefono:{ type: Sequelize.STRING },
        fechanac:{ type: Sequelize.DATE },
        email:{ type: Sequelize.STRING },
        usuario:{ type: Sequelize.STRING },
        password:{ type: Sequelize.STRING },
        habilitado:{ type: Sequelize.INTEGER }
    };
    let config={
        tableName:'usuarios',
        timestamps:false
    }

    const Usuario=sequelize.define(alias,cols,config);






    return Usuario;
}