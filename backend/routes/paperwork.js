const express = require('express');
     const router = express.Router();
     const { Paperwork } = require('../models');

     // Get all paperwork
     router.get('/', async (req, res) => {
       try {
         const paperwork = await Paperwork.findAll();
         res.json(paperwork);
       } catch (error) {
         res.status(500).json({ error: error.message });
       }
     });

     // Create paperwork
     router.post('/', async (req, res) => {
       const { title, file_url } = req.body;
       try {
         const paperwork = await Paperwork.create({ title, file_url });
         res.status(201).json(paperwork);
       } catch (error) {
         res.status(500).json({ error: error.message });
       }
     });

     module.exports = router;
     