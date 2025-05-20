const express = require('express');
     const router = express.Router();
     const { Contact } = require('../models');

     // Get all contacts
     router.get('/', async (req, res) => {
       try {
         const contacts = await Contact.findAll();
         res.json(contacts);
       } catch (error) {
         res.status(500).json({ error: error.message });
       }
     });

     // Create a contact
     router.post('/', async (req, res) => {
       const { name, email, phone } = req.body;
       try {
         const contact = await Contact.create({ name, email, phone });
         res.status(201).json(contact);
       } catch (error) {
         res.status(500).json({ error: error.message });
       }
     });

     module.exports = router;
     