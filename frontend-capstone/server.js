const dbConn = require('./database/config');
const mongoose = require('mongoose');
const express = require('express');
const path = require('path');
const app = express();
const port = 3000;

require('dotenv').config();

dbConn();

// declare routes
const qaRoutes = require('./routes/questionsAnswer');
const productRoutes = require('./routes/products');
const reviewRoutes = require('./routes/reviews');

app.use(express.static('dist'));

app.use('/products', productRoutes);
app.use('/reviews', reviewRoutes);
app.use('/qa', qaRoutes);

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'dist', 'index.html'));
});

app.listen(port, () =>
  console.log(`Example app listening at http://localhost:${port}`)
);
