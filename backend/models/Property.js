const { DataTypes } = require('sequelize');

     module.exports = (sequelize) => {
       const Property = sequelize.define('Property', {
         id: {
           type: DataTypes.INTEGER,
           primaryKey: true,
           autoIncrement: true
         },
         address: {
           type: DataTypes.TEXT,
           allowNull: false
         },
         geom: {
           type: DataTypes.GEOMETRY('POLYGON', 4326),
           allowNull: true
         }
       }, {
         tableName: 'properties',
         timestamps: false
       });

       return Property;
     };
     