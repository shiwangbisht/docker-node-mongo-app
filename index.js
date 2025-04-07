const express = require('express');
const mongoose = require('mongoose');
const app = express();

mongoose.connect('mongodb://mongo:27017/dockerapp')
  .then(() => console.log('Connected to MongoDB'))
  .catch((err) => console.log(err));

app.get('/', (req, res) => {
  res.send('Hello from Dockerized Node.js App!');
});

app.listen(3000, () => console.log('Server running on port 3000'));
