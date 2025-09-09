const express = require('express');
const mongoose = require('mongoose');
const User = require('./models/db');


const app = express();
app.use(express.json());

mongoose.connect('mongodb+srv://ahmedhassanc:Bholo321@hhhapp.o1bbonr.mongodb.net/?retryWrites=true&w=majority&appName=hhhapp')
  .then(() => console.log('✅ MongoDB connected'))
  .catch(err => console.error('❌ MongoDB connection error:', err));

app.post('/add-user', async (req, res) => {
  try {
    const newUser = new User(req.body);
    await newUser.save();
    res.send('User added!');
  } catch (err) {
    res.status(500).send(err);
  }
});

app.get('/users', async (req, res) => {
  const users = await User.find();
  res.json(users);
});

app.listen(4445, () => console.log('Server running on port 4445'));
