const express = require('express');
     const router = express.Router();
     const { Property, sequelize } = require('../models');

     // Get all properties with GeoJSON
     router.get('/', async (req, res) => {
       try {
         const properties = await Property.findAll({
           attributes: [
             'id',
             'address',
             [sequelize.fn('ST_AsGeoJSON', sequelize.col('geom')), 'geom']
           ]
         });
         res.json(properties.map(prop => ({
           id: prop.id,
           address: prop.address,
           geom: prop.geom ? JSON.parse(prop.geom) : null
         })));
       } catch (error) {
         res.status(500).json({ error: error.message });
       }
     });

     // Get properties near a point
     router.get('/nearby', async (req, res) => {
       const { lat, lng, radius } = req.query;
       try {
         const properties = await Property.findAll({
           attributes: [
             'id',
             'address',
             [sequelize.fn('ST_AsGeoJSON', sequelize.col('geom')), 'geom']
           ],
           where: sequelize.literal(
             `ST_DWithin(geom, ST_SetSRID(ST_MakePoint(${lng}, ${lat}), 4326), ${radius})`
           )
         });
         res.json(properties.map(prop => ({
           id: prop.id,
           address: prop.address,
           geom: prop.geom ? JSON.parse(prop.geom) : null
         })));
       } catch (error) {
         res.status(500).json({ error: error.message });
       }
     });

     // Create a property
     router.post('/', async (req, res) => {
       const { address, geom } = req.body;
       try {
         const property = await Property.create({
           address,
           geom: geom ? sequelize.fn('ST_GeomFromGeoJSON', JSON.stringify(geom)) : null
         });
         res.status(201).json(property);
       } catch (error) {
         res.status(500).json({ error: error.message });
       }
     });

     module.exports = router;
     