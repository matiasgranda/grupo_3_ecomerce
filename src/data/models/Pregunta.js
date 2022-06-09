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
    Pregunta.associate = function (models) {
        Pregunta.belongsTo(models.Usuarios, {
            as: 'usuarios',
            foreignKey: 'idusuario'
        });
        Pregunta.hasMany(models.Respuesta, {
            as:'respuestas',
            foreignKey: 'idrespuesta',
            targetKey: 'idpregunta'
        });
      
    }
    return Pregunta;
}