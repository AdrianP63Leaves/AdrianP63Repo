     const { sequelize, Contact, Property, Paperwork } = require('./models');

     async function initDb() {
       try {
         await sequelize.authenticate();
         console.log('Database connection established.');
         await sequelize.query('CREATE EXTENSION IF NOT EXISTS postgis;');
         await sequelize.sync({ force: true });

         // Insert sample data
         await Contact.bulkCreate([
           { name: 'John Doe', email: 'john@example.com', phone: '123-456-7890' },
           { name: 'Jane Smith', email: 'jane@example.com', phone: '098-765-4321' }
         ]);

         await Property.bulkCreate([
           {
             address: '123 Main St, London',
             geom: sequelize.fn('ST_SetSRID', sequelize.fn('ST_GeomFromText', 'POLYGON((-0.09 51.505, -0.08 51.505, -0.08 51.506, -0.09 51.506, -0.09 51.505))'), 4326)
           },
           {
             address: '456 High St, London',
             geom: sequelize.fn('ST_SetSRID', sequelize.fn('ST_GeomFromText', 'POLYGON((-0.1 51.5, -0.09 51.5, -0.09 51.501, -0.1 51.501, -0.1 51.5))'), 4326)
           }
         ]);

         await Paperwork.bulkCreate([
           { title: 'Deed for 123 Main St', file_url: 'http://example.com/deed1.pdf' },
           { title: 'Permit for 456 High St', file_url: 'http://example.com/permit1.pdf' }
         ]);

         // Associate data
         const contact = await Contact.findOne({ where: { name: 'John Doe' } });
         const property = await Property.findOne({ where: { address: '123 Main St, London' } });
         const paperwork = await Paperwork.findOne({ where: { title: 'Deed for 123 Main St' } });
         await contact.addProperty(property);
         await property.addPaperwork(paperwork);

         console.log('Database synced with sample data.');
       } catch (error) {
         console.error('Error initializing database:', error);
       } finally {
         await sequelize.close();
       }
     }

     initDb();
     