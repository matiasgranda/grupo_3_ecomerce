module.exports = (Sequelize, dataTypes) => {
    let alias='Usuarios';
    let cols={
        idusuario:{
            type: Sequelize.INTEGER,
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

    const Usuario=Sequelize.define(alias,cols,config);






    return Usuario;
}