module.exports = (sequelize, dataTypes) => {
    let alias = 'Pregunta';
    let cols = {
        idpregunta: {
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        idusuario: {
            type: dataTypes.INTEGER
        },
        idpublicacion: {
            type: dataTypes.INTEGER
        },
        pregunta: {
            type: dataTypes.STRING
        },
        fechapregunta: {
            type: dataTypes.DATE
        },
        reportado: {
            type: dataTypes.INTEGER
        }
    };
    let config = {
        tableName: 'preguntas',
        timestamps: false
    }
    const Pregunta = sequelize.define(alias, cols, config);
    return Pregunta;
}