const { DataTypes } = require('sequelize');

     module.exports = (sequelize) => {
       const Paperwork = sequelize.define('Paperwork', {
         id: {
           type: DataTypes.INTEGER,
           primaryKey: true,
           autoIncrement: true
         },
         title: {
           type: DataTypes.STRING(100),
           allowNull: false
         },
         file_url: {
           type: DataTypes.TEXT,
           allowNull: true
         }
       }, {
         tableName: 'paperwork',
         timestamps: false
       });

       return Paperwork;
     };
     