const { DataTypes } = require('sequelize');

     module.exports = (sequelize) => {
       const Contact = sequelize.define('Contact', {
         id: {
           type: DataTypes.INTEGER,
           primaryKey: true,
           autoIncrement: true
         },
         name: {
           type: DataTypes.STRING(100),
           allowNull: false
         },
         email: {
           type: DataTypes.STRING(100),
           allowNull: true
         },
         phone: {
           type: DataTypes.STRING(20),
           allowNull: true
         }
       }, {
         tableName: 'contacts',
         timestamps: false
       });

       return Contact;
     };
     