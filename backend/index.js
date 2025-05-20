     const express = require('express');
     cors = require('cors');
     const dotenv = require('dotenv');
     const propertyRoutes = require('./routes/properties');
     const contactRoutes = require('./routes/contacts');
     const paperworkRoutes = require('./routes/paperwork');

     // Load environment variables
     dotenv.config();

     const app = express();
     const PORT = process.env.PORT || 3001;

     // Middleware
     app.use(cors());
     app.use(express.json());

     // Routes
     app.use('/api/properties', propertyRoutes);
     app.use('/api/contacts', contactRoutes);
     app.use('/api/paperwork', paperworkRoutes);

     // Test route
     app.get('/', (req, res) => {
       res.send('Real Estate Backend API');
     });

     // Start server
     app.listen(PORT, () => {
       console.log(`Server running on port ${PORT}`);
     });
     