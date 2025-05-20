const { Sequelize } = require('sequelize');
     const dotenv = require('dotenv');

     dotenv.config();

     const sequelize = new Sequelize(process.env.DATABASE_URL, {
       dialect: 'postgres',
       logging: false
     });

     const Contact = require('./Contact')(sequelize);
     const Property = require('./Property')(sequelize);
     const Paperwork = require('./Paperwork')(sequelize);

     // Define many-to-many relationships
     Contact.belongsToMany(Property, { through: 'contact_property', foreignKey: 'contact_id' });
     Property.belongsToMany(Contact, { through: 'contact_property', foreignKey: 'property_id' });

     Property.belongsToMany(Paperwork, { through: 'property_paperwork', foreignKey: 'property_id' });
     Paperwork.belongsToMany(Property, { through: 'property_paperwork', foreignKey: 'paperwork_id' });

     Contact.belongsToMany(Paperwork, { through: 'contact_paperwork', foreignKey: 'contact_id' });
     Paperwork.belongsToMany(Contact, { through: 'contact_paperwork', foreignKey: 'paperwork_id' });

     module.exports = {
       sequelize,
       Contact,
       Property,
       Paperwork
     };
     