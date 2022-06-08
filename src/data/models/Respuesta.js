module.exports = (sequelize, dataTypes) => {
    let alias = 'Respuesta';
    let cols = {
        idrespuesta: {
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        idpregunta: {
            type: dataTypes.INTEGER
        },
        respuesta: {
            type: dataTypes.STRING
        },
        fecharespuesta: {
            type: dataTypes.DATE
        },
        reportado: {
            type: dataTypes.INTEGER
        }

    }
    let config = {
        tableName: 'respuestas',
        timestamps: false
    }
    
        const Respuesta = sequelize.define(alias, cols, config);
        return Respuesta;
}